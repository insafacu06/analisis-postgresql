-- ============================================================
-- CAPSTONE: Analisis Exploratorio de Datos (EDA) en PostgreSQL
-- estructura.sql
-- Contexto: "StreamShop" - tienda de merchandising oficial de una
-- plataforma de streaming (remeras, coleccionables, tecnologia, etc.)
-- ============================================================

-- Ejecutar primero (fuera de este script, conectado a la base "postgres"):
--   CREATE DATABASE capstone_project;
-- Luego conectarse a capstone_project y correr el resto de este archivo.

-- ------------------------------------------------------------
-- 1) TABLA CLIENTES
-- ------------------------------------------------------------
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;

CREATE TABLE clientes (
    id           INTEGER PRIMARY KEY,
    nombre       VARCHAR(100) NOT NULL,
    email        VARCHAR(150),
    fecha_alta   DATE
);

-- ------------------------------------------------------------
-- 2) TABLA PRODUCTOS
-- ------------------------------------------------------------
CREATE TABLE productos (
    id           INTEGER PRIMARY KEY,
    nombre       VARCHAR(150) NOT NULL,
    categoria    VARCHAR(50)  NOT NULL,
    precio       NUMERIC(10,2) NOT NULL,
    marca        VARCHAR(50)
);

-- ------------------------------------------------------------
-- 3) TABLA PEDIDOS
-- precio_unitario y descuento pueden venir NULL desde el sistema
-- de origen (carga manual incompleta) -> se resuelve en analisis.sql
-- ------------------------------------------------------------
CREATE TABLE pedidos (
    id               INTEGER PRIMARY KEY,
    cliente_id       INTEGER NOT NULL REFERENCES clientes(id),
    producto_id      INTEGER NOT NULL REFERENCES productos(id),
    cantidad         INTEGER NOT NULL,
    precio_unitario  NUMERIC(10,2),
    descuento        NUMERIC(10,2),
    fecha            DATE NOT NULL
);

-- ------------------------------------------------------------
-- 4) CARGA DE DATOS
-- ------------------------------------------------------------

-- 4.1) Clientes
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (1, 'Benjamin Perez Diaz', 'peraltauma@example.org', '2025-10-07');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (2, 'Martina Diaz Gimenez', 'castrothiago-agustin@example.net', '2025-09-08');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (3, 'Tomàs Victoria Aguero', 'genaroromero@example.org', '2025-02-09');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (4, 'Santino Olivia Sosa Romero', 'micaela78@example.org', '2026-06-08');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (5, 'Bautista Garcia', 'dante10@example.net', '2025-02-17');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (6, 'Lucas Ezequiel Ian Aguero Alvarez', 'xgodoy@example.org', '2025-05-19');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (7, 'Valentina  Constanza Castillo', 'cabrerajoaquin@example.net', '2025-02-28');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (8, 'Olivia Olivera', 'ramiromansilla@example.org', '2025-02-18');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (9, 'Luciana Ruiz Rodriguez', 'delfina76@example.net', '2025-07-15');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (10, 'Valentino Maria Emilia Rojas Cardozo', 'zmendoza@example.com', '2025-02-12');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (11, 'Bianca Catalina Gonzalez', 'fernandezmateo@example.net', '2025-06-21');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (12, 'Olivia Luna Herrera', 'emanuel01@example.net', '2026-04-13');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (13, 'Camilo Alma Garcia Fernandez', 'moyanothiago-lionel@example.com', '2026-06-08');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (14, 'Bianca Santino Morales', 'felipecoronel@example.net', '2026-05-27');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (15, 'Sr(a). Matias Suarez', 'soriaemiliano@example.com', '2025-02-25');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (16, 'Enzo Abigail Rodriguez', 'wmaldonado@example.net', '2026-01-27');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (17, 'Milagros Abigail Lopez', 'isoto@example.net', '2025-12-09');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (18, 'Camila Felicitas Torres Mendoza', 'ogomez@example.org', '2025-04-29');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (19, 'Sr(a). Salvador Gonzalez', 'martinezmia-morena@example.com', '2024-11-09');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (20, 'Victoria Pilar Rojas', 'emartinez@example.com', '2025-01-24');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (21, 'Milagros Sosa Ramirez', 'peraltadylan-benjamin@example.org', '2024-11-02');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (22, 'Juan Santino Lopez Rojas', 'cirogarcia@example.org', '2026-04-06');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (23, 'Simon Guzman Molina', 'ferreyrajuan-pablo@example.org', '2026-06-06');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (24, 'Mateo Pilar Diaz', 'kmendoza@example.com', '2024-09-26');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (25, 'Thiago Benjamin Vargas', 'sgarcia@example.net', '2026-06-23');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (26, 'Dr(a). Felipe Garcia', 'silvajuan-pablo@example.net', '2025-04-13');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (27, 'Maria Victoria Gimenez Roldan', 'isabellagimenez@example.org', '2024-11-07');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (28, 'Amparo Martinez Gomez', 'claragonzalez@example.org', '2025-06-19');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (29, 'Dr(a). Lucas Benjamin Diaz', 'emma62@example.net', '2025-11-11');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (30, 'Josefina Cardozo', 'gonzalezjulian@example.net', '2026-06-23');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (31, 'Mateo Benjamin Gimenez Fernandez', 'justina35@example.com', '2025-01-03');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (32, 'Dr(a). Tomas Olivera', 'carrizolautaro-benjamin@example.net', '2024-11-30');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (33, 'Thiago Benjamin Mateo Agustin Villalba', 'victoriajuarez@example.net', '2025-05-02');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (34, 'Juan Bautista Valentina Bustos Rodriguez', 'crivero@example.org', '2025-04-26');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (35, 'Luca Thiago Benjamin Villalba', 'hcastro@example.org', '2026-05-21');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (36, 'Manuel Miguel Angel Nuñez', 'pedrogonzalez@example.com', '2026-04-22');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (37, 'Tiziano Valentin Diaz Martinez', 'sosalucas@example.com', '2026-06-09');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (38, 'Gabriel Emma Lopez', 'justinagonzalez@example.net', '2026-05-08');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (39, 'Benjamin Ezequiel Guzman', 'thiago-benjamincaceres@example.org', '2025-05-27');
INSERT INTO clientes (id, nombre, email, fecha_alta) VALUES (40, 'Alma Mia Diaz Maldonado', 'ysosa@example.org', '2025-02-14');

-- 4.2) Productos
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (1, 'Remera Logo StreamPlay', 'Indumentaria', 8500, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (2, 'Buzo Oversize StreamPlay', 'Indumentaria', 15200, NULL);
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (3, 'Gorra Bordada', 'Accesorios', 6300, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (4, 'Mochila Urbana', 'Accesorios', 21000, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (5, 'Termo Acero Inoxidable', 'Accesorios', 9800, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (6, 'Funko Pop Serie Original', 'Coleccionables', 12500, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (7, 'Figura Coleccionable Edición Limitada', 'Coleccionables', 28000, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (8, 'Poster Serie Exclusiva', 'Coleccionables', 4200, NULL);
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (9, 'Auriculares Bluetooth', 'Tecnologia', 34500, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (10, 'Parlante Portátil', 'Tecnologia', 42000, NULL);
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (11, 'Soporte Celular Escritorio', 'Tecnologia', 5600, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (12, 'Taza Térmica Personajes', 'Hogar', 6800, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (13, 'Almohadón Decorativo', 'Hogar', 11200, NULL);
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (14, 'Manta Polar Edición Especial', 'Hogar', 18700, 'Generica');
INSERT INTO productos (id, nombre, categoria, precio, marca) VALUES (15, 'Llavero Metálico', 'Accesorios', 2500, 'Generica');

-- 4.3) Pedidos
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (1, 29, 10, 1, 42000, 0, '2025-07-08');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (2, 18, 3, 1, 6300, NULL, '2025-10-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (3, 23, 10, 1, NULL, 0, '2025-06-12');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (4, 6, 9, 1, 34500, 0, '2025-12-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (5, 5, 1, 1, 8500, 0, '2025-08-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (6, 18, 8, 1, 4200, 0, '2025-11-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (7, 5, 10, 1, 42000, NULL, '2025-09-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (8, 36, 4, 1, 21000, 0, '2025-07-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (9, 21, 7, 1, 28000, 1500, '2025-11-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (10, 32, 7, 2, 28000, NULL, '2025-05-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (11, 36, 9, 1, 34500, 500, '2025-03-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (12, 33, 8, 1, NULL, NULL, '2025-06-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (13, 28, 10, 1, 42000, 1000, '2025-09-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (14, 1, 11, 2, 5600, 0, '2025-04-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (15, 8, 5, 1, 9800, 1500, '2025-10-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (16, 12, 9, 2, 34500, NULL, '2025-05-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (17, 13, 3, 1, 6300, 1000, '2025-09-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (18, 21, 8, 1, 4200, 0, '2025-12-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (19, 37, 2, 1, 15200, NULL, '2025-04-08');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (20, 9, 3, 1, 6300, NULL, '2025-10-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (21, 28, 4, 3, 21000, 1500, '2025-07-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (22, 24, 8, 2, 4200, NULL, '2025-05-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (23, 38, 9, 1, 34500, NULL, '2025-02-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (25, 35, 3, 2, 6300, 0, '2025-09-07');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (26, 27, 4, 1, 21000, 500, '2025-11-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (27, 4, 11, 1, 5600, NULL, '2025-07-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (28, 7, 4, 1, 21000, NULL, '2025-10-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (31, 31, 4, 2, 21000, NULL, '2025-03-16');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (33, 32, 3, 1, 6300, NULL, '2025-12-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (34, 21, 1, 1, 8500, 1000, '2025-10-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (36, 16, 10, 1, 42000, 1000, '2025-06-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (37, 17, 4, 1, 21000, NULL, '2025-08-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (38, 20, 8, 1, 4200, NULL, '2025-03-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (39, 7, 2, 1, 15200, NULL, '2025-07-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (40, 16, 6, 1, 12500, 0, '2025-06-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (41, 34, 1, 1, 8500, 0, '2025-08-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (42, 17, 2, 2, 15200, NULL, '2025-12-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (43, 22, 4, 1, 21000, 0, '2025-05-07');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (44, 4, 2, 1, 15200, NULL, '2025-12-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (45, 17, 3, 2, 6300, 0, '2025-06-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (46, 10, 9, 1, 34500, 500, '2025-02-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (47, 24, 15, 3, 2500, NULL, '2025-03-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (48, 16, 11, 1, 5600, 500, '2025-06-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (50, 12, 12, 3, 6800, 1500, '2025-12-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (51, 16, 5, 1, 9800, 0, '2025-11-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (52, 13, 14, 2, 18700, 0, '2025-11-08');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (53, 13, 7, 1, 28000, 0, '2025-04-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (54, 26, 11, 3, 5600, 0, '2025-06-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (55, 12, 10, 3, 42000, NULL, '2025-12-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (56, 21, 7, 1, 28000, 1000, '2025-07-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (57, 28, 1, 1, 8500, 1500, '2025-04-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (58, 24, 7, 1, 28000, NULL, '2025-10-07');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (59, 8, 12, 2, 6800, 0, '2025-05-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (60, 36, 3, 1, 6300, 1500, '2025-06-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (61, 37, 5, 1, 9800, NULL, '2025-12-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (62, 38, 10, 1, 42000, 0, '2025-04-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (63, 11, 11, 1, 5600, 0, '2025-07-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (64, 16, 11, 1, 5600, NULL, '2025-02-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (66, 25, 8, 1, 4200, 0, '2025-04-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (68, 8, 8, 1, 4200, 1000, '2025-04-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (69, 29, 10, 2, 42000, 1000, '2025-08-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (70, 31, 8, 1, 4200, 1000, '2025-07-06');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (71, 18, 8, 1, 4200, NULL, '2025-07-08');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (72, 6, 3, 1, 6300, NULL, '2025-05-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (73, 27, 6, 1, 12500, NULL, '2025-04-14');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (74, 38, 12, 1, 6800, 500, '2025-06-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (77, 26, 12, 1, 6800, NULL, '2025-06-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (78, 26, 10, 1, NULL, 0, '2025-09-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (79, 4, 5, 1, 9800, NULL, '2025-11-06');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (81, 4, 6, 1, NULL, 0, '2025-01-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (83, 14, 8, 1, 4200, NULL, '2025-09-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (85, 37, 11, 2, 5600, 0, '2025-01-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (86, 16, 2, 1, 15200, 0, '2025-02-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (87, 3, 6, 1, 12500, NULL, '2025-11-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (88, 27, 14, 1, 18700, 500, '2025-09-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (89, 12, 12, 1, 6800, 1000, '2025-10-14');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (92, 12, 8, 1, 4200, NULL, '2025-07-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (93, 18, 9, 1, 34500, NULL, '2025-12-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (95, 19, 4, 1, 21000, 0, '2025-11-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (96, 23, 7, 3, 28000, 500, '2025-07-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (97, 15, 2, 2, 15200, 1500, '2025-05-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (98, 31, 5, 2, 9800, 0, '2025-04-07');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (99, 13, 5, 1, 9800, NULL, '2025-12-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (100, 3, 1, 1, 8500, NULL, '2025-07-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (103, 4, 3, 1, 6300, NULL, '2025-08-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (105, 20, 14, 1, 18700, 0, '2025-06-15');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (107, 5, 3, 1, 6300, 0, '2025-04-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (108, 19, 12, 2, NULL, NULL, '2025-01-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (109, 38, 11, 2, 5600, NULL, '2025-05-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (111, 19, 8, 1, 4200, 0, '2025-10-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (112, 29, 2, 1, 15200, 1000, '2025-07-16');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (113, 15, 11, 2, 5600, 1500, '2025-04-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (115, 28, 11, 2, 5600, 500, '2025-04-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (117, 36, 1, 1, 8500, NULL, '2025-12-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (119, 24, 10, 2, 42000, 0, '2025-01-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (120, 19, 8, 2, 4200, NULL, '2025-05-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (121, 16, 12, 1, 6800, 0, '2025-09-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (122, 8, 8, 3, 4200, NULL, '2025-04-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (123, 33, 12, 1, 6800, 0, '2025-12-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (124, 25, 4, 3, 21000, 0, '2025-07-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (125, 27, 6, 3, 12500, 0, '2025-05-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (126, 38, 10, 3, 42000, NULL, '2025-10-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (127, 22, 9, 2, 34500, 0, '2025-07-12');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (128, 37, 7, 1, 28000, NULL, '2025-12-08');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (129, 25, 7, 3, 28000, 0, '2025-10-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (130, 9, 9, 3, 34500, NULL, '2025-07-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (133, 35, 7, 3, 28000, 500, '2025-02-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (134, 40, 2, 1, 15200, NULL, '2025-11-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (135, 28, 2, 2, 15200, NULL, '2025-04-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (136, 2, 1, 1, NULL, 500, '2025-03-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (137, 27, 10, 1, 42000, NULL, '2025-03-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (138, 40, 11, 1, 5600, NULL, '2025-08-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (139, 30, 5, 1, 9800, 0, '2025-07-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (140, 5, 8, 3, 4200, NULL, '2025-09-06');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (141, 17, 8, 2, 4200, 500, '2025-12-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (142, 37, 6, 1, 12500, NULL, '2025-02-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (143, 26, 5, 1, 9800, 0, '2025-12-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (145, 13, 10, 1, 42000, 1500, '2025-11-08');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (147, 9, 2, 2, 15200, 0, '2025-08-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (148, 24, 9, 1, 34500, NULL, '2025-03-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (149, 19, 12, 2, 6800, 0, '2025-12-16');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (151, 30, 6, 1, 12500, 1500, '2025-05-04');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (152, 15, 8, 1, 4200, 1000, '2025-12-04');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (154, 20, 8, 1, 4200, 500, '2025-01-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (155, 35, 7, 1, 28000, 1500, '2025-07-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (156, 40, 7, 3, 28000, 0, '2025-02-16');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (157, 24, 2, 3, 15200, 1500, '2025-07-08');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (158, 18, 4, 3, 21000, 0, '2025-06-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (159, 39, 1, 1, 8500, 1000, '2025-09-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (160, 36, 4, 1, 21000, NULL, '2025-04-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (161, 39, 1, 1, 8500, 1000, '2025-11-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (162, 8, 11, 2, 5600, 0, '2025-04-06');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (163, 12, 5, 1, 9800, 1500, '2025-08-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (164, 24, 9, 1, 34500, NULL, '2025-02-15');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (165, 34, 5, 1, 9800, NULL, '2025-08-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (166, 28, 11, 1, 5600, 0, '2025-07-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (167, 5, 3, 1, 6300, 0, '2025-05-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (168, 34, 5, 1, 9800, NULL, '2025-06-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (169, 36, 12, 2, 6800, 500, '2025-10-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (170, 26, 7, 2, 28000, NULL, '2025-06-15');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (171, 31, 2, 1, 15200, 1500, '2025-05-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (172, 9, 9, 1, 34500, 1500, '2025-10-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (173, 28, 14, 2, NULL, NULL, '2025-03-12');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (174, 37, 9, 1, 34500, NULL, '2025-05-04');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (175, 36, 6, 1, 12500, NULL, '2025-02-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (176, 40, 10, 1, 42000, 1500, '2025-06-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (177, 2, 3, 1, 6300, 0, '2025-11-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (178, 10, 10, 1, NULL, 0, '2025-01-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (179, 14, 7, 1, 28000, 1500, '2025-02-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (180, 39, 2, 2, 15200, 0, '2025-06-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (181, 29, 11, 1, 5600, 0, '2025-09-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (182, 23, 7, 1, 28000, 1000, '2025-10-04');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (183, 15, 7, 3, NULL, NULL, '2025-09-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (184, 9, 13, 1, 11200, NULL, '2025-12-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (185, 9, 7, 1, 28000, 1500, '2025-10-06');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (186, 26, 14, 2, 18700, 0, '2025-11-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (187, 28, 10, 1, 42000, NULL, '2025-11-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (188, 11, 13, 3, 11200, 0, '2025-06-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (189, 7, 4, 1, 21000, NULL, '2025-02-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (190, 22, 4, 1, 21000, 0, '2025-11-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (191, 23, 6, 2, 12500, 0, '2025-07-07');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (192, 13, 3, 1, 6300, 0, '2025-02-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (193, 32, 8, 2, 4200, 1000, '2025-12-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (195, 18, 10, 1, 42000, NULL, '2025-07-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (196, 24, 14, 1, 18700, 0, '2025-07-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (197, 25, 8, 1, 4200, 0, '2025-08-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (198, 37, 11, 1, 5600, 0, '2025-07-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (199, 22, 12, 1, 6800, NULL, '2025-07-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (200, 34, 9, 1, 34500, 500, '2025-10-15');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (201, 39, 1, 2, 8500, NULL, '2025-06-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (202, 25, 5, 1, 9800, 1000, '2025-02-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (203, 6, 10, 1, 42000, NULL, '2025-11-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (204, 26, 3, 1, 6300, NULL, '2025-09-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (206, 28, 9, 1, 34500, NULL, '2025-12-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (207, 32, 4, 1, 21000, NULL, '2025-04-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (209, 40, 3, 1, 6300, NULL, '2025-06-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (210, 11, 12, 1, 6800, 0, '2025-09-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (212, 31, 15, 2, 2500, 500, '2025-12-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (213, 25, 9, 1, 34500, 1000, '2025-07-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (214, 4, 11, 1, 5600, 1500, '2025-03-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (215, 8, 5, 1, 9800, 1000, '2025-11-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (217, 26, 9, 1, 34500, NULL, '2025-01-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (219, 31, 12, 2, 6800, 1000, '2025-01-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (220, 2, 5, 1, 9800, 1000, '2025-01-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (221, 19, 4, 1, NULL, 1000, '2025-07-04');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (222, 32, 10, 1, 42000, 1500, '2025-07-04');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (223, 1, 10, 1, 42000, NULL, '2025-03-14');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (224, 24, 2, 3, 15200, 1000, '2025-09-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (225, 31, 1, 1, 8500, NULL, '2025-08-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (226, 5, 6, 1, 12500, NULL, '2025-01-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (227, 22, 3, 1, 6300, 0, '2025-08-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (228, 30, 12, 1, 6800, NULL, '2025-11-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (229, 3, 5, 1, 9800, 0, '2025-10-15');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (233, 34, 5, 2, 9800, NULL, '2025-09-12');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (234, 12, 9, 1, 34500, NULL, '2025-08-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (235, 39, 12, 1, 6800, 0, '2025-05-15');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (236, 40, 7, 1, 28000, 0, '2025-10-12');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (237, 24, 9, 2, 34500, 0, '2025-09-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (238, 29, 1, 1, 8500, 0, '2025-11-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (239, 3, 10, 1, 42000, 500, '2025-06-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (240, 9, 9, 1, 34500, NULL, '2025-10-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (241, 12, 8, 1, 4200, NULL, '2025-12-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (242, 29, 4, 3, 21000, 500, '2025-11-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (243, 5, 8, 1, 4200, 1500, '2025-04-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (244, 23, 12, 1, 6800, 0, '2025-12-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (245, 12, 13, 1, 11200, 0, '2025-10-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (246, 2, 6, 1, 12500, 1000, '2025-04-16');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (247, 5, 5, 1, 9800, 500, '2025-03-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (248, 37, 2, 1, 15200, NULL, '2025-10-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (249, 23, 3, 2, 6300, 0, '2025-07-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (250, 28, 9, 2, NULL, NULL, '2025-10-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (251, 11, 6, 3, 12500, 1000, '2025-03-06');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (252, 6, 5, 1, 9800, NULL, '2025-12-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (253, 35, 2, 1, 15200, 0, '2025-09-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (254, 39, 6, 2, 12500, 0, '2025-03-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (255, 37, 5, 1, 9800, 1500, '2025-02-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (256, 35, 5, 1, 9800, NULL, '2025-01-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (257, 20, 8, 1, NULL, 500, '2025-11-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (258, 39, 3, 1, 6300, 0, '2025-07-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (259, 24, 9, 1, 34500, 0, '2025-12-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (260, 7, 1, 1, 8500, 0, '2025-07-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (262, 32, 6, 1, 12500, 1000, '2025-12-07');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (263, 11, 7, 1, 28000, 1000, '2025-05-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (264, 11, 10, 2, 42000, NULL, '2025-06-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (265, 32, 5, 3, 9800, 0, '2025-06-15');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (267, 13, 9, 1, NULL, 1000, '2025-04-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (269, 37, 10, 1, 42000, 500, '2025-06-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (270, 37, 6, 2, 12500, 0, '2025-07-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (271, 32, 10, 1, NULL, 1000, '2025-08-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (272, 21, 1, 2, 8500, NULL, '2025-03-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (273, 21, 7, 2, 28000, 1000, '2025-07-14');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (274, 11, 12, 1, 6800, NULL, '2025-11-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (275, 13, 6, 3, 12500, 500, '2025-09-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (276, 37, 10, 1, 42000, NULL, '2025-09-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (277, 37, 12, 1, 6800, NULL, '2025-05-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (278, 37, 5, 1, 9800, 1000, '2025-06-26');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (279, 21, 5, 1, 9800, NULL, '2025-11-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (280, 37, 12, 1, 6800, 500, '2025-12-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (281, 32, 4, 1, 21000, 0, '2025-03-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (282, 37, 12, 1, 6800, NULL, '2025-01-14');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (283, 13, 11, 3, 5600, 0, '2025-12-06');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (284, 37, 5, 2, 9800, NULL, '2025-10-10');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (286, 13, 3, 3, 6300, 0, '2025-12-13');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (287, 32, 2, 3, 15200, 1000, '2025-01-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (288, 32, 8, 1, 4200, NULL, '2025-12-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (289, 37, 12, 1, 6800, 0, '2025-10-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (291, 13, 6, 3, NULL, 1000, '2025-04-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (292, 37, 10, 2, NULL, 0, '2025-10-11');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (293, 13, 5, 1, 9800, 500, '2025-01-04');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (294, 37, 6, 2, 12500, NULL, '2025-09-21');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (295, 32, 6, 1, 12500, 0, '2025-03-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (296, 32, 14, 2, 18700, 500, '2025-10-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (297, 11, 1, 3, 8500, NULL, '2025-02-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (299, 32, 8, 3, 4200, 1000, '2025-08-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (300, 13, 11, 3, 5600, 0, '2025-08-18');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (301, 11, 1, 1, 8500, 0, '2025-10-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (302, 13, 1, 1, 8500, NULL, '2025-12-03');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (303, 13, 6, 3, 12500, 1000, '2025-09-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (304, 32, 3, 2, 6300, NULL, '2025-06-22');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (305, 21, 12, 3, 6800, 500, '2025-07-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (306, 32, 7, 2, 28000, NULL, '2025-07-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (308, 11, 4, 1, 21000, NULL, '2025-09-20');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (309, 11, 4, 2, 21000, NULL, '2025-08-23');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (310, 11, 3, 2, 6300, 500, '2025-04-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (311, 37, 4, 1, 21000, 0, '2025-08-25');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (312, 11, 9, 3, 34500, 1000, '2025-06-09');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (313, 37, 11, 2, 5600, NULL, '2025-08-02');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (314, 37, 7, 1, 28000, NULL, '2025-06-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (316, 13, 4, 1, 21000, NULL, '2025-08-05');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (317, 11, 9, 2, 34500, NULL, '2025-07-12');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (319, 37, 5, 3, NULL, 0, '2025-07-28');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (322, 13, 8, 1, 4200, 500, '2025-05-17');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (323, 37, 7, 1, 28000, 0, '2025-12-12');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (324, 32, 12, 1, 6800, NULL, '2025-05-19');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (325, 21, 8, 2, 4200, NULL, '2025-06-27');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (326, 13, 8, 1, 4200, NULL, '2025-10-16');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (329, 21, 9, 1, NULL, 1000, '2025-10-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (330, 11, 9, 2, NULL, 500, '2025-09-01');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (331, 6, 13, 1, NULL, NULL, '2025-12-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (332, 23, 14, 1, NULL, NULL, '2025-09-24');
INSERT INTO pedidos (id, cliente_id, producto_id, cantidad, precio_unitario, descuento, fecha) VALUES (333, 28, 15, 1, NULL, NULL, '2025-01-04');
