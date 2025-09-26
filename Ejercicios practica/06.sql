-- un docente puede dictar 0 o muchas materias
CREATE TABLE docentes (
    legajo VARCHAR(32) PRIMARY KEY,
        nombre VARCHAR(32) NOT NULL,
            apellido VARCHAR (32) NOT NULL,
                inicio INT CHECK (1900 <= inicio AND 2025 >= inicio)
                );

                -- una materia es dictada por un unico docente. Puede no tener docente asignado
                CREATE TABLE materias (
                    codigo VARCHAR(32) PRIMARY KEY,
                        legajo_docente VARCHAR(32) DEFAULT NULL,
                            nombre VARCHAR(100) NOT NULL,
                                CONSTRAINT fk_docentes FOREIGN KEY (legajo_docente) REFERENCES docentes(legajo)
                                );


                                CREATE TABLE alumnos (
                                    nombre VARCHAR(32) PRIMARY KEY,
                                        apellido VARCHAR(32) NOT NULL,
                                            dni VARCHAR(32) NOT NULL,
                                                padron VARCHAR(32) NOT NULL
                                                );

                                                -- un alumno puede haber cursado una materia y no haber aprobado aun
                                                CREATE TABLE materias_alumnos (
                                                    codigo_materia VARCHAR(32) NOT NULL,
                                                        padron_alumno VARCHAR(32) NOT NULL,
                                                            nota INT CHECK(nota IS NULL OR (1 <= nota AND nota <= 10)) DEFAULT NULL,
                                                                anio INT CHECK (1990 <= anio AND 2025 >= anio),
                                                                    cuatrimestre INT CHECK(cuatrimestre IN (1, 2)),
                                                                        CONSTRAINT materias_alumno PRIMARY KEY (codigo_materia, padron_alumno)
                                                                        );



                                                                        INSERT INTO docentes (legajo, nombre, apellido, inicio) VALUES
                                                                        ('1234', 'Ana', 'Pérez', 1991),
                                                                        ('5678', 'Luis', 'García', 2012),
                                                                        ('2121', 'María', 'López', 2008),
                                                                        ('3434', 'Carlos', 'Sánchez', 2015),
                                                                        ('2112', 'Laura', 'Martínez', 2020),
                                                                        ('1111', 'Pedro', 'Fernández', 2011),
                                                                        ('7878', 'Lucía', 'Romero', 2018),
                                                                        ('8989', 'Jorge', 'Díaz', 2005),
                                                                        ('0099', 'Marta', 'Gómez', 2013),
                                                                        ('5656', 'Raúl', 'Torres', 2016),
                                                                        ('1112', 'Jorge', 'Perez', 2005),
                                                                        ('9090', 'Pedro', 'Gómez', 2013),
                                                                        ('5754', 'Martin', 'Torres', 2016);


                                                                        INSERT INTO materias (codigo, legajo_docente, nombre) VALUES
                                                                        ('75.01', NULL, 'Análisis Matemático I'),
                                                                        ('62.01', '2121', 'Álgebra I'),
                                                                        ('95.01', '0099', 'Física I'),
                                                                        ('75.02', '5656', 'Análisis Matemático II'),
                                                                        ('66.01', '1234', 'Matemática Discreta'),
                                                                        ('95.02', '5678', 'Física II'),
                                                                        ('61.08', NULL, 'Química'),
                                                                        ('75.03', '5656', 'Análisis Matemático III'),
                                                                        ('62.02', NULL, 'Álgebra II'),
                                                                        ('66.03', '3434', 'Probabilidades y Estadística'),
                                                                        ('66.04', '2112', 'Análisis Numérico'),
                                                                        ('61.09', '1112', 'Medios de Representación'),
                                                                        ('61.03', '9090', 'Técnicas Digitales'),
                                                                        ('61.07', '5754', 'Arquitectura de Computadoras'),
                                                                        ('66.02', '0099', 'Lógica y Representación del Conocimiento'),
                                                                        ('75.04', '1111', 'Modelos y Simulación'),
                                                                        ('66.06', NULL, 'Sistemas Concurrentes'),
                                                                        ('66.07', '5754', 'Sistemas Distribuidos'),
                                                                        ('66.08', NULL, 'Redes de Datos'),
                                                                        ('66.09', NULL, 'Seguridad Informática'),
                                                                        ('66.10', NULL, 'Sistemas Operativos'),
                                                                        ('66.11', '1112', 'Bases de Datos'),
                                                                        ('66.12', '1112', 'Bases de Datos Avanzadas'),
                                                                        ('66.13', NULL, 'Programación I'),
                                                                        ('66.14', NULL, 'Programación II'),
                                                                        ('66.15', NULL, 'Programación III'),
                                                                        ('66.16', NULL, 'Lenguajes de Programación'),
                                                                        ('66.17', '3434', 'Autómatas y Lenguajes Formales'),
                                                                        ('66.18', NULL, 'Ingeniería de Software I'),
                                                                        ('66.19', NULL, 'Ingeniería de Software II'),
                                                                        ('66.20', NULL, 'Ingeniería de Software III'),
                                                                        ('66.21', NULL, 'Ingeniería de Software IV'),
                                                                        ('66.22', '7878', 'Inteligencia Artificial'),
                                                                        ('66.23', NULL, 'Proyecto Final'),
                                                                        ('75.10', NULL, 'Responsabilidad Social y Ambiental'),
                                                                        ('87.01', NULL, 'Economía General'),
                                                                        ('87.02', '3434', 'Administración General'),
                                                                        ('75.11', NULL, 'Ética Profesional'),
                                                                        ('75.12', NULL, 'Gestión de Proyectos'),
                                                                        ('75.13', NULL, 'Práctica Profesional Supervisada');

                                                                        INSERT INTO alumnos (nombre, apellido, dni, padron) VALUES
                                                                        ('Juan', 'Rodríguez', '30111222', '103888'),
                                                                        ('Sofía', 'Martínez', '30999888', '108777'),
                                                                        ('Diego', 'López', '31222333', '108939'),
                                                                        ('Camila', 'Fernández', '29888777', '107635'),
                                                                        ('Mateo', 'Gómez', '31555666', '102383'),
                                                                        ('Valentina', 'Díaz', '30000111', '104333'),
                                                                        ('Lucas', 'Torres', '32222333', '105686'),
                                                                        ('Martina', 'Romero', '30555666', '103457'),
                                                                        ('Nicolás', 'Sánchez', '31111222', '108776'),
                                                                        ('Florencia', 'Pérez', '29999333', '103870');



                                                                        INSERT INTO materias_alumnos (codigo_materia, padron_alumno, nota, anio, cuatrimestre) VALUES
                                                                        ('75.02', '103888', 8, 2023, 1),
                                                                        ('62.02', '108777', 6, 2023, 1),
                                                                        ('66.13', '108939', 7, 2024, 2),
                                                                        ('66.14', '107635', NULL, 2024, 2),
                                                                        ('66.13', '102383', 9, 2022, 1),
                                                                        ('66.08', '105686', 10, 2023, 2),
                                                                        ('66.18', '103457', NULL, 2025, 1),
                                                                        ('66.10', '108776', 5, 2024, 1),
                                                                        ('66.10', '103870', 4, 2025, 2),
                                                                        ('66.11', '103870', 7, 2023, 2),
                                                                        ('66.11', '103457', 7, 2023, 2),
                                                                        ('66.11', '102383', 7, 2023, 2),
                                                                        ('66.11', '108939', 9, 2023, 2),
                                                                        ('66.11', '108777', NULL, 2023, 2),
                                                                        ('66.11', '103888', 10, 2023, 2);

                                                                        -- 1. Buscar a todos los alumnos que hayan cursado 'Base de Datos' en el 2do cuatriestre de 2023.
                                                                        