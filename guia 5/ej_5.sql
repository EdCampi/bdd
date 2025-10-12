/*Ejercicio 5:
Una ferretería está interesada en tener un sistema de gestión de base de datos, para
almacenar información relacionada a artículos que vende, fabricantes, clientes, y sus
ventas. Dados los siguientes esquemas de relaciones:

Artículos: {codigo_articulo, nombre, descripción, codigo_fabricante, precio}
Fabricantes: {codigo_fabricante, razon_social}
Clientes: {dni_cliente, nombre, apellido}
Ventas: {fecha, dni_cliente, codigo_articulo, cantidad}

Se considera que cada cliente sólo realiza una venta por día. Realizar las siguientes
consultas en SQL:*/

CREATE SCHEMA FERRETERIA;

SET SEARCH_PATH TO FERRETERIA;

CREATE TABLE FABRICANTES
(
    Codigo_fabricante VARCHAR(5),
    Razon_social      VARCHAR(20),
    PRIMARY KEY (Codigo_fabricante)
);

CREATE TABLE ARTICULOS
(
    Codigo_articulo   INT,
    Nombre            VARCHAR(20),
    Descripcion       VARCHAR(100),
    Codigo_fabricante VARCHAR(5),
    Precio            INT NOT NULL,
    PRIMARY KEY (Codigo_articulo),
    FOREIGN KEY (Codigo_fabricante) REFERENCES FABRICANTES (Codigo_fabricante)
);

CREATE TABLE CLIENTES
(
    DNI_cliente INT,
    Nombre      VARCHAR(15),
    Apellido    VARCHAR(15),
    PRIMARY KEY (DNI_cliente)
);

CREATE TABLE VENTAS
(
    Fecha           DATE,
    DNI_cliente     INT,
    Codigo_articulo INT NOT NULL,
    Cantidad        INT NOT NULL DEFAULT 1,
    PRIMARY KEY (FECHA, DNI_cliente), -- UNA VENTA POR DÍA
    FOREIGN KEY (DNI_cliente) REFERENCES CLIENTES (DNI_cliente),
    FOREIGN KEY (Codigo_articulo) REFERENCES ARTICULOS (Codigo_articulo)
);

INSERT INTO FABRICANTES (Codigo_fabricante, Razon_social)
VALUES ('F001', 'TecnoMundo'),
       ('F002', 'HogarFeliz'),
       ('F003', 'ElectroMax'),
       ('F004', 'MobiTech'),
       ('F005', 'AudioPhile'),
       ('F006', 'GamePro'),
       ('F007', 'DecoHogar'),
       ('CA123', 'Blaster'),
       ('F008', 'InnovaFuturo'); -- ESTE FABRICANTE NO TIENE ARTÍCULOS ASOCIADOS

INSERT INTO ARTICULOS (Codigo_articulo, Nombre, Descripcion, Codigo_fabricante, Precio)
VALUES (101, 'Smartphone X1', 'Teléfono inteligente de última generación con pantalla OLED', 'F001', 850000),
       (102, 'Laptop Pro', 'Portátil potente para profesionales y creativos', 'F001', 1500000),
       (103, 'Smart TV 55"', 'Televisor 4K UHD con funciones inteligentes integradas', 'F003', 950000),
       (104, 'Aspiradora Robot', 'Limpieza automática e inteligente para todo tipo de suelos', 'F002', 450000),
       (105, 'Cafetera Express', 'Prepara café de calidad profesional en casa', 'F002', 120000),
       (106, 'Auriculares BT Pro', 'Sonido inmersivo con cancelación de ruido activa', 'F005', 98000),
       (107, 'Tablet Gen 5', 'Tablet versátil para trabajo, estudio y ocio', 'F004', 550000),
       (108, 'Consola NextGen', 'Consola de videojuegos de nueva generación con 1TB de SSD', 'F006', 1200000),
       (109, 'Silla Gamer RGB', 'Silla ergonómica con soporte lumbar y luces RGB', 'F006', 250000),
       (110, 'Lámpara de Pie LED', 'Iluminación moderna y de bajo consumo para living', 'F007', 75000),
       (111, 'Mouse Inalámbrico', 'Mouse ergonómico de alta precisión con 6 botones', 'F001', 45000),
       (112, 'Teclado Mecánico', 'Teclado retroiluminado ideal para gaming y programación', 'F006', 110000),
       (113, 'Parlante Bluetooth', 'Parlante portátil resistente al agua y con gran autonomía', 'F005', 89000),
       (114, 'Monitor Curvo 27"', 'Monitor QHD para una experiencia visual totalmente inmersiva', 'F003', 480000),
       (115, 'Mesa de Centro', 'Mesa de madera maciza de estilo nórdico para sala de estar', 'F007', 130000),
       (116, 'Microondas Digital', 'Microondas con grill y múltiples funciones de cocción', 'F002', 95000),
       (117, 'Funda para Tablet', 'Protección elegante y funcional para tu Tablet Gen 5', 'F004', 35000),
       (118, 'Webcam 1080p', 'Cámara web de alta definición para streaming y videollamadas', 'F001', 60000),
       (200, 'Tornillos', 'Tornillos tamaño 1', 'CA123', 500),
       (500, 'Clavos', 'Clavos de hierro', 'CA123', 150);

INSERT INTO CLIENTES (DNI_cliente, Nombre, Apellido)
VALUES (35123456, 'Juan', 'Perez'),
       (38765432, 'Maria', 'Gomez'),
       (40987654, 'Carlos', 'Rodriguez'),
       (32456789, 'Ana', 'Lopez'),
       (41234567, 'Luis', 'Martinez'),
       (36789012, 'Laura', 'Sanchez'),
       (39012345, 'Pedro', 'Garcia'),
       (42345678, 'Sofia', 'Diaz'),
       (34567890, 'Miguel', 'Fernandez'),
       (37890123, 'Elena', 'Moreno'),
       (50111222, 'John', 'Smith'),
       (50333444, 'Emily', 'Jones'),
       (50555666, 'David', 'Brown');

INSERT INTO VENTAS (Fecha, DNI_cliente, Codigo_articulo, Cantidad)
VALUES ('2025-10-01', 35123456, 102, 1),
       ('2025-10-01', 38765432, 105, 5),
       ('2025-10-02', 40987654, 108, 1),
       ('2025-10-03', 32456789, 104, 1),
       ('2025-10-03', 35123456, 111, 1),
       ('2025-10-04', 36789012, 110, 2),
       ('2025-10-04', 41234567, 101, 1),
       ('2025-10-05', 39012345, 113, 1),
       ('2025-10-05', 42345678, 500, 8),
       ('2025-10-06', 34567890, 115, 1),
       ('2025-10-06', 38765432, 200, 1),
       ('2025-10-07', 37890123, 112, 1),
       ('2025-10-07', 40987654, 109, 1),
       ('2025-10-08', 35123456, 118, 1),
       ('2025-10-08', 32456789, 116, 1),
       ('2025-10-09', 41234567, 107, 1),
       ('2025-10-09', 36789012, 117, 2),
       ('2025-10-10', 42345678, 114, 1),
       ('2025-10-10', 39012345, 101, 1),
       ('2025-10-11', 38765432, 104, 1),
       ('2025-10-11', 34567890, 111, 3),
       ('2025-10-12', 35123456, 103, 1),
       ('2025-10-12', 40987654, 200, 1),
       ('2025-10-12', 32456789, 200, 5),
       ('2025-10-12', 34567890, 500, 30),
       -- Hacemos que Maria Gomez, que ya había comprado Tornillos, ahora compre Clavos
       ('2025-10-13', 38765432, 500, 50),

-- Hacemos que Miguel Fernandez, que ya había comprado Clavos, ahora compre Tornillos
       ('2025-10-13', 34567890, 200, 100),

-- El nuevo cliente John Smith compra Tornillos en un día...
       ('2025-10-14', 50111222, 200, 200),
-- ... y Clavos en otro día
       ('2025-10-15', 50111222, 500, 300),

-- La nueva cliente Emily Jones compra solo Tornillos (para asegurar que no aparezca en el resultado)
       ('2025-10-14', 50333444, 200, 25),

-- El nuevo cliente David Brown compra solo Clavos (para asegurar que no aparezca en el resultado)
       ('2025-10-14', 50555666, 500, 75);


-- 1. Obtener los datos de los clientes, ordenados por apellido.

SELECT *
FROM CLIENTES
ORDER BY Apellido;

-- 2. Obtener los fabricantes tales que la ferretería no vendió ninguno de sus artículos.

WITH VENTA_DETALLE AS (SELECT VENTAS.Codigo_articulo as Articulo_vendido, ARTICULOS.Codigo_fabricante
                       FROM ARTICULOS
                                NATURAL JOIN VENTAS)
SELECT Razon_social
FROM FABRICANTES
         LEFT OUTER JOIN VENTA_DETALLE ON FABRICANTES.Codigo_fabricante = VENTA_DETALLE.Codigo_fabricante
WHERE Articulo_vendido IS NULL;

-- 3. Obtener el importe total de ventas agrupado por cliente, para el día de hoy.

WITH VENTA_MONTOS AS (SELECT Fecha, DNI_cliente, Precio * Cantidad as Monto
                      FROM VENTAS
                               NATURAL JOIN ARTICULOS
                      WHERE Fecha = CURRENT_DATE)
SELECT Nombre, Apellido, Monto
FROM VENTA_MONTOS
         NATURAL JOIN CLIENTES;

-- 4. Obtener los artículos más caros de cada fabricante.

WITH MAXIMOS AS (SELECT Razon_social, Codigo_fabricante, MAX(Precio)
                 FROM ARTICULOS
                          NATURAL JOIN (SELECT Codigo_fabricante, Razon_social FROM FABRICANTES) as _
                 GROUP BY Codigo_fabricante, Razon_social)
SELECT MAXIMOS.Razon_social, aux.Nombre, aux.Precio
FROM (SELECT * FROM ARTICULOS) as aux
         RIGHT JOIN MAXIMOS ON aux.Codigo_fabricante = MAXIMOS.Codigo_fabricante AND aux.Precio = MAXIMOS.max;

-- 6. Obtener los clientes que compraron los artículos con nombre “tornillos”, o “clavos”.

WITH CLIENTE_VENTA AS (SELECT DNI_cliente, Nombre, Apellido, Codigo_articulo
                       FROM VENTAS
                                NATURAL JOIN CLIENTES)
SELECT CV.Nombre, CV.Apellido, A.Nombre
FROM CLIENTE_VENTA as CV
         JOIN ARTICULOS as A ON CV.Codigo_articulo = A.Codigo_articulo
WHERE A.Nombre IN ('Tornillos', 'Clavos');

-- 5. Obtener los clientes que compraron los artículos con nombre “tornillos”, y “clavos”.

WITH CLIENTE_VENTA AS (SELECT DNI_cliente, aux.Nombre, aux.Apellido, A.Nombre as Articulo_comprado
                       FROM (VENTAS NATURAL JOIN CLIENTES) as aux
                                JOIN ARTICULOS A ON aux.Codigo_articulo = A.Codigo_articulo)
    (SELECT Nombre, Apellido
     FROM CLIENTE_VENTA
     WHERE Articulo_comprado = 'Tornillos')
INTERSECT
(SELECT Nombre, Apellido
 FROM CLIENTE_VENTA
 WHERE Articulo_comprado = 'Clavos');

-- 7. Obtener un reporte de ventas, con los siguientes campos:
-- ◦ Fecha de venta.
-- ◦ Nombre y apellido del cliente.
-- ◦ Nombre del artículo.
-- ◦ Cantidad comprada.
-- ◦ Precio del artículo.
-- ◦ Razón social del fabricante del artículo.

SELECT V.Fecha, C.Nombre, C.Apellido, A.Nombre, Cantidad, A.Precio, F.Razon_social
FROM VENTAS V
NATURAL JOIN CLIENTES C
JOIN ARTICULOS A ON A.Codigo_articulo = V.Codigo_articulo
JOIN FABRICANTES F ON F.Codigo_fabricante = A.Codigo_fabricante;

DROP SCHEMA FERRETERIA CASCADE;