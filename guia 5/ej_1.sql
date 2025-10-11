/* Ejercicio 1: Una cadena que vende hamburguesas en una ciudad, utiliza un sistema de gestión de base de datos,
   para obtener información relevante y tomar decisiones. Dados los siguientes esquemas de relaciones:

   Sucursales: {nombre_sucursal, barrio}
   Combos: {numero_combo, descripción, precio}
   Empleados: {dni, nombre, apellido, nombre_sucursal}
   Barrios: {nombre}

   realizar las siguientes consultas en SQL:
 */

CREATE SCHEMA hamburgueserias;

SET search_path TO hamburgueserias;

-- 1. Crear todas las tablas, indicando claves primarias, claves foráneas, y restricciones.

CREATE DOMAIN NOMBRE_TYPE as VARCHAR(20);

CREATE TABLE BARRIOS
(
    Nombre NOMBRE_TYPE PRIMARY KEY
);

CREATE TABLE SUCURSALES
(
    Nombre_sucursal NOMBRE_TYPE,
    Barrio          NOMBRE_TYPE NOT NULL,
    PRIMARY KEY (Nombre_sucursal),
    FOREIGN KEY (Barrio) REFERENCES BARRIOS (Nombre)
);

CREATE TABLE COMBOS
(
    Numero_combo INT,
    Descripcion  VARCHAR(50),
    Precio       FLOAT NOT NULL,
    PRIMARY KEY (Numero_combo)
);

CREATE TABLE EMPLEADOS
(
    Dni             INT,
    Nombre          NOMBRE_TYPE NOT NULL,
    Apellido        NOMBRE_TYPE NOT NULL,
    Nombre_sucursal NOMBRE_TYPE,
    PRIMARY KEY (Dni),
    FOREIGN KEY (Nombre_sucursal) REFERENCES SUCURSALES (Nombre_sucursal)
);

-- AUX DATA

INSERT INTO BARRIOS (Nombre)
VALUES ('Miraflores'),
       ('Valle Sol'),
       ('Bosque Alto'),
       ('La Ribera'),
       ('Cumbres Verdes'),
       ('San Ignacio'),
       ('Las Colinas'),
       ('Puerto Nuevo'),
       ('El Robledal'),
       ('Villa Serena'),
       ('Puerto Viejo'),
       ('Villa Euforia'),
       ('Valle Luna');

INSERT INTO COMBOS (Numero_combo, Descripcion, Precio)
VALUES (1, 'Clásica simple con papas', 12.99),
       (2, 'Doble cheddar y aros de cebolla', 18.75),
       (3, 'Veggie especial con batatas', 17.00),
       (4, 'Pollo crispy y gaseosa grande', 19.50),
       (5, 'Combo infantil con juguete', 12.99),
       (6, 'Triple bacon mega burger', 21.00),
       (7, 'Wrap de pollo y vegetales', 14.00),
       (8, 'Ensalada Caesar con pollo', 15.00),
       (9, 'Mega picada para compartir', 19.50),
       (10, 'Hamburguesa de cordero patagónico', 19.50),
       (11, 'Provoleta burger con chimichurri', 19.50),
       (12, 'Menú ejecutivo mediodía', 14.00);

INSERT INTO SUCURSALES (Nombre_sucursal, Barrio)
VALUES ('Central', 'Miraflores'),
       ('Avenida Principal', 'Miraflores'),
       ('Shopping Mall', 'Valle Sol'),
       ('Plaza Mayor', 'Valle Sol'),
       ('Aeropuerto', 'Bosque Alto'),
       ('Distrito Financiero', 'Bosque Alto'),
       ('Universidad', 'La Ribera'),
       ('Universidad Bis', 'La Ribera'),
       ('Estadio', 'La Ribera'),
       ('Costanera', 'Cumbres Verdes'),
       ('Parque Industrial', 'Cumbres Verdes'),
       ('Ruta 5', 'San Ignacio'),
       ('Paseo del Sol', 'San Ignacio'),
       ('Galería Central', 'San Ignacio'),
       ('Torre Norte', 'Las Colinas'),
       ('Mirador', 'Puerto Nuevo'),
       ('El Puerto', 'Puerto Nuevo'),
       ('Terminal', 'El Robledal'),
       ('Boulevard', 'El Robledal'),
       ('Esquina Joven', 'El Robledal'),
       ('La Rotonda', 'Villa Serena');

INSERT INTO EMPLEADOS (Dni, Nombre, Apellido, Nombre_sucursal)
VALUES (35123456, 'Juan', 'Pérez', 'Central'),
       (38765432, 'María', 'González', 'Central'),
       (40111222, 'Carlos', 'Rodríguez', 'Shopping Mall'),
       (41333444, 'Ana', 'López', 'Plaza Mayor'),
       (39555666, 'Pedro', 'Martínez', 'Shopping Mall'),
       (42888777, 'Laura', 'García', 'Aeropuerto'),
       (37999000, 'Diego', 'Sánchez', 'Central'),
       (43123123, 'Sofía', 'Romero', 'Central'),
       (29876543, 'Javier', 'Gómez', 'Universidad'),
       (34567890, 'Valentina', 'Díaz', 'Estadio'),
       (36123457, 'Martín', 'Fernández', 'Costanera'),
       (44987654, 'Camila', 'Ruiz', 'Parque Industrial'),
       (33876543, 'Daniel', 'Alvarez', 'Ruta 5'),
       (40123458, 'Julieta', 'Torres', 'Paseo del Sol'),
       (38765433, 'Sebastián', 'Ramírez', 'Galería Central'),
       (42123459, 'Isabella', 'Flores', 'Torre Norte'),
       (37567891, 'Luciano', 'Benítez', 'Mirador'),
       (41987655, 'Martina', 'Acosta', 'El Puerto'),
       (36123458, 'Nicolás', 'Medina', 'Terminal'),
       (44876544, 'Renata', 'Herrera', 'Boulevard'),
       (34567892, 'Facundo', 'Suárez', 'Esquina Joven'),
       (39123459, 'Emilia', 'Castro', 'La Rotonda'),
       (38765434, 'Agustín', 'Giménez', 'Central'),
       (43123460, 'Victoria', 'Rojas', 'Shopping Mall'),
       (37567893, 'Federico', 'Molina', 'Universidad'),
       (41987656, 'Catalina', 'Ortiz', 'Estadio'),
       (36123459, 'Joaquín', 'Silva', 'Costanera'),
       (44876545, 'Paula', 'Núñez', 'Parque Industrial'),
       (34567894, 'Andrés', 'Soto', 'Ruta 5'),
       (39123460, 'Lucía', 'Ríos', 'Paseo del Sol'),
       (38765435, 'Mateo', 'Peralta', 'Galería Central'),
       (43123461, 'Florencia', 'Cabrera', 'Torre Norte'),
       (37567894, 'Tomás', 'Godoy', 'Mirador'),
       (41987657, 'Clara', 'Moreno', 'El Puerto'),
       (36123460, 'Ignacio', 'Ferreyra', 'Terminal'),
       (44876546, 'Delfina', 'Domínguez', 'Boulevard'),
       (34567895, 'Felipe', 'Carrizo', 'Esquina Joven'),
       (39123461, 'Agostina', 'Paz', 'La Rotonda'),
       (38765436, 'Santiago', 'Figueroa', 'Central'),
       (43123462, 'Manuela', 'Blanco', 'Shopping Mall'),
       (37567895, 'Francisco', 'Méndez', 'Universidad'),
       (41987658, 'Micaela', 'Vega', 'Estadio'),
       (36123461, 'Bautista', 'Juárez', 'Costanera'),
       (44876547, 'Josefina', 'Quiroga', 'Parque Industrial'),
       (34567896, 'Manuel', 'Castillo', 'Ruta 5'),
       (39123462, 'Abril', 'Muñoz', 'Paseo del Sol'),
       (38765437, 'Benjamín', 'Luna', 'Galería Central'),
       (43123463, 'Olivia', 'Correa', 'Torre Norte'),
       (37567896, 'Joaquín', 'Giménez', 'Mirador'),
       (41987659, 'Valeria', 'Morales', 'El Puerto'),
       (36123462, 'Lautaro', 'Navarro', 'Terminal'),
       (44876548, 'Bianca', 'Ponce', 'Boulevard'),
       (34567897, 'Esteban', 'Roldán', 'Esquina Joven'),
       (39123463, 'Zoe', 'Ibarra', 'La Rotonda'),
       (38765438, 'Leonardo', 'Guzmán', 'Central'),
       (43123464, 'Alma', 'Aguirre', 'Shopping Mall'),
       (37567897, 'Patricio', 'Sosa', 'Universidad'),
       (41987660, 'Malena', 'Ledesma', 'Estadio'),
       (36123463, 'Ramiro', 'Vera', 'Costanera'),
       (44876549, 'Guadalupe', 'Valdez', 'Parque Industrial'),
       (34567898, 'Hernán', 'Santillán', 'Ruta 5'),
       (39123464, 'Candelaria', 'Villalba', 'Paseo del Sol'),
       (38765439, 'Maximiliano', 'Pereyra', 'Galería Central'),
       (43123465, 'Guillermina', 'ACOSTA', 'Torre Norte'),
       (37567898, 'Eduardo', 'Bravo', 'Mirador'),
       (41987661, 'Sabrina', 'Campos', 'El Puerto'),
       (36123464, 'Ezequiel', 'Chávez', 'Terminal'),
       (44876550, 'Rosario', 'Montenegro', 'Boulevard'),
       (34567899, 'Cristian', 'Toledo', 'Esquina Joven'),
       (39123465, 'Lola', 'Vargas', 'La Rotonda'),
       (38765440, 'Franco', 'Maldonado', 'Central'),
       (43123466, 'Elena', 'Orellana', 'Shopping Mall'),
       (37567899, 'Mariano', 'Córdoba', 'Universidad'),
       (41987662, 'Jazmín', 'Salazar', 'Estadio'),
       (36123465, 'Bruno', 'Miranda', 'Costanera'),
       (44876551, 'Ambar', 'Baez', 'Parque Industrial'),
       (34567900, 'Adrián', 'Arias', 'Ruta 5'),
       (39123466, 'Mía', 'Pacheco', 'Paseo del Sol'),
       (38765441, 'Sergio', 'Farias', 'Galería Central'),
       (43123467, 'Amanda', 'Rivero', 'Torre Norte'),
       (37567900, 'Ricardo', 'Gallo', 'Mirador'),
       (41987663, 'Carolina', 'Barrera', 'El Puerto'),
       (36123466, 'Gonzalo', 'Peralta', 'Terminal'),
       (44876552, 'Milagros', 'Franco', 'Boulevard'),
       (34567901, 'Walter', 'Lucero', 'Esquina Joven'),
       (39123467, 'Luisina', 'Bustos', 'La Rotonda'),
       (38765442, 'Emiliano', 'Zárate', 'Central'),
       (43123468, 'Julieta', 'Cáceres', 'Shopping Mall'),
       (37567901, 'Gerardo', 'Reynoso', 'Universidad'),
       (41987664, 'Natalia', 'Escobar', 'Estadio'),
       (36123467, 'Oscar', 'Vázquez', 'Costanera'),
       (44876553, 'Paulina', 'Marín', 'Parque Industrial'),
       (34567902, 'Alfredo', 'Amaya', 'Ruta 5'),
       (39123468, 'Antonella', 'Cardozo', 'Paseo del Sol'),
       (38765443, 'Cesar', 'Soria', 'Galería Central'),
       (43123469, 'Eliana', 'Ayala', 'Torre Norte'),
       (37567902, 'Jorge', 'Pereyra', 'Mirador'),
       (41987665, 'Gabriela', 'Britez', 'El Puerto'),
       (36123468, 'Ivan', 'Cano', 'Central');

-- 2. Obtener la cantidad de empleados por sucursal, y ordenar de mayor a menor.

SELECT Nombre_sucursal, COUNT(Dni) as Cantidad_empleados
FROM EMPLEADOS
GROUP BY Nombre_sucursal
ORDER BY Cantidad_empleados DESC;

-- 3. Obtener los barrios donde no hay sucursales de la cadena.

SELECT total_sucursales.Nombre
FROM (SELECT Nombre, COUNT(Nombre_sucursal) as cantidad_sucursales
      FROM SUCURSALES
               FULL OUTER JOIN BARRIOS ON Barrio = Nombre
      GROUP BY Nombre) as total_sucursales
WHERE cantidad_sucursales = 0;

-- 4. Obtener los barrios donde hay más sucursales, y mostrar dicha cantidad. -> Todos los que tengan la cantidad máxima.

SELECT Barrio, COUNT(*) as cs
FROM SUCURSALES
GROUP BY Barrio
HAVING COUNT(*) = (SELECT MAX(cs)
                   FROM (SELECT COUNT(*) as cs
                         FROM SUCURSALES
                         GROUP BY Barrio) as aux2);


-- 5. Obtener los combos que poseen igual precio, mostrando los campos “numero_combo”, “descripción”, y “precio”.

SELECT *
FROM COMBOS
WHERE Precio IN (SELECT Precio
                 FROM COMBOS
                 group by Precio
                 HAVING COUNT(*) > 1);
-- ORDER BY Precio DESC;

DROP SCHEMA hamburgueserias CASCADE;