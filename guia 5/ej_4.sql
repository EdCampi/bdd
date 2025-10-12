/*Una línea de colectivos utiliza un sistema de gestión de Base de Datos para poder gestionar
información relacionada a sus colectivos, choferes, y los turnos. Dados los siguientes
esquemas de relaciones:
Colectivos: {número_coche, marca_motor, marca_chassis, modelo}
Choferes: {dni, nombre, apellido, numero_coche}
Asignacion_turno: {dni, dia, turno} (turno; m = mañana, t = tarde, n = noche).

Realizar las siguientes consultas en SQL:*/

CREATE SCHEMA COLECTIVOS;

SET SEARCH_PATH TO COLECTIVOS;

CREATE TABLE COLECTIVOS
(
    Numero_coche  INT,
    Marca_motor   VARCHAR(20),
    Marcha_chasis VARCHAR(20),
    Modelo        INT,
    PRIMARY KEY (Numero_coche)
);

CREATE TABLE CHOFERES
(
    DNI          INT,
    Nombre       VARCHAR(20),
    Apellido     VARCHAR(20),
    Numero_coche INT,
    PRIMARY KEY (DNI),
    FOREIGN KEY (Numero_coche) REFERENCES COLECTIVOS (Numero_coche)
);

CREATE TABLE TURNO
(
    DNI   INT NOT NULL,
    Dia   DATE,
    Turno VARCHAR(1) CHECK (Turno IN ('m', 't', 'n')),
    PRIMARY KEY (Dia, Turno),
    FOREIGN KEY (DNI) REFERENCES CHOFERES (DNI)
);

INSERT INTO COLECTIVOS (Numero_coche, Marca_motor, Marcha_chasis, Modelo)
VALUES (101, 'Mercedes-Benz', 'OF 1418', 2012),
       (102, 'Agrale', 'MT15', 2013),
       (103, 'Mercedes-Benz', 'O 500 U', 2015),
       (104, 'Scania', 'K250UB', 2018),
       (105, 'Volvo', 'B290R', 2011),
       (106, 'Mercedes-Benz', 'OF 1721', 2019),
       (107, 'Agrale', 'MT17', 2016),
       (108, 'Mercedes-Benz', 'OH 1618 L-sb', 2010),
       (109, 'Scania', 'K310IB', 2017),
       (110, 'Volvo', 'B270F', 2015),
       (111, 'Mercedes-Benz', 'OF 1519', 2020),
       (112, 'Agrale', 'MA15', 2012),
       (113, 'Mercedes-Benz', 'O 500 UA', 2021),
       (114, 'Scania', 'K360IB', 2015),
       (115, 'Volvo', 'B340M', 2013);

INSERT INTO CHOFERES (DNI, Nombre, Apellido, Numero_coche)
VALUES (30123456, 'Juan', 'Pérez', 105),
       (31234567, 'Carlos', 'García', 102),
       (32345678, 'Miguel', 'Fernández', 103),
       (33456789, 'Luis', 'Rodríguez', 104),
       (34567890, 'Jorge', 'Gómez', 105),
       (35678901, 'Ricardo', 'Martínez', 106),
       (36789012, 'Pedro', 'Sánchez', 107),
       (37890123, 'José', 'López', 108),
       (38901234, 'Fernando', 'Díaz', 109),
       (39012345, 'Raúl', 'Hernández', 110),
       (40123456, 'Andrés', 'Moreno', 111),
       (41234567, 'Diego', 'Jiménez', 112),
       (42345678, 'Javier', 'Romero', 113),
       (43456789, 'Mario', 'Navarro', 114),
       (44567890, 'Sergio', 'Ruiz', 115),
       (29876543, 'Pablo', 'Alonso', 105),
       (28765432, 'Daniel', 'Gutiérrez', 102),
       (27654321, 'Marcos', 'Molina', 103),
       (26543210, 'Adrián', 'Sosa', 104),
       (25432109, 'Oscar', 'Castro', 105),
       (24321098, 'Manuel', 'Ortiz', 106),
       (23210987, 'Víctor', 'Silva', 107),
       (22109876, 'Rubén', 'Núñez', 108),
       (21098765, 'Francisco', 'Ríos', 109),
       (20987654, 'Alberto', 'Ramírez', 110),
       (19876543, 'Héctor', 'Flores', 111),
       (18765432, 'Esteban', 'Benítez', 112),
       (17654321, 'Ignacio', 'Acosta', 113),
       (16543210, 'Gabriel', 'Medina', 110),
       (15432109, 'David', 'Herrera', 111),
       (45678901, 'Julián', 'Torres', 110),
       (46789012, 'Ángel', 'Domínguez', 103),
       (47890123, 'Cristian', 'Vázquez', 105),
       (48901234, 'Roberto', 'Blanco', 107),
       (49012345, 'Emilio', 'Suárez', 110),
       (50123456, 'Iván', 'Giménez', 111),
       (51234567, 'Alfredo', 'Iglesias', 113),
       (52345678, 'Guillermo', 'Serrano', 111),
       (53456789, 'Alejandro', 'Méndez', 109),
       (54567890, 'Tomás', 'Rojas', 109),
       (55678901, 'Sebastián', 'Morales', 106),
       (56789012, 'Felipe', 'Cruz', 109),
       (57890123, 'Matías', 'Pascual', 102),
       (58901234, 'Nicolás', 'Esteban', 102),
       (59012345, 'Leonardo', 'Peña', NULL);

INSERT INTO TURNO (DNI, Dia, Turno)
VALUES (30123456, '2025-10-13', 'm'),
       (31234567, '2025-10-13', 't'),
       (32345678, '2025-10-13', 'n'),
       (33456789, '2025-10-14', 'm'),
       (34567890, '2025-10-14', 't'),
       (35678901, '2025-10-14', 'n'),
       (36789012, '2025-10-15', 'm'),
       (37890123, '2025-10-15', 't'),
       (38901234, '2025-10-15', 'n'),
       (39012345, '2025-10-16', 'm'),
       (40123456, '2025-10-16', 't'),
       (41234567, '2025-10-16', 'n'),
       (42345678, '2025-10-17', 'm'),
       (43456789, '2025-10-17', 't'),
       (44567890, '2025-10-17', 'n'),
       (29876543, '2025-10-18', 'm'),
       (28765432, '2025-10-18', 't'),
       (27654321, '2025-10-18', 'n'),
       (26543210, '2025-10-19', 'm'),
       (25432109, '2025-10-19', 't'),
       (24321098, '2025-10-19', 'n'),
       (23210987, '2025-10-20', 'm'),
       (22109876, '2025-10-20', 't'),
       (21098765, '2025-10-20', 'n'),
       (20987654, '2025-10-21', 'm'),
       (19876543, '2025-10-21', 't'),
       (18765432, '2025-10-21', 'n'),
       (17654321, '2025-10-22', 'm'),
       (16543210, '2025-10-22', 't'),
       (15432109, '2025-10-22', 'n'),
       (45678901, '2025-10-23', 'm'),
       (46789012, '2025-10-23', 't'),
       (47890123, '2025-10-23', 'n'),
       (48901234, '2025-10-24', 'm'),
       (49012345, '2025-10-24', 't'),
       (50123456, '2025-10-24', 'n'),
       (51234567, '2025-10-25', 'm'),
       (52345678, '2025-10-25', 't'),
       (53456789, '2025-10-25', 'n'),
       (54567890, '2025-10-26', 'm'),
       (55678901, '2025-10-26', 't'),
       (56789012, '2025-10-26', 'n'),
       (57890123, '2025-10-27', 'm'),
       (58901234, '2025-10-27', 't'),
       (59012345, '2025-10-27', 'n'),
       (30123456, '2025-10-28', 'm'),
       (31234567, '2025-10-28', 't'),
       (32345678, '2025-10-28', 'n'),
       (33456789, '2025-10-29', 'm'),
       (34567890, '2025-10-29', 't');

-- 1. Obtener los colectivos que tienen modelo anterior a 2014.

SELECT Numero_coche
FROM COLECTIVOS
WHERE Modelo < 2014;

-- 2. Obtener los colectivos ordenados por número de coche descendente.

SELECT Numero_coche
FROM COLECTIVOS
ORDER BY Numero_coche DESC;

-- 3. Obtener los choferes sin colectivo asignado.

SELECT DNI, Nombre, Apellido
FROM CHOFERES
WHERE Numero_coche IS NULL;

-- 4. Obtener los choferes asignados al turno noche.

SELECT DISTINCT Nombre, Apellido
FROM CHOFERES
         RIGHT JOIN TURNO ON CHOFERES.DNI = TURNO.DNI
WHERE TURNO.Turno = 'n';

-- 5. Obtener la cantidad de choferes agrupados por turno

SELECT Turno, COUNT(*)
FROM TURNO
GROUP BY Turno;

DROP SCHEMA COLECTIVOS CASCADE;
