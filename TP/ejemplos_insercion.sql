------------------------------------------------------
-- Usuarios (15)
------------------------------------------------------

INSERT INTO Usuarios
VALUES ('juan01', 'juan@mail.com', 'Argentina', 5),
       ('maria23', 'maria@mail.com', 'Brasil', 3),
       ('luis88', 'luis@mail.com', 'Chile', 1),
       ('ana17', 'ana@mail.com', 'Uruguay', 7),
       ('pedro54', 'pedro@mail.com', 'Paraguay', 0),
       ('carla99', 'carla@mail.com', 'Argentina', 4),
       ('sofia12', 'sofia@mail.com', 'Brasil', 9),
       ('roberto', 'roberto@mail.com', 'Chile', 2),
       ('flor31', 'flor@mail.com', 'Uruguay', 11),
       ('diego77', 'diego@mail.com', 'Paraguay', 6),
       ('lucas34', 'lucas@mail.com', 'Argentina', 1),
       ('vale45', 'vale@mail.com', 'Brasil', 3),
       ('tomas15', 'tomas@mail.com', 'Chile', 8),
       ('ema67', 'ema@mail.com', 'Uruguay', 2),
       ('agustin', 'agustin@mail.com', 'Paraguay', 12);

------------------------------------------------------
-- Grupos (15)
------------------------------------------------------

INSERT INTO Grupos (nombre, descripcion, creador)
VALUES ('Programadores', 'Grupo de desarrollo de software', 'juan01'),
       ('FutbolArg', 'Debates de fútbol', 'maria23'),
       ('CocinaTop', 'Recetas caseras', 'ana17'),
       ('GamersLatam', 'Comunidad gamer', 'luis88'),
       ('Viajeros', 'Turismo y viajes', 'sofia12'),
       ('ArteDigital', 'Diseño y dibujo digital', 'flor31'),
       ('FotografiaPRO', 'Fotografía profesional', 'carla99'),
       ('MusicaYA', 'Música latina', 'pedro54'),
       ('GymLife', 'Rutinas y ejercicios', 'diego77'),
       ('AutosSport', 'Amantes de los autos', 'roberto'),
       ('CinePlus', 'Cine y series', 'tomas15'),
       ('AnimeClub', 'Fans del anime', 'ema67'),
       ('TechWorld', 'Tecnología y hardware', 'lucas34'),
       ('LibrosYA', 'Lectores apasionados', 'vale45'),
       ('Mascotas', 'Animales y cuidado', 'agustin');

------------------------------------------------------
-- Posteos (15)
------------------------------------------------------

INSERT INTO Posteos DEFAULT
VALUES; -- 1
INSERT INTO Posteos DEFAULT
VALUES; -- 2
INSERT INTO Posteos DEFAULT
VALUES; -- 3
INSERT INTO Posteos DEFAULT
VALUES; -- 4
INSERT INTO Posteos DEFAULT
VALUES; -- 5
INSERT INTO Posteos DEFAULT
VALUES; -- 6
INSERT INTO Posteos DEFAULT
VALUES; -- 7
INSERT INTO Posteos DEFAULT
VALUES; -- 8
INSERT INTO Posteos DEFAULT
VALUES; -- 9
INSERT INTO Posteos DEFAULT
VALUES; -- 10
INSERT INTO Posteos DEFAULT
VALUES; -- 11
INSERT INTO Posteos DEFAULT
VALUES; -- 12
INSERT INTO Posteos DEFAULT
VALUES; -- 13
INSERT INTO Posteos DEFAULT
VALUES; -- 14
INSERT INTO Posteos DEFAULT
VALUES;
-- 15

------------------------------------------------------
-- Texto (5)
------------------------------------------------------

INSERT INTO Texto
VALUES (1, 'Hola a todos, este es mi primer post!'),
       (2, 'Receta de empanadas caseras.'),
       (3, 'Consejos para mejorar en programación.'),
       (4, 'Reseña de la última película que vi.'),
       (5, 'Crónica del partido de ayer.');

------------------------------------------------------
-- Imagen (5)
------------------------------------------------------

INSERT INTO Imagen
VALUES (6, 'http://img.com/foto1.jpg', '1080p'),
       (7, 'http://img.com/foto2.jpg', '720p'),
       (8, 'http://img.com/foto3.jpg', '4K'),
       (9, 'http://img.com/foto4.jpg', '1080p'),
       (10, 'http://img.com/foto5.jpg', '480p');

------------------------------------------------------
-- Video (5)
------------------------------------------------------

INSERT INTO Video
VALUES (11, 'http://video.com/vid1.mp4', '00:02:30'),
       (12, 'http://video.com/vid2.mp4', '00:05:10'),
       (13, 'http://video.com/vid3.mp4', '00:01:45'),
       (14, 'http://video.com/vid4.mp4', '00:10:00'),
       (15, 'http://video.com/vid5.mp4', '00:00:55');

------------------------------------------------------
-- Comentarios (15)
------------------------------------------------------

INSERT INTO Comentarios
VALUES (1, 'maria23', 'Buen post!', NOW()),
       (1, 'carla99', 'Interesante!', NOW()),
       (2, 'juan01', 'Voy a probarla.', NOW()),
       (3, 'roberto', 'Muy útil gracias.', NOW()),
       (4, 'sofia12', 'Me encantó.', NOW()),
       (5, 'ema67', 'Gran análisis.', NOW()),
       (6, 'flor31', 'Hermosa foto!', NOW()),
       (7, 'vale45', 'Muy buena composición.', NOW()),
       (8, 'tomas15', 'Increíble captura!', NOW()),
       (9, 'diego77', 'Excelente!', NOW()),
       (10, 'luis88', 'Muy buena imagen.', NOW()),
       (11, 'ana17', 'Lindo video!', NOW()),
       (12, 'agustin', 'Muy divertido!', NOW()),
       (13, 'pedro54', 'Buen aporte.', NOW()),
       (14, 'lucas34', 'Me gustó!', NOW());

------------------------------------------------------
-- Notificaciones (15)
------------------------------------------------------

INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;
INSERT INTO Notificaciones DEFAULT
VALUES;

------------------------------------------------------
-- Amistades (15)
------------------------------------------------------

INSERT INTO Amistades (id_notificacion, id_solicitante)
VALUES (1, 'juan01'),
       (2, 'maria23'),
       (3, 'luis88'),
       (4, 'ana17'),
       (5, 'pedro54'),
       (6, 'carla99'),
       (7, 'sofia12'),
       (8, 'roberto'),
       (9, 'flor31'),
       (10, 'diego77'),
       (11, 'lucas34'),
       (12, 'vale45'),
       (13, 'tomas15'),
       (14, 'ema67'),
       (15, 'agustin');

------------------------------------------------------
-- PublicacionesAmigos (15)
------------------------------------------------------

INSERT INTO PublicacionesAmigos (id_notificacion, id_posteo, nombre_usuario)
VALUES (1, 1, 'juan01'),
       (2, 2, 'maria23'),
       (3, 3, 'luis88'),
       (4, 4, 'ana17'),
       (5, 5, 'pedro54'),
       (6, 6, 'carla99'),
       (7, 7, 'sofia12'),
       (8, 8, 'roberto'),
       (9, 9, 'flor31'),
       (10, 10, 'diego77'),
       (11, 11, 'lucas34'),
       (12, 12, 'vale45'),
       (13, 13, 'tomas15'),
       (14, 14, 'ema67'),
       (15, 15, 'agustin');

------------------------------------------------------
-- PublicacionesGrupos (15)
------------------------------------------------------

INSERT INTO PublicacionesGrupos (id_notificacion, id_posteo, id_grupo)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3),
       (4, 4, 4),
       (5, 5, 5),
       (6, 6, 6),
       (7, 7, 7),
       (8, 8, 8),
       (9, 9, 9),
       (10, 10, 10),
       (11, 11, 11),
       (12, 12, 12),
       (13, 13, 13),
       (14, 14, 14),
       (15, 15, 15);

------------------------------------------------------
-- Mensaje (15)
------------------------------------------------------

INSERT INTO Mensajes (usuario_destino, fecha, contenido)
VALUES ('maria23', CURRENT_DATE, 'mensaje'),
       ('luis88', CURRENT_DATE, 'mensaje'),
       ('ana17', CURRENT_DATE, 'mensaje'),
       ('pedro54', CURRENT_DATE, 'mensaje'),
       ('carla99', CURRENT_DATE, 'mensaje'),
       ('sofia12', CURRENT_DATE, 'mensaje'),
       ('roberto', CURRENT_DATE, 'mensaje'),
       ('flor31', CURRENT_DATE, 'mensaje'),
       ('diego77', CURRENT_DATE, 'mensaje'),
       ('lucas34', CURRENT_DATE, 'mensaje'),
       ('vale45', CURRENT_DATE, 'mensaje'),
       ('tomas15', CURRENT_DATE, 'mensaje'),
       ('ema67', CURRENT_DATE, 'mensaje'),
       ('agustin', CURRENT_DATE, 'mensaje'),
       ('juan01', CURRENT_DATE, 'mensaje');

------------------------------------------------------
-- Envia (15)
------------------------------------------------------

INSERT INTO Envia
VALUES ('juan01', 'maria23', CURRENT_DATE),
       ('maria23', 'luis88', CURRENT_DATE),
       ('luis88', 'ana17', CURRENT_DATE),
       ('ana17', 'pedro54', CURRENT_DATE),
       ('pedro54', 'carla99', CURRENT_DATE),
       ('carla99', 'sofia12', CURRENT_DATE),
       ('sofia12', 'roberto', CURRENT_DATE),
       ('roberto', 'flor31', CURRENT_DATE),
       ('flor31', 'diego77', CURRENT_DATE),
       ('diego77', 'lucas34', CURRENT_DATE),
       ('lucas34', 'vale45', CURRENT_DATE),
       ('vale45', 'tomas15', CURRENT_DATE),
       ('tomas15', 'ema67', CURRENT_DATE),
       ('ema67', 'agustin', CURRENT_DATE),
       ('agustin', 'juan01', CURRENT_DATE);

------------------------------------------------------
-- Publica (15)
------------------------------------------------------

INSERT INTO Publica (id_posteo, nombre_usuario)
VALUES (1, 'juan01'),
       (2, 'maria23'),
       (3, 'luis88'),
       (4, 'ana17'),
       (5, 'pedro54'),
       (6, 'carla99'),
       (7, 'sofia12'),
       (8, 'roberto'),
       (9, 'flor31'),
       (10, 'diego77'),
       (11, 'lucas34'),
       (12, 'vale45'),
       (13, 'tomas15'),
       (14, 'ema67'),
       (15, 'agustin');

------------------------------------------------------
-- Favoritos (15)
------------------------------------------------------

INSERT INTO Favoritos
VALUES ('juan01', 1),
       ('maria23', 2),
       ('luis88', 3),
       ('ana17', 4),
       ('pedro54', 5),
       ('carla99', 6),
       ('sofia12', 7),
       ('roberto', 8),
       ('flor31', 9),
       ('diego77', 10),
       ('lucas34', 11),
       ('vale45', 12),
       ('tomas15', 13),
       ('ema67', 14),
       ('agustin', 15);

------------------------------------------------------
-- Amigos (15)
------------------------------------------------------

INSERT INTO Amigos
VALUES ('juan01', 'maria23'),
       ('maria23', 'luis88'),
       ('luis88', 'ana17'),
       ('ana17', 'pedro54'),
       ('pedro54', 'carla99'),
       ('carla99', 'sofia12'),
       ('sofia12', 'roberto'),
       ('roberto', 'flor31'),
       ('flor31', 'diego77'),
       ('diego77', 'lucas34'),
       ('lucas34', 'vale45'),
       ('vale45', 'tomas15'),
       ('tomas15', 'ema67'),
       ('ema67', 'agustin'),
       ('agustin', 'juan01');

------------------------------------------------------
-- Pertenece_a (15)
------------------------------------------------------

INSERT INTO Pertenece_a
VALUES ('juan01', 1),
       ('maria23', 2),
       ('luis88', 3),
       ('ana17', 4),
       ('pedro54', 5),
       ('carla99', 6),
       ('sofia12', 7),
       ('roberto', 8),
       ('flor31', 9),
       ('diego77', 10),
       ('lucas34', 11),
       ('vale45', 12),
       ('tomas15', 13),
       ('ema67', 14),
       ('agustin', 15);

------------------------------------------------------
-- Recibe (15)
------------------------------------------------------

INSERT INTO Recibe
VALUES ('juan01', 1),
       ('maria23', 2),
       ('luis88', 3),
       ('ana17', 4),
       ('pedro54', 5),
       ('carla99', 6),
       ('sofia12', 7),
       ('roberto', 8),
       ('flor31', 9),
       ('diego77', 10),
       ('lucas34', 11),
       ('vale45', 12),
       ('tomas15', 13),
       ('ema67', 14),
       ('agustin', 15);

