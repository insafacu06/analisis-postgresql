# Capstone: Análisis Exploratorio de Datos (EDA) en PostgreSQL
## StreamShop — Tienda de merchandising oficial de una plataforma de streaming

## 1. Problema de negocio

StreamShop es la tienda de merchandising oficial de una plataforma de streaming (remeras, coleccionables, tecnología y artículos de hogar con la marca de la plataforma). El equipo comercial necesita responder tres preguntas para tomar decisiones concretas:

1. **¿Quiénes son los clientes más valiosos?** Para priorizarlos en una campaña de fidelización.
2. **¿En qué meses se concentran las ventas?** Para planificar stock y campañas de marketing con anticipación.
3. **¿Qué productos del catálogo no están rotando?** Para decidir si liquidarlos o descontinuarlos.

Los datos de partida tenían un problema típico de sistemas de carga manual: un porcentaje de los pedidos no tenía cargado el precio unitario o el descuento aplicado, lo que distorsionaba cualquier cálculo de ventas si no se trataba correctamente.

## 2. Estructura de datos

- **clientes** (40 registros): id, nombre, email, fecha de alta.
- **productos** (15 registros, 5 categorías: Indumentaria, Accesorios, Coleccionables, Tecnología, Hogar): id, nombre, categoría, precio de lista, marca.
- **pedidos** (281 registros, año 2025): id, cliente, producto, cantidad, precio unitario, descuento, fecha.

## 3. Limpieza de datos aplicada

Se detectaron nulos en dos columnas críticas:

| Columna | Pedidos con NULL | Decisión de limpieza |
|---|---|---|
| `precio_unitario` | 22 de 281 | Se completa con `productos.precio` (precio de lista), asumiendo que la venta se hizo al precio estándar y el dato no se cargó |
| `descuento` | 109 de 281 | Se completa con `0`, ya que un descuento no registrado equivale a que no se aplicó ninguno |

Ambas correcciones se implementan con `COALESCE` dentro de una vista (`pedidos_limpios`) para no repetir la lógica en cada consulta de análisis.

## 4. Hallazgos principales

**Top 5 clientes por gasto total:** el cliente líder acumuló **$549.400** en 15 pedidos durante el año, seguido de cerca por otro cliente con **$530.500** mediante 25 pedidos más frecuentes pero de menor ticket promedio. Esto sugiere dos perfiles de cliente valioso distintos: compra grande y esporádica vs. compra frecuente y menor — ambos merecen estrategias de fidelización diferentes (el primero con beneficios exclusivos, el segundo con programas de puntos por frecuencia).

**Estacionalidad de ventas:** las ventas no son parejas en el año. **Julio fue el mes de mayor facturación ($1.091.000)**, más del doble que el mes más bajo (enero, $308.400). Octubre y septiembre también muestran picos ($792.200 y $692.000). Esto marca una clara concentración en mitad y fin de año, útil para anticipar stock y reforzar campañas antes de esos meses en vez de repartir el presupuesto de marketing de forma pareja.

**Productos de baja rotación:** los tres productos con menos unidades vendidas fueron **Almohadón Decorativo** y **Llavero Metálico** (6 unidades cada uno) y **Manta Polar Edición Especial** (12 unidades). Los dos primeros son candidatos claros a liquidación o descontinuación; la Manta, al tener el doble de unidades que los otros dos, podría sostenerse con una promoción puntual antes de sacarla del catálogo.

**Pedido de mayor valor por categoría (ranking con `RANK()`):** al rankear los pedidos dentro de cada categoría, se observa que **Tecnología concentra el pedido individual más alto de todo el catálogo ($126.000)**, muy por encima del máximo de las demás categorías (Coleccionables $84.000, Indumentaria $44.600, Hogar $37.400, Accesorios $63.000). Esto indica que, aunque Tecnología no necesariamente es la categoría con más unidades vendidas, es la que genera los tickets individuales más grandes — un buen argumento para priorizarla en estrategias de upselling o combos, ya que un solo cliente convencido de comprar en esta categoría aporta tanto como varias ventas de otras categorías juntas.

## 5. Cómo ejecutar el código

1. Crear la base de datos:
   ```sql
   CREATE DATABASE capstone_project;
   ```
2. Conectarse a `capstone_project` y ejecutar `estructura.sql` (crea las tablas y carga los datos).
3. Ejecutar `analisis.sql` (limpieza de datos + las 4 consultas de análisis de negocio).

Probado en PostgreSQL 16 sin errores de sintaxis.

## 6. Archivos del repositorio

- `estructura.sql`: creación de tablas (clientes, productos, pedidos) y carga de datos.
- `analisis.sql`: limpieza de datos con `COALESCE` y consultas de análisis (top clientes, ventas por mes, productos menos vendidos, ranking por categoría con `RANK()`).
- `README.md`: este documento.
