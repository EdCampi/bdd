CREATE SCHEMA red_social_bdd;

SET SEARCH_PATH TO red_social_bdd;

CREATE TABLE Usuarios
(
    nombre_usuario    VARCHAR(20) PRIMARY KEY,
    correo            VARCHAR(50) NOT NULL UNIQUE CHECK (correo LIKE '%@%._%'),
    pais              VARCHAR(40) NOT NULL CHECK (pais IN ('Argentina', 'Brasil', 'Chile', 'Uruguay', 'Paraguay')),
    contador_ingresos INT DEFAULT 0 CHECK (contador_ingresos >= 0)
);


-- create
CREATE TABLE Grupos
(
    id_grupo       SERIAL PRIMARY KEY,
    nombre         VARCHAR(50) NOT NULL,
    descripcion    TEXT,
    fecha_creacion DATE        NOT NULL DEFAULT CURRENT_DATE,
    creador        VARCHAR(50) NOT NULL,
    FOREIGN KEY (creador) REFERENCES Usuarios (nombre_usuario)
);

CREATE TABLE Posteos
(
    id    SERIAL PRIMARY KEY,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE
);


CREATE TABLE Texto
(
    id_posteo INT PRIMARY KEY,
    contenido TEXT NOT NULL,
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id)
);

CREATE TABLE Imagen
(
    id_posteo  INT PRIMARY KEY,
    url        VARCHAR(255) NOT NULL,
    resolucion VARCHAR(20),
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id)
);

CREATE TABLE Video
(
    id_posteo INT PRIMARY KEY,
    url       VARCHAR(255) NOT NULL,
    duracion  INTERVAL,
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id)
);

CREATE TABLE Favorito
(
    nombre_usuario VARCHAR(20) NOT NULL,
    id_posteo      INT         NOT NULL,
    PRIMARY KEY (nombre_usuario, id_posteo),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuarios (nombre_usuario),
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id)
);

CREATE TABLE Comentarios
(
    id_posteo         INT         NOT NULL,
    id_nombre_usuario VARCHAR(20) NOT NULL,
    comentario        TEXT        NOT NULL,
    fecha             TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_posteo, id_nombre_usuario, fecha),
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id),
    FOREIGN KEY (id_nombre_usuario) REFERENCES Usuarios (nombre_usuario)
);



CREATE TABLE Notificaciones
(
    id_notificacion SERIAL PRIMARY KEY,
    fecha           DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Amistades
(
    id_notificacion SERIAL PRIMARY KEY,
    id_solicitante  VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_solicitante) REFERENCES Usuarios (nombre_usuario)
);

CREATE TABLE PublicacionesAmigos
(
    id_notificacion SERIAL PRIMARY KEY,
    id_posteo       INT NOT NULL,
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id)
);

CREATE TABLE PublicacionesGrupos
(
    id_notificacion SERIAL PRIMARY KEY,
    id_posteo       INT NOT NULL,
    id_grupo        INT NOT NULL,
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id),
    FOREIGN KEY (id_grupo) REFERENCES Grupos (id_grupo)
);

-- RELACIONES

CREATE TABLE Envia
(
    id_origen  VARCHAR(20),
    id_destino VARCHAR(20),
    fecha      DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT no_mensaje_a_mi_mismo CHECK (id_origen <> id_destino),
    PRIMARY KEY (id_origen, id_destino),
    FOREIGN KEY (id_origen) REFERENCES Usuarios (nombre_usuario),
    FOREIGN KEY (id_destino) REFERENCES Usuarios (nombre_usuario)
);


CREATE TABLE Pubica
(
    nombre_usuario VARCHAR(20) PRIMARY KEY,
    id_posteo      INT NOT NULL,
    FOREIGN KEY (nombre_usuario) REFERENCES Usuarios (nombre_usuario),
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id)
);

CREATE TABLE Favoritos
(
    nombre_usuario VARCHAR(20) PRIMARY KEY,
    id_posteo      INT NOT NULL,
    FOREIGN KEY (nombre_usuario) REFERENCES Usuarios (nombre_usuario),
    FOREIGN KEY (id_posteo) REFERENCES Posteos (id)
);

CREATE TABLE Amigos
(
    solicitante VARCHAR(20),
    solicitado  VARCHAR(20),
    CONSTRAINT no_es_amigo_el_mismo CHECK (solicitante <> solicitado),
    PRIMARY KEY (solicitante, solicitado),
    FOREIGN KEY (solicitante) REFERENCES Usuarios (nombre_usuario),
    FOREIGN KEY (solicitado) REFERENCES Usuarios (nombre_usuario)
);

CREATE TABLE Pertenece_a
(
    nombre_usuario VARCHAR(20) NOT NULL,
    id_grupo       INT         NOT NULL,
    PRIMARY KEY (nombre_usuario, id_grupo),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuarios (nombre_usuario),
    FOREIGN KEY (id_grupo) REFERENCES Grupos (id_grupo)
);

CREATE TABLE Recibe
(
    nombre_usuario  VARCHAR(20) NOT NULL,
    id_notificacion INT         NOT NULL,
    PRIMARY KEY (nombre_usuario, id_notificacion),
    FOREIGN KEY (nombre_usuario) REFERENCES Usuarios (nombre_usuario),
    FOREIGN KEY (id_notificacion) REFERENCES Notificaciones (id_notificacion)
);

DROP SCHEMA red_social_bdd CASCADE; -- TODO: BORRAR ESTO!
