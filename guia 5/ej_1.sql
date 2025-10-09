/* Ejercicio 1:  Una cadena que vende hamburguesas en una ciudad, utiliza un sistema de gestión de base de datos,
   para obtener información relevante y tomar decisiones. Dados los siguientes esquemas de relaciones:

   Sucursales: { nombre_sucursal, barrio }
   Combos: { numero_combo, descripcion, precio }
   Empleados: { dni, nombre, apellido, nombre_sucursal }
   Barrios: { nombre }

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
    Barrio NOMBRE_TYPE NOT NULL,
    PRIMARY KEY (Nombre_sucursal),
    FOREIGN KEY (Barrio) REFERENCES BARRIOS(Nombre)
);

CREATE TABLE COMBOS
(
    Numero_combo INT,
    Descripcion VARCHAR(30),
    Precio FLOAT NOT NULL,
    PRIMARY KEY (Numero_combo)
);

CREATE TABLE EMPLEADOS
(
    Dni INT,
    Nombre NOMBRE_TYPE NOT NULL,
    Apellido NOMBRE_TYPE NOT NULL,
    Nombre_sucursal NOMBRE_TYPE,
    PRIMARY KEY (Dni),
    FOREIGN KEY (Nombre_sucursal) REFERENCES SUCURSALES(Nombre_sucursal)
);


-- 2. Obtener la cantidad de empleados por sucursal, y ordenar de mayor a menor.



-- 3. Obtener los barrios donde no hay sucursales de la cadena.
-- 4. Obtener los barrios donde hay más sucursales, y mostrar dicha cantidad.
-- 5. Obtener los combos que poseen igual precio, mostrando los campos “numero_combo”, “descripción”, y “precio”.

DROP SCHEMA hamburgueserias CASCADE;