/*Ejercicio 5: SQL
Un teatro guarda información importante en su sistema de gestión de base de datos. Dados los siguientes esquemas de relación:

Obras: {nombre_obra, género}
Salas: {nombre_sala, capacidad}
Funciones: {id_funcion, nombre_obra, nombre_sala, dia, hora}
Entradas: {dni_espectador, id_funcion, precio}*/

CREATE SCHEMA TEATRO;

SET SEARCH_PATH TO TEATRO;

CREATE TABLE OBRAS
(
    Nombre_obra VARCHAR(30),
    Genero      VARCHAR(20),
    PRIMARY KEY (Nombre_obra)
);

CREATE TABLE SALAS
(
    Nombre_sala VARCHAR(20),
    Capacidad   INT CHECK ( Capacidad IN (10, 15, 20)) NOT NULL DEFAULT 15,
    PRIMARY KEY (Nombre_sala)
);

CREATE TABLE FUNCIONES
(
    Id_funcion  INT,
    Nombre_obra VARCHAR(30),
    Nombre_sala VARCHAR(20),
    Dia         DATE,
    Hora        TIME,
    PRIMARY KEY (Id_funcion),
    FOREIGN KEY (Nombre_obra)
        REFERENCES OBRAS (Nombre_obra)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (Nombre_sala)
        REFERENCES SALAS (Nombre_sala)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE ENTRADAS
(
    DNI_espectador INT,
    Id_funcion     INT,
    Precio         FLOAT,
    PRIMARY KEY (DNI_espectador, Id_funcion),
    FOREIGN KEY (Id_funcion) REFERENCES FUNCIONES (Id_funcion)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

INSERT INTO OBRAS (Nombre_obra, Genero)
VALUES ('Hamlet', 'Tragedia'),
       ('La Casa de Bernarda Alba', 'Drama'),
       ('El Fantasma de la Ópera', 'Musical'),
       ('Toc Toc', 'Comedia');

INSERT INTO SALAS (Nombre_sala, Capacidad)
VALUES ('Sala A', 20),
       ('Sala B', 15),
       ('Sala C', 10);

INSERT INTO FUNCIONES (Id_funcion, Nombre_obra, Nombre_sala, Dia, Hora)
VALUES (101, 'Hamlet', 'Sala A', '2023-10-25', '21:00'),
       (102, 'Hamlet', 'Sala A', '2023-10-26', '21:00'),
       (201, 'La Casa de Bernarda Alba', 'Sala B', '2023-10-25', '20:30'),
       (202, 'La Casa de Bernarda Alba', 'Sala B', '2023-10-26', '20:30'),
       (301, 'El Fantasma de la Ópera', 'Sala A', '2023-10-27', '22:00'),
       (302, 'El Fantasma de la Ópera', 'Sala A', '2023-10-28', '22:00'),
       (401, 'Toc Toc', 'Sala C', '2023-10-27', '19:00'),
       (402, 'Toc Toc', 'Sala C', '2023-10-28', '19:00');

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (1001, 101, 35.50),
       (1002, 101, 35.50),
       (1003, 101, 35.50),
       (1004, 101, 35.50),
       (1005, 101, 35.50),
       (1006, 101, 35.50),
       (1007, 101, 35.50),
       (1008, 101, 35.50),
       (1009, 101, 35.50),
       (1010, 101, 35.50),
       (1011, 101, 35.50),
       (1012, 101, 35.50),
       (1013, 101, 35.50),
       (1014, 101, 35.50),
       (1015, 101, 35.50),
       (1016, 101, 35.50),
       (1017, 101, 35.50);

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (1018, 102, 35.50),
       (1019, 102, 35.50),
       (1020, 102, 35.50),
       (1021, 102, 35.50),
       (1022, 102, 35.50),
       (1023, 102, 35.50),
       (1024, 102, 35.50),
       (1025, 102, 35.50),
       (1026, 102, 35.50),
       (1027, 102, 35.50),
       (1028, 102, 35.50),
       (1029, 102, 35.50),
       (1030, 102, 35.50),
       (1031, 102, 35.50),
       (1032, 102, 35.50),
       (1033, 102, 35.50),
       (1034, 102, 35.50),
       (1035, 102, 35.50);

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (2001, 201, 30.00),
       (2002, 201, 30.00),
       (2003, 201, 30.00),
       (2004, 201, 30.00),
       (2005, 201, 30.00),
       (2006, 201, 30.00),
       (2007, 201, 30.00),
       (2008, 201, 30.00),
       (2009, 201, 30.00),
       (2010, 201, 30.00),
       (2011, 201, 30.00),
       (2012, 201, 30.00),
       (2013, 201, 30.00);

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (2014, 202, 30.00),
       (2015, 202, 30.00),
       (2016, 202, 30.00),
       (2017, 202, 30.00),
       (2018, 202, 30.00),
       (2019, 202, 30.00),
       (2020, 202, 30.00),
       (2021, 202, 30.00),
       (2022, 202, 30.00),
       (2023, 202, 30.00),
       (2024, 202, 30.00);

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (3001, 301, 45.00),
       (3002, 301, 45.00),
       (3003, 301, 45.00),
       (3004, 301, 45.00),
       (3005, 301, 45.00),
       (3006, 301, 45.00),
       (3007, 301, 45.00),
       (3008, 301, 45.00),
       (3009, 301, 45.00),
       (3010, 301, 45.00),
       (3011, 301, 45.00),
       (3012, 301, 45.00),
       (3013, 301, 45.00),
       (3014, 301, 45.00),
       (3015, 301, 45.00),
       (3016, 301, 45.00),
       (3017, 301, 45.00),
       (3018, 301, 45.00),
       (3019, 301, 45.00);

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (3020, 302, 45.00),
       (3021, 302, 45.00),
       (3022, 302, 45.00),
       (3023, 302, 45.00),
       (3024, 302, 45.00),
       (3025, 302, 45.00),
       (3026, 302, 45.00),
       (3027, 302, 45.00),
       (3028, 302, 45.00),
       (3029, 302, 45.00),
       (3030, 302, 45.00),
       (3031, 302, 45.00),
       (3032, 302, 45.00),
       (3033, 302, 45.00),
       (3034, 302, 45.00),
       (3035, 302, 45.00),
       (3036, 302, 45.00),
       (3037, 302, 45.00);

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (4001, 401, 28.75),
       (4002, 401, 28.75),
       (4003, 401, 28.75),
       (4004, 401, 28.75),
       (4005, 401, 28.75),
       (4006, 401, 28.75),
       (4007, 401, 28.75),
       (4008, 401, 28.75),
       (4009, 401, 28.75);

INSERT INTO ENTRADAS (DNI_espectador, Id_funcion, Precio)
VALUES (4010, 402, 28.75),
       (4011, 402, 28.75),
       (4012, 402, 28.75),
       (4013, 402, 28.75),
       (4014, 402, 28.75),
       (4015, 402, 28.75),
       (4016, 402, 28.75),
       (4017, 402, 28.75),
       (4018, 402, 28.75),
       (4019, 402, 28.75);

/*Realizar una consulta SQL que obtenga las obras que tuvieron en todas sus funciones
  una asistencia mayor al 80% respecto a la capacidad de las salas donde tuvieron funciones.*/

WITH CAPACIDADES AS (SELECT Id_funcion, Nombre_obra, Capacidad -- Busco las capacidades de cada función
                     FROM OBRAS
                              NATURAL JOIN FUNCIONES
                              NATURAL JOIN SALAS),
     ASISTENCIAS AS (SELECT Id_funcion, Count(*) as Asistencias -- Saco las asistencias a cada función
                     FROM ENTRADAS
                     GROUP BY Id_funcion)
SELECT Nombre_obra
FROM CAPACIDADES
         NATURAL JOIN ASISTENCIAS
GROUP BY Nombre_obra -- Agrupo por obra y saco la asistencia más chica es menor al 80%
HAVING MIN(Asistencias::FLOAT / Capacidad) > 0.8;

DROP SCHEMA TEATRO CASCADE;
