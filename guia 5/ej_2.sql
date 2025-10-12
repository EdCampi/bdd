/*Un club de barrio, posee socios que realizan diferentes deportes. Los socios pueden o no
participar en diversos deportes dentro del club. Dados los siguientes esquemas de
relaciones:

Socios: {numero_socio, nombre, apellido, fecha_nacimiento}
Deportes: {nombre, cantidad_jugadores_por_equipo}
Socios_Deportes: {numero_socio, nombre_deporte}

realizar las siguientes consultas en SQL:*/

CREATE SCHEMA club;

SET search_path TO club;

CREATE TABLE SOCIOS
(
    Numero_socio     INT,
    Nombre           VARCHAR(20) NOT NULL,
    Apellido         VARCHAR(20) NOT NULL,
    Fecha_nacimiento DATE,
    PRIMARY KEY (Numero_socio)
);

CREATE TABLE DEPORTES
(
    Nombre                        VARCHAR(20),
    Cantidad_jugadores_por_equipo INT NOT NULL,
    PRIMARY KEY (Nombre)
);

CREATE TABLE SOCIOS_DEPORTES
(
    Numero_socio   INT,
    Nombre_deporte VARCHAR(20),
    PRIMARY KEY (Numero_socio, Nombre_deporte),
    FOREIGN KEY (Numero_socio) REFERENCES SOCIOS (Numero_socio),
    FOREIGN KEY (Nombre_deporte) references DEPORTES (Nombre)
);

INSERT INTO DEPORTES (Nombre, Cantidad_jugadores_por_equipo)
VALUES ('Fútbol', 11),
       ('Básquet', 5),
       ('Tenis', 1),
       ('Vóley', 6),
       ('Natación', 15),
       ('Hockey', 11),
       ('Rugby', 15),
       ('Handball', 7),
       ('Boxeo', 1);

INSERT INTO SOCIOS (Numero_socio, Nombre, Apellido, Fecha_nacimiento)
VALUES (1, 'Juan', 'Pérez', '1990-05-15'),
       (2, 'Ana', 'García', '1988-11-20'),
       (3, 'Luis', 'Martínez', '1995-02-10'),
       (4, 'María', 'Rodríguez', '1992-07-30'),
       (5, 'Carlos', 'López', '1998-01-25'),
       (6, 'Sofía', 'González', '2000-09-05'),
       (7, 'Javier', 'Sánchez', '1985-04-12'),
       (8, 'Laura', 'Ramírez', '1993-06-18'),
       (9, 'Diego', 'Torres', '1991-03-22'),
       (10, 'Valeria', 'Flores', '1997-12-01'),
       (11, 'Miguel', 'Gómez', '1989-08-14'),
       (12, 'Camila', 'Díaz', '1996-10-28'),
       (13, 'Jorge', 'Vásquez', '1994-05-09'),
       (14, 'Paula', 'Moreno', '1999-07-16'),
       (15, 'Andrés', 'Jiménez', '1987-02-03'),
       (16, 'Daniela', 'Silva', '2001-04-21'),
       (17, 'Ricardo', 'Méndez', '1990-11-07'),
       (18, 'Fernanda', 'Castro', '1992-08-25'),
       (19, 'Gabriel', 'Ortiz', '1995-01-13'),
       (20, 'Luciana', 'Rojas', '1998-03-29'),
       (21, 'Martín', 'Soto', '1986-12-11'),
       (22, 'Valentina', 'Herrera', '1993-09-03'),
       (23, 'Alejandro', 'Romero', '1991-06-27'),
       (24, 'Carolina', 'Acosta', '1997-02-18'),
       (25, 'Sebastián', 'Nuñez', '1994-10-04'),
       (26, 'Isabella', 'Paz', '1999-01-08'),
       (27, 'Mateo', 'Medina', '1988-07-23'),
       (28, 'Gabriela', 'Vega', '2000-05-31'),
       (29, 'Felipe', 'Reyes', '1990-03-17'),
       (30, 'Julieta', 'Cabrera', '1996-11-19'),
       (31, 'Emilio', 'Salazar', '1992-09-01'),
       (32, 'Renata', 'Campos', '1995-07-06'),
       (33, 'Nicolás', 'Guerrero', '1987-04-14'),
       (34, 'Victoria', 'Peña', '1998-08-02'),
       (35, 'Lucas', 'Molina', '1991-12-24'),
       (36, 'Florencia', 'Ríos', '1993-10-15'),
       (37, 'Benjamín', 'León', '1996-06-08'),
       (38, 'Agustina', 'Cordero', '1999-02-11'),
       (39, 'Tomás', 'Figueroa', '1989-05-26'),
       (40, 'Constanza', 'Pinto', '2001-08-19'),
       (41, 'Manuel', 'Bravo', '1990-01-01'),
       (42, 'Antonia', 'Parra', '1994-04-05'),
       (43, 'Francisco', 'Miranda', '1992-11-30'),
       (44, 'Josefina', 'Solis', '1997-06-20'),
       (45, 'Joaquín', 'Donoso', '1993-03-02'),
       (46, 'Trinidad', 'Araya', '1998-09-13'),
       (47, 'Cristóbal', 'Alvarez', '1988-12-05'),
       (48, 'Ignacia', 'Morales', '2000-07-24'),
       (49, 'Maximiliano', 'Fuentes', '1991-10-09'),
       (50, 'Amanda', 'Jara', '1995-08-27'),
       (51, 'Vicente', 'Tapia', '1996-04-18'),
       (52, 'Catalina', 'Riquelme', '1999-11-22'),
       (53, 'Ignacio', 'Sepúlveda', '1987-08-07'),
       (54, 'Javiera', 'Correa', '2000-02-14'),
       (55, 'Esteban', 'Espinoza', '1992-06-03'),
       (56, 'Paz', 'Valenzuela', '1994-03-19'),
       (57, 'Matías', 'Castillo', '1990-12-15'),
       (58, 'Rocío', 'Contreras', '1997-09-28'),
       (59, 'Simón', 'Ibarra', '1993-01-06'),
       (60, 'Francisca', 'Navarro', '1998-05-11'),
       (61, 'Alonso', 'Sandoval', '1989-07-17'),
       (62, 'Belén', 'Orellana', '2001-01-23'),
       (63, 'Facundo', 'Garrido', '1991-04-30'),
       (64, 'Emilia', 'Aguilar', '1996-08-12'),
       (65, 'Agustín', 'Paredes', '1994-11-02'),
       (66, 'Dominga', 'Salas', '1999-05-18'),
       (67, 'Renato', 'Cárdenas', '1988-03-04'),
       (68, 'Josefa', 'Farías', '2000-10-26'),
       (69, 'Santiago', 'Lagos', '1992-01-19'),
       (70, 'Maite', 'Henríquez', '1995-09-08'),
       (71, 'Bastián', 'Carvajal', '1990-07-02'),
       (72, 'Isidora', 'Escobar', '1997-03-14'),
       (73, 'Julián', 'Maldonado', '1993-06-25'),
       (74, 'Sofía', 'Vera', '1998-12-08'),
       (75, 'Dante', 'Barrientos', '1987-10-01'),
       (76, 'Leonor', 'Yañez', '2001-06-13'),
       (77, 'Luciano', 'Ramos', '1991-08-22'),
       (78, 'Martina', 'Zúñiga', '1996-02-05'),
       (79, 'Samuel', 'Ávila', '1994-07-10'),
       (80, 'Blanca', 'Calderón', '1999-04-27'),
       (81, 'Adrián', 'Céspedes', '1989-11-13'),
       (82, 'Olivia', 'Valdés', '2000-09-20'),
       (83, 'Elías', 'Fierro', '1992-05-04'),
       (84, 'Alicia', 'Bustos', '1995-12-29'),
       (85, 'Damián', 'Arancibia', '1990-02-23'),
       (86, 'Mía', 'Saavedra', '1997-08-09'),
       (87, 'Bruno', 'Villanueva', '1993-11-28'),
       (88, 'Elena', 'Gallardo', '1998-06-01'),
       (89, 'Pedro', 'Acuña', '1988-01-30'),
       (90, 'Sara', 'Marín', '2001-03-07'),
       (91, 'Oscar', 'Olivares', '1991-09-17'),
       (92, 'Claudia', 'Uribe', '1996-05-22'),
       (93, 'Héctor', 'Carrasco', '1994-12-18'),
       (94, 'Raquel', 'Zapata', '1999-08-15'),
       (95, 'Arturo', 'Godoy', '1987-06-05'),
       (96, 'Verónica', 'Toledo', '2000-02-09'),
       (97, 'Enrique', 'Leyton', '1992-10-12'),
       (98, 'Marta', 'Poblete', '1995-04-03'),
       (99, 'Raúl', 'Riquelme', '1990-11-25'),
       (100, 'Teresa', 'Navea', '1997-07-08'),
       (101, 'Mario', 'Fuentes', '1993-01-01'),
       (102, 'Ester', 'Guzmán', '1998-05-14'),
       (103, 'Ramón', 'Araya', '1989-08-31'),
       (104, 'Gloria', 'Vargas', '2001-12-04'),
       (105, 'Sergio', 'Peralta', '1991-02-28'),
       (106, 'Cecilia', 'Cid', '1996-07-21'),
       (107, 'Fernando', 'Saez', '1994-10-18'),
       (108, 'Rosa', 'Cornejo', '1999-03-23'),
       (109, 'Patricio', 'Becerra', '1988-09-26'),
       (110, 'Inés', 'Palma', '2000-11-08');

INSERT INTO SOCIOS_DEPORTES (Numero_socio, Nombre_deporte)
VALUES
-- Socios con más de un deporte
(1, 'Fútbol'),
(1, 'Tenis'),
(2, 'Básquet'),
(2, 'Natación'),
(3, 'Vóley'),
(3, 'Fútbol'),
(3, 'Natación'),
(4, 'Hockey'),
(4, 'Natación'),
(5, 'Rugby'),
(5, 'Boxeo'),
(10, 'Tenis'),
(10, 'Vóley'),
(10, 'Natación'),
(10, 'Fútbol'),
(15, 'Fútbol'),
(15, 'Handball'),
(20, 'Básquet'),
(20, 'Natación'),
(25, 'Hockey'),
(25, 'Rugby'),
(30, 'Boxeo'),
(30, 'Fútbol'),

-- Socios con un solo deporte
(6, 'Vóley'),
(7, 'Fútbol'),
(8, 'Tenis'),
(9, 'Básquet'),
(11, 'Natación'),
(12, 'Hockey'),
(13, 'Rugby'),
(14, 'Handball'),
(16, 'Boxeo'),
(17, 'Fútbol'),
(18, 'Tenis'),
(19, 'Básquet'),
(21, 'Vóley'),
(22, 'Natación'),
(23, 'Hockey'),
(24, 'Fútbol'),
(26, 'Rugby'),
(27, 'Handball'),
(28, 'Tenis'),
(29, 'Boxeo'),
(31, 'Fútbol'),
(32, 'Básquet'),
(33, 'Vóley'),
(34, 'Natación'),
(35, 'Hockey'),
(36, 'Rugby'),
(37, 'Handball'),
(38, 'Fútbol'),
(39, 'Tenis'),
(40, 'Boxeo'),
(41, 'Básquet'),
(42, 'Vóley'),
(43, 'Natación'),
(44, 'Hockey'),
(45, 'Fútbol'),
(46, 'Rugby'),
(47, 'Handball'),
(48, 'Tenis'),
(49, 'Básquet'),
(50, 'Fútbol'),
(51, 'Natación'),
(52, 'Vóley'),
(53, 'Hockey'),
(54, 'Boxeo'),
(55, 'Rugby'),
(56, 'Fútbol'),
(57, 'Handball'),
(58, 'Tenis'),
(59, 'Básquet'),
(60, 'Vóley'),
(61, 'Natación'),
(62, 'Fútbol'),
(63, 'Hockey'),
(64, 'Rugby'),
(65, 'Boxeo'),
(66, 'Handball'),
(67, 'Fútbol'),
(68, 'Tenis'),
(69, 'Básquet'),
(70, 'Vóley'),
(71, 'Natación'),
(72, 'Hockey'),
(73, 'Fútbol'),
(74, 'Rugby'),
(75, 'Handball'),
(76, 'Boxeo'),
(77, 'Tenis'),
(78, 'Básquet'),
(79, 'Fútbol'),
(80, 'Vóley'),
(81, 'Natación'),
(82, 'Hockey'),
(83, 'Rugby'),
(84, 'Fútbol'),
(85, 'Handball'),
(86, 'Tenis'),
(87, 'Boxeo'),
(88, 'Básquet'),
(89, 'Vóley'),
(90, 'Fútbol');

-- Los socios del 91 al 110 no están en esta tabla, por lo que no practican deportes.

-- 1. Obtener el número de socio, el nombre y el apellido de aquellos socios que no realizan ningún deporte.

SELECT Numero_socio, Nombre, Apellido
FROM SOCIOS
EXCEPT
(SELECT Numero_socio, Nombre, Apellido
 FROM SOCIOS as S
          NATURAL JOIN SOCIOS_DEPORTES as D)
ORDER BY Numero_socio;

-- Alternativa 2, hacer join y quedarme con los deportes en null

SELECT S.Numero_socio, Nombre, Apellido
FROM SOCIOS as S
         LEFT OUTER JOIN SOCIOS_DEPORTES as SD ON S.Numero_socio = SD.Numero_socio
WHERE SD.Nombre_deporte IS NULL
ORDER BY Numero_socio;

-- 2. Obtener el número de socio, el nombre y el apellido de aquellos socios que realizan la máxima cantidad de deportes.

SELECT S.Numero_socio, S.Nombre, S.Apellido
FROM SOCIOS S
         NATURAL JOIN SOCIOS_DEPORTES SD
GROUP BY S.Numero_socio, S.Nombre, S.Apellido
HAVING COUNT(*) = (SELECT MAX(aux.amount)
                   FROM (SELECT COUNT(*) as amount
                         FROM SOCIOS_DEPORTES SD2
                         GROUP BY SD2.Numero_socio) as aux)
ORDER BY S.Numero_socio;

-- 3. Obtener la cantidad de deportes que se realizan en el club.

SELECT COUNT(Nombre) as Cantidad_deportes
FROM DEPORTES;


-- 4. Obtener los deportes que poseen la mayor cantidad de jugadores por equipo.

SELECT Nombre
FROM DEPORTES
WHERE Cantidad_jugadores_por_equipo = (SELECT MAX(aux.Cantidad_jugadores_por_equipo)
                                       FROM DEPORTES aux);

-- 5. Obtener el número promedio de jugadores por equipo de los deportes.

SELECT AVG(Cantidad_jugadores_por_equipo)
FROM DEPORTES;

-- 6. Contar la cantidad de socios que realizan al menos dos deportes.*/

SELECT COUNT(*) as Cantidad_socios_al_menos_2_deportes
FROM (SELECT Numero_socio, COUNT(*) as count
      FROM SOCIOS_DEPORTES
      GROUP BY Numero_socio
      HAVING COUNT(*) >= 2) as _;

DROP SCHEMA club CASCADE;
