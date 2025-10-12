/* Una Facultad de una Universidad, desea gestionar su base de datos, guardando
información relevante sobre los alumnos, materias, y docentes. Dados los siguientes
esquemas de relaciones:

Alumnos: {padron, nombre, apellido}
Docentes: {legajo, nombre, apellido, cargo}
Materias: {codigo, nombre}
Materias_Docentes: {código, legajo}
Notas: {padron, codigo, nota, año, cuatrimestre}

realizar las siguientes consultas en SQL:*/

CREATE SCHEMA FACULTAD;

SET SEARCH_PATH TO FACULTAD;

CREATE TABLE ALUMNOS
(
    Padron   INT,
    Nombre   VARCHAR(15) NOT NULL,
    Apellido VARCHAR(15) NOT NULL,
    PRIMARY KEY (Padron)
);

CREATE TABLE DOCENTES
(
    Legajo   INT,
    Nombre   VARCHAR(15) NOT NULL,
    Apellido VARCHAR(15) NOT NULL,
    Cargo    VARCHAR(15),
    PRIMARY KEY (Legajo)
);

CREATE TABLE MATERIAS
(
    Codigo INT,
    Nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY (Codigo)
);

CREATE TABLE MATERIAS_DOCENTES
(
    Codigo INT,
    Legajo INT,
    PRIMARY KEY (Codigo, Legajo),
    FOREIGN KEY (Codigo) REFERENCES MATERIAS (Codigo),
    FOREIGN KEY (Legajo) REFERENCES DOCENTES (Legajo)
);

CREATE TABLE NOTAS
(
    Padron       INT,
    Codigo       INT,
    Nota         INT NOT NULL DEFAULT 4,
    Año          DATE,
    Cuatrimestre VARCHAR(1) CHECK (Cuatrimestre IN ('1', '2')),
    PRIMARY KEY (Padron, Codigo),
    FOREIGN KEY (Padron) REFERENCES ALUMNOS (Padron),
    FOREIGN KEY (Codigo) REFERENCES MATERIAS (Codigo)
);

INSERT INTO ALUMNOS (Padron, Nombre, Apellido)
VALUES (1001, 'Juan', 'Perez'),
       (1002, 'Ana', 'Garcia'),
       (1003, 'Luis', 'Martinez'),
       (1004, 'Maria', 'Rodriguez'),
       (1005, 'Carlos', 'Lopez'),
       (1006, 'Laura', 'Sanchez'),
       (1007, 'Pedro', 'Gomez'),
       (1008, 'Sofia', 'Diaz'),
       (1009, 'Diego', 'Hernandez'),
       (1010, 'Valeria', 'Torres'),
       (1011, 'Martin', 'Acosta'),
       (1012, 'Camila', 'Rios');


INSERT INTO DOCENTES (Legajo, Nombre, Apellido, Cargo)
VALUES (201, 'Jorge', 'Fernandez', 'Titular'),
       (202, 'Marta', 'Romero', 'Adjunto'),
       (203, 'Ricardo', 'Sosa', 'JTP'),
       (204, 'Silvia', 'Alvarez', 'Titular'),
       (205, 'Hugo', 'Ruiz', 'Adjunto'),
       (206, 'Norma', 'Jimenez', 'JTP');

INSERT INTO MATERIAS (Codigo, Nombre)
VALUES (10, 'Algebra'),
       (11, 'Analisis I'),
       (12, 'Fisica I'),
       (13, 'Base de Datos'),
       (14, 'Sintaxis'),
       (15, 'Redes'),
       (16, 'Sist. Operativos');

INSERT INTO MATERIAS_DOCENTES (Codigo, Legajo)
VALUES (10, 201),
       (10, 203),
       (11, 202),
       (12, 204),
       (12, 205),
       (13, 201),
       (13, 206),
       (14, 202),
       (15, 204),
       (15, 205);

INSERT INTO NOTAS (Padron, Codigo, Nota, Año, Cuatrimestre)
VALUES (1001, 10, 8, '2023-12-05', '2'),
       (1001, 11, 6, '2023-07-15', '1'),
       (1001, 13, 9, '2024-07-20', '1'),
       (1002, 10, 3, '2023-12-05', '2'),
       (1002, 13, 7, '2024-07-20', '1'),
       (1003, 11, 10, '2023-07-15', '1'),
       (1003, 12, 8, '2023-12-08', '2'),
       (1004, 13, 4, '2024-07-20', '1'),
       (1004, 14, 5, '2024-07-22', '1'),
       (1005, 15, 2, '2024-07-18', '1'),
       (1006, 13, 9, '2023-07-20', '1'),
       (1007, 10, 7, '2023-07-12', '1'),
       (1007, 11, 7, '2023-12-01', '2'),
       (1008, 14, 9, '2024-07-22', '1'),
       (1009, 15, 8, '2024-07-18', '1'),
       (1010, 13, 2, '2024-07-20', '1'),
       (1005, 10, 2, '2023-07-12', '1'),
       (1005, 11, 2, '2023-12-01', '2'),
       (1011, 13, 8, '2024-07-20', '1'),
       (1011, 16, 7, '2023-12-10', '2'),
       (1012, 16, 6, '2024-07-19', '1'),
       (1002, 16, 5, '2024-07-19', '1'),
       (1010, 10, 2, '2023-12-05', '2'),
       (1010, 11, 2, '2023-07-15', '1');

-- 1. Obtener todos los alumnos que aprobaron la materia “Base de Datos” (nota >= 4).

SELECT Padron, A.Nombre, Apellido, Nota
FROM ALUMNOS A
         NATURAL JOIN NOTAS N
         JOIN MATERIAS M ON N.Codigo = M.Codigo
WHERE M.Nombre = 'Base de Datos'
  AND N.Nota >= 4;

-- 2. Obtener los alumnos con mejor promedio.

WITH PROMEDIOS AS (SELECT Padron, AVG(Nota) as Promedio
                   FROM NOTAS
                   GROUP BY Padron)
SELECT Nombre, Apellido, Promedio
FROM PROMEDIOS
         NATURAL JOIN ALUMNOS
WHERE Promedio = (SELECT MAX(Promedio) from PROMEDIOS);

-- 3. Obtener la cantidad de docentes por cargo.

SELECT Cargo, Count(*)
FROM DOCENTES
GROUP BY Cargo;

-- 4. Obtener los docentes que dictan más de una materia.

WITH DOCENTE_MATERIAS AS (SELECT Legajo, COUNT(*) as Cantidad_enseñada
                          FROM MATERIAS_DOCENTES
                          GROUP BY Legajo)
SELECT Nombre, Apellido, Cantidad_enseñada
FROM DOCENTE_MATERIAS
         NATURAL JOIN DOCENTES
WHERE Cantidad_enseñada > 1;

-- 5. Obtener un listado de materias (código, nombre) y sus docentes (nombre, apellido,
-- cargo), ordenado por código de materia

SELECT Codigo, M.Nombre, D.Nombre, D.Apellido, D.Cargo
FROM MATERIAS M
         NATURAL JOIN MATERIAS_DOCENTES MD
         JOIN DOCENTES D ON D.Legajo = MD.Legajo
ORDER BY Codigo;

-- 6. Obtener los alumnos con más aplazos (nota < 4).

WITH CANTIDAD_APLAZOS AS (SELECT Padron, COUNT(*) as Cantidad
                          FROM (SELECT Padron, Nota
                                FROM NOTAS
                                WHERE Nota < 4) as aux
                          GROUP BY Padron)
SELECT Nombre, Apellido, Cantidad
FROM ALUMNOS
         NATURAL JOIN CANTIDAD_APLAZOS
WHERE Cantidad = (SELECT MAX(Cantidad) FROM CANTIDAD_APLAZOS);

-- 7. Obtener los alumnos que cursaron las materias “Base de Datos” y “Sistemas
-- Operativos”.

(SELECT Padron, A.Nombre, Apellido
 FROM ALUMNOS A
          NATURAL JOIN NOTAS N
          JOIN MATERIAS M ON M.Codigo = N.Codigo
 WHERE M.Nombre = 'Base de Datos')
INTERSECT
(SELECT Padron, A.Nombre, Apellido
 FROM ALUMNOS A
          NATURAL JOIN NOTAS N
          JOIN MATERIAS M ON M.Codigo = N.Codigo
 WHERE M.Nombre = 'Sist. Operativos');


-- 8. Obtener los alumnos que cursaron las materias “Base de Datos” o “Sistemas
-- Operativos”.

(SELECT Padron, A.Nombre, Apellido
 FROM ALUMNOS A
          NATURAL JOIN NOTAS N
          JOIN MATERIAS M ON M.Codigo = N.Codigo
 WHERE M.Nombre = 'Base de Datos')
UNION
(SELECT Padron, A.Nombre, Apellido
 FROM ALUMNOS A
          NATURAL JOIN NOTAS N
          JOIN MATERIAS M ON M.Codigo = N.Codigo
 WHERE M.Nombre = 'Sist. Operativos');

DROP SCHEMA FACULTAD CASCADE;
