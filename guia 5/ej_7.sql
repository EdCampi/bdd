/* Un cine de barrio utiliza una base de datos, para guardar información relevante y realizar
reportes sobre sus funciones, entradas vendidas, y los combos (pochoclos/gaseosas) que
sus clientes consumen. Hay clientes que deciden contratar un plan adicional con
descuentos para las entradas. Dados los siguientes esquemas de relaciones:

Películas: {nombre_pelicula, año, género}
Actores: {nombre, apellido, nombre_personaje, apellido_personaje, nombre_pelicula}
Funciones: {dia, hora, sala, nombre_pelicula, precio}
Clientes_vip: {dni_cliente, nombre, apellido, plan, descuento}
Combos: {numero_combo, descripcion, precio}
Ventas_Funciones: {dni_cliente, dia, hora, sala, nombre_pelicula, precio}
Ventas_Combos: {dni_cliente, numero_combo, precio}
realizar las siguientes consultas en SQL:*/

CREATE SCHEMA CINE;

SET SEARCH_PATH TO CINE;

CREATE DOMAIN NOMBRE AS VARCHAR(15);
CREATE DOMAIN LONG_NOMBRE AS VARCHAR(30);

CREATE TABLE PELICULAS
(
    Nombre_pelicula LONG_NOMBRE,
    Año             DATE,
    Genero          NOMBRE,
    PRIMARY KEY (Nombre_pelicula)
);

CREATE TABLE ACTORES
(
    Nombre             NOMBRE,
    Apellido           NOMBRE,
    Nombre_personaje   NOMBRE,
    Apellido_personaje NOMBRE,
    Nombre_pelicula    LONG_NOMBRE,
    PRIMARY KEY (Nombre, Apellido, Nombre_pelicula),
    FOREIGN KEY (Nombre_pelicula) REFERENCES PELICULAS (Nombre_pelicula)
);

CREATE TABLE FUNCIONES
(
    Dia             DATE,
    Hora            TIME,
    Sala            INT CHECK (Sala BETWEEN 1 AND 15),
    Nombre_pelicula LONG_NOMBRE NOT NULL,
    Precio          FLOAT       NOT NULL DEFAULT 15.99,
    PRIMARY KEY (Dia, Hora, Sala),
    FOREIGN KEY (Nombre_pelicula) REFERENCES PELICULAS (Nombre_pelicula)
);

CREATE TABLE CLIENTES_VIP
(
    DNI_cliente INT,
    Nombre      NOMBRE,
    Apellido    NOMBRE,
    Plan        VARCHAR(10) CHECK (Plan IN ('Plus', 'Premium')),
    Descuento   FLOAT NOT NULL,
    PRIMARY KEY (DNI_cliente)
);

CREATE TABLE COMBOS
(
    Numero_combo INT,
    Descripcion  VARCHAR(100),
    Precio       FLOAT NOT NULL DEFAULT 10.99,
    PRIMARY KEY (Numero_combo)
);

CREATE TABLE VENTAS_FUNCIONES
(
    DNI_cliente INT,
    Dia         DATE,
    Hora        Time,
    Sala        INT CHECK (Sala BETWEEN 1 AND 15),
    Precio      FLOAT DEFAULT 15.99,
    PRIMARY KEY (DNI_cliente, Dia, Hora, Sala),
    FOREIGN KEY (Dia, Hora, Sala) REFERENCES FUNCIONES (Dia, Hora, Sala),
    FOREIGN KEY (DNI_cliente) REFERENCES CLIENTES_VIP (DNI_cliente)
);

CREATE TABLE VENTAS_COMBOS
(
    DNI_cliente  INT,
    Numero_combo INT,
    Precio       FLOAT,
    PRIMARY KEY (DNI_cliente, Numero_combo),
    FOREIGN KEY (DNI_cliente) REFERENCES CLIENTES_VIP (DNI_cliente),
    FOREIGN KEY (Numero_combo) REFERENCES COMBOS (Numero_combo)
);

INSERT INTO PELICULAS (Nombre_pelicula, Año, Genero)
VALUES ('Origen', '2010-07-16', 'Ciencia Ficción'),
       ('El Caballero Oscuro', '2008-07-18', 'Acción'),
       ('Pulp Fiction', '1994-10-14', 'Crimen'),
       ('Forrest Gump', '1994-07-06', 'Drama'),
       ('El Señor de los Anillos', '2001-12-19', 'Fantasía'),
       ('Matrix', '1999-03-31', 'Ciencia Ficción'),
       ('Gladiador', '2000-05-05', 'Acción'),
       ('Parásitos', '2019-05-30', 'Suspenso'),
       ('Interestelar', '2014-11-05', 'Ciencia Ficción'),
       ('El Silencio de los Inocentes', '1991-02-14', 'Suspenso'),
       ('La La Land', '2016-12-09', 'Musical'),
       ('Coco', '2017-10-27', 'Animación'),
       ('Joker', '2019-10-04', 'Drama'),
       ('El Gran Hotel Budapest', '2014-03-28', 'Comedia'),
       ('Toy Story', '1995-11-22', 'Animación');

INSERT INTO ACTORES (Nombre, Apellido, Nombre_personaje, Apellido_personaje, Nombre_pelicula)
VALUES ('Leonardo', 'DiCaprio', 'Dom', 'Cobb', 'Origen'),
       ('Joseph', 'Gordon-Levitt', 'Arthur', '', 'Origen'),
       ('Christian', 'Bale', 'Bruce', 'Wayne', 'El Caballero Oscuro'),
       ('Heath', 'Ledger', 'El', 'Joker', 'El Caballero Oscuro'),
       ('John', 'Travolta', 'Vincent', 'Vega', 'Pulp Fiction'),
       ('Samuel', 'L. Jackson', 'Jules', 'Winnfield', 'Pulp Fiction'),
       ('Tom', 'Hanks', 'Forrest', 'Gump', 'Forrest Gump'),
       ('Robin', 'Wright', 'Jenny', 'Curran', 'Forrest Gump'),
       ('Elijah', 'Wood', 'Frodo', 'Bolsón', 'El Señor de los Anillos'),
       ('Ian', 'McKellen', 'Gandalf', '', 'El Señor de los Anillos'),
       ('Keanu', 'Reeves', 'Neo', '', 'Matrix'),
       ('Laurence', 'Fishburne', 'Morfeo', '', 'Matrix'),
       ('Russell', 'Crowe', 'Máximo', 'Décimo', 'Gladiador'),
       ('Joaquin', 'Phoenix', 'Cómodo', '', 'Gladiador'),
       ('Song', 'Kang-ho', 'Kim', 'Ki-taek', 'Parásitos'),
       ('Lee', 'Sun-kyun', 'Park', 'Dong-ik', 'Parásitos'),
       ('Matthew', 'McConaughey', 'Joseph', 'Cooper', 'Interestelar'),
       ('Anne', 'Hathaway', 'Amelia', 'Brand', 'Interestelar'),
       ('Jodie', 'Foster', 'Clarice', 'Starling', 'El Silencio de los Inocentes'),
       ('Anthony', 'Hopkins', 'Hannibal', 'Lecter', 'El Silencio de los Inocentes'),
       ('Ryan', 'Gosling', 'Sebastian', 'Wilder', 'La La Land'),
       ('Emma', 'Stone', 'Mia', 'Dolan', 'La La Land'),
       ('Anthony', 'Gonzalez', 'Miguel', 'Rivera', 'Coco'),
       ('Gael', 'García Bernal', 'Héctor', 'Rivera', 'Coco'),
       ('Joaquin', 'Phoenix', 'Arthur', 'Fleck', 'Joker'),
       ('Robert', 'De Niro', 'Murray', 'Franklin', 'Joker'),
       ('Ralph', 'Fiennes', 'M.', 'Gustave', 'El Gran Hotel Budapest'),
       ('Tom', 'Hanks', 'Woody', '', 'Toy Story'),
       ('Tim', 'Allen', 'Buzz', 'Lightyear', 'Toy Story');

INSERT INTO FUNCIONES (Dia, Hora, Sala, Nombre_pelicula, Precio)
VALUES ('2025-10-12', '18:00:00', 1, 'Origen', 18.50),
       ('2025-10-12', '20:30:00', 1, 'Origen', 18.50),
       ('2025-10-12', '19:00:00', 2, 'El Caballero Oscuro', 17.00),
       ('2025-10-12', '22:00:00', 2, 'El Caballero Oscuro', 17.00),
       ('2025-10-13', '17:45:00', 3, 'Pulp Fiction', 15.99),
       ('2025-10-13', '21:15:00', 4, 'Forrest Gump', 16.50),
       ('2025-10-14', '20:00:00', 5, 'El Señor de los Anillos', 20.00),
       ('2025-10-14', '18:30:00', 6, 'Matrix', 17.50),
       ('2025-10-15', '19:30:00', 7, 'Gladiador', 16.00),
       ('2025-10-15', '22:15:00', 8, 'Parásitos', 19.00),
       ('2025-10-16', '18:00:00', 9, 'Interestelar', 19.50),
       ('2025-10-16', '21:00:00', 10, 'El Silencio de los Inocentes', 15.99),
       ('2025-10-17', '19:45:00', 11, 'La La Land', 18.00),
       ('2025-10-17', '17:00:00', 12, 'Coco', 15.00),
       ('2025-10-18', '20:15:00', 13, 'Joker', 19.00),
       ('2025-10-18', '18:00:00', 14, 'El Gran Hotel Budapest', 17.50),
       ('2025-10-19', '16:00:00', 15, 'Toy Story', 15.00),
       ('2025-10-19', '18:15:00', 1, 'Origen', 18.50);

INSERT INTO CLIENTES_VIP (DNI_cliente, Nombre, Apellido, Plan, Descuento)
VALUES (11223344, 'Juan', 'Perez', 'Premium', 0.20),
       (22334455, 'Maria', 'Gomez', 'Plus', 0.10),
       (33445566, 'Carlos', 'Rodriguez', 'Premium', 0.20),
       (44556677, 'Ana', 'Lopez', 'Plus', 0.10),
       (55667788, 'Pedro', 'Martinez', 'Premium', 0.20),
       (66778899, 'Laura', 'Sanchez', 'Plus', 0.10),
       (77889900, 'Diego', 'Fernandez', 'Premium', 0.20),
       (88990011, 'Sofia', 'Garcia', 'Plus', 0.10),
       (99001122, 'Luis', 'Diaz', 'Premium', 0.20),
       (10111213, 'Elena', 'Moreno', 'Plus', 0.10),
       (123456789, 'Telma', 'Bouvier', 'Plus', 0.10);

INSERT INTO COMBOS (Numero_combo, Descripcion, Precio)
VALUES (1, 'Combo Clásico: Pochoclos Grandes + Gaseosa Mediana', 12.50),
       (2, 'Combo Pareja: 2 Pochoclos Medianos + 2 Gaseosas Chicas', 22.00),
       (3, 'Combo Nachos: Nachos con Queso + Gaseosa Grande', 15.00),
       (4, 'Combo Infantil: Pochoclos Chicos + Jugo + Sorpresa', 10.99),
       (5, 'Combo Premium: Balde de Pochoclos + Gaseosa Extra Grande', 18.00);

INSERT INTO VENTAS_FUNCIONES (DNI_cliente, Dia, Hora, Sala, Precio)
VALUES (11223344, '2025-10-12', '18:00:00', 1, 18.50),
       (11223344, '2025-10-12', '22:00:00', 2, 17.00),
       (11223344, '2025-10-14', '20:00:00', 5, 20.00),
       (22334455, '2025-10-12', '19:00:00', 2, 17.00),
       (33445566, '2025-10-13', '17:45:00', 3, 15.99),
       (33445566, '2025-10-15', '19:30:00', 7, 16.00),
       (33445566, '2025-10-15', '22:15:00', 8, 19.00),
       (33445566, '2025-10-18', '20:15:00', 13, 19.00),
       (44556677, '2025-10-14', '18:30:00', 6, 17.50),
       (55667788, '2025-10-16', '18:00:00', 9, 19.50),
       (66778899, '2025-10-17', '17:00:00', 12, 15.00),
       (66778899, '2025-10-19', '16:00:00', 15, 15.00),
       (77889900, '2025-10-16', '21:00:00', 10, 15.99),
       (88990011, '2025-10-17', '19:45:00', 11, 18.00),
       (99001122, '2025-10-18', '18:00:00', 14, 17.50),
       (10111213, '2025-10-19', '18:15:00', 1, 18.50),
       (123456789, '2025-10-18', '18:00:00', 14, 17.50);

INSERT INTO VENTAS_COMBOS (DNI_cliente, Numero_combo, Precio)
VALUES (11223344, 1, 12.50),
       (11223344, 5, 18.00),
       (22334455, 2, 22.00),
       (33445566, 1, 12.50),
       (33445566, 2, 22.00),
       (33445566, 3, 15.00),
       (44556677, 4, 10.99),
       (55667788, 5, 18.00),
       (77889900, 1, 12.50),
       (88990011, 3, 15.00),
       (88990011, 4, 10.99),
       (99001122, 2, 22.00);

-- 1. Obtener las ventas totales de funciones y combos (mostrar campos dni_cliente, y
-- precios).

SELECT DNI_cliente, SUM(precio_funcion), SUM(precio_combo)
FROM (SELECT CV.DNI_cliente,
             VF.Precio * (1 - CV.Descuento) as precio_funcion,
             VC.Precio * (1 - CV.Descuento) as precio_combo
      FROM CLIENTES_VIP CV
               NATURAL JOIN VENTAS_COMBOS VC
               JOIN VENTAS_FUNCIONES VF ON VF.DNI_cliente = CV.DNI_cliente) as _
GROUP BY DNI_cliente;

-- 2. Obtener los clientes (dni_cliente, nombre, apellido) que más entradas de cine
-- compraron.

WITH CFC AS (SELECT DNI_cliente, COUNT(*) as Cantidad_funciones
             FROM VENTAS_FUNCIONES
             GROUP BY DNI_cliente)
SELECT DNI_cliente, Nombre, Apellido
FROM CLIENTES_VIP
         NATURAL JOIN CFC
WHERE Cantidad_funciones = (SELECT MAX(Cantidad_funciones) FROM CFC);

-- 3. Obtener los clientes (dni_cliente, nombre, apellido) que más combos compraron.

WITH CCLI AS (SELECT DNI_cliente, COUNT(*) as Cantidad_combos
              FROM VENTAS_COMBOS
              GROUP BY DNI_cliente)
SELECT DNI_cliente, Nombre, Apellido
FROM CLIENTES_VIP
         NATURAL JOIN CCLI
WHERE Cantidad_combos = (SELECT MAX(Cantidad_combos) FROM CCLI);

-- 4. Obtener los clientes (dni_cliente, nombre, apellido) que compraron entradas de cine y
-- combos.

(SELECT CV.DNI_cliente, Nombre, Apellido
 FROM CLIENTES_VIP CV
          FULL OUTER JOIN VENTAS_FUNCIONES VF ON VF.DNI_cliente = CV.DNI_cliente
 WHERE Precio IS NOT NULL)
INTERSECT
(SELECT CV.DNI_cliente, Nombre, Apellido
 FROM CLIENTES_VIP CV
          FULL OUTER JOIN VENTAS_COMBOS VC ON VC.DNI_cliente = CV.DNI_cliente
 WHERE Precio IS NOT NULL)
ORDER BY DNI_cliente;

-- 5. Obtener los días y horarios de las funciones con menor precio.

WITH MIN_FUNCIONES AS (SELECT Dia, Hora, MIN(Precio) as Min_precio
                       FROM FUNCIONES
                       GROUP BY Dia, Hora)
SELECT Dia, Hora, Min_precio
FROM MIN_FUNCIONES
WHERE Min_precio = (SELECT MIN(Min_precio) FROM MIN_FUNCIONES);

SELECT Dia, Hora, MIN(Precio) as Min_precio
FROM FUNCIONES
GROUP BY Dia, Hora
HAVING MIN(Precio) <= ALL(SELECT min FROM (SELECT Dia, Hora, MIN(Precio) as min
                          FROM FUNCIONES
                          GROUP BY Dia, Hora));

-- 6. Obtener un listado con la cantidad de películas por género, ordenada de manera
-- descendente.

SELECT Genero, COUNT(*) as Cantidad
FROM PELICULAS
GROUP BY Genero
ORDER BY Cantidad DESC;

-- 7. Obtener los actores que más participaron en películas.

WITH CANTIDAD_PELICULAS AS (SELECT Nombre, Apellido, COUNT(*) as Cantidad_peliculas
                            FROM ACTORES
                            GROUP BY Nombre, Apellido)
SELECT Nombre, Apellido, CANTIDAD_PELICULAS.Cantidad_peliculas
FROM CANTIDAD_PELICULAS
WHERE Cantidad_peliculas = (SELECT MAX(Cantidad_peliculas) FROM CANTIDAD_PELICULAS);

DROP SCHEMA CINE CASCADE;
