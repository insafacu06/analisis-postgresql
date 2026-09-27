-- ============================================================
-- CAPSTONE: Analisis Exploratorio de Datos (EDA) en PostgreSQL
-- analisis.sql
-- Requiere haber corrido estructura.sql antes.
-- ============================================================

-- ============================================================
-- ETAPA 1: LIMPIEZA DE DATOS
-- ============================================================

-- Diagnostico: ¿cuantos pedidos tienen datos criticos en NULL?
-- Lo revisamos antes de decidir como tratarlos, no a ciegas.
SELECT
    COUNT(*) FILTER (WHERE precio_unitario IS NULL) AS pedidos_sin_precio,
    COUNT(*) FILTER (WHERE descuento IS NULL)       AS pedidos_sin_descuento,
    COUNT(*) AS total_pedidos
FROM pedidos;

-- Decision de limpieza:
--   - precio_unitario NULL -> lo completamos con el precio de lista del
--     producto (productos.precio), asumiendo que se vendio al precio
--     estandar y el dato simplemente no se cargo en el sistema de origen.
--   - descuento NULL -> lo tratamos como 0 (sin descuento aplicado),
--     porque un descuento "desconocido" en este negocio equivale a
--     "no se aplico ninguno", no a un valor faltante que deba imputarse.
--
-- Creamos una vista con los datos ya limpios para no repetir la logica
-- de COALESCE en cada consulta de analisis.
CREATE OR REPLACE VIEW pedidos_limpios AS
SELECT
    p.id,
    p.cliente_id,
    p.producto_id,
    p.cantidad,
    COALESCE(p.precio_unitario, pr.precio) AS precio_unitario,
    COALESCE(p.descuento, 0)               AS descuento,
    p.fecha,
    -- monto_final: lo que realmente pago el cliente por esa linea de pedido
    (p.cantidad * COALESCE(p.precio_unitario, pr.precio)) - COALESCE(p.descuento, 0) AS monto_final
FROM pedidos p
JOIN productos pr ON pr.id = p.producto_id;

-- Verificacion: ya no deberia haber NULLs en las columnas criticas
SELECT COUNT(*) AS filas_con_nulos_pendientes
FROM pedidos_limpios
WHERE precio_unitario IS NULL OR monto_final IS NULL;


-- ============================================================
-- ETAPA 2: ANALISIS DE NEGOCIO
-- ============================================================

-- ------------------------------------------------------------
-- 2.1) TOP 5 CLIENTES POR GASTO TOTAL (GROUP BY + SUM)
-- Pregunta de negocio: ¿quienes son nuestros clientes mas valiosos,
-- para priorizarlos en una campaña de fidelizacion?
-- ------------------------------------------------------------
SELECT
    c.id,
    c.nombre,
    COUNT(pl.id)               AS cantidad_pedidos,
    SUM(pl.monto_final)        AS gasto_total
FROM pedidos_limpios pl
JOIN clientes c ON c.id = pl.cliente_id
GROUP BY c.id, c.nombre
ORDER BY gasto_total DESC
LIMIT 5;


-- ------------------------------------------------------------
-- 2.2) VENTAS TOTALES POR MES (funcion de fecha)
-- Pregunta de negocio: ¿en que meses se concentran las ventas?
-- Sirve para planificar stock y campañas con anticipacion.
-- ------------------------------------------------------------
SELECT
    DATE_TRUNC('month', fecha)::DATE AS mes,
    SUM(monto_final)                 AS ventas_totales,
    COUNT(*)                         AS cantidad_pedidos
FROM pedidos_limpios
GROUP BY DATE_TRUNC('month', fecha)
ORDER BY mes;


-- ------------------------------------------------------------
-- 2.3) 3 PRODUCTOS MENOS VENDIDOS (por unidades)
-- Pregunta de negocio: ¿que productos del catalogo no estan
-- rotando? Candidatos a liquidar o sacar del catalogo.
-- ------------------------------------------------------------
SELECT
    pr.id,
    pr.nombre,
    pr.categoria,
    COALESCE(SUM(pl.cantidad), 0) AS unidades_vendidas
FROM productos pr
LEFT JOIN pedidos_limpios pl ON pl.producto_id = pr.id
GROUP BY pr.id, pr.nombre, pr.categoria
ORDER BY unidades_vendidas ASC
LIMIT 3;


-- ------------------------------------------------------------
-- 2.4) RANKING DE PEDIDOS POR CATEGORIA (Window Function: RANK())
-- Pregunta de negocio: dentro de cada categoria de producto,
-- ¿cuales son los pedidos de mayor monto? Util para detectar
-- que tipo de compra "grande" empuja a cada categoria.
-- ------------------------------------------------------------
-- Se usa una subconsulta para poder filtrar por el resultado de
-- la Window Function (RANK no se puede filtrar directo en WHERE
-- porque se calcula despues del WHERE en el orden de ejecucion).
-- Se limita a los primeros 3 puestos DE CADA categoria (no un LIMIT
-- global), para que las 5 categorias queden representadas.
SELECT categoria, pedido_id, cliente, monto_final, ranking_en_categoria
FROM (
    SELECT
        pr.categoria,
        pl.id                AS pedido_id,
        c.nombre              AS cliente,
        pl.monto_final,
        RANK() OVER (
            PARTITION BY pr.categoria
            ORDER BY pl.monto_final DESC
        ) AS ranking_en_categoria
    FROM pedidos_limpios pl
    JOIN productos pr ON pr.id = pl.producto_id
    JOIN clientes c   ON c.id = pl.cliente_id
) ranking_completo
WHERE ranking_en_categoria <= 3
ORDER BY categoria, ranking_en_categoria;
