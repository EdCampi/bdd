-- Registrar un usuario
INSERT INTO Usuarios (nombre_usuario, pais, correo, contador_ingresos)
VALUES ('nuevo_usuario', 'Argentina', 'nuevo@ejemplo.com', 0);

-- Listar todos los usuarios de la red social
SELECT *
FROM Usuarios;

-- Listar todas las amistades de la red social
SELECT solicitante, solicitado
FROM Amigos;

-- Listar los amigos de un usuario particular de la red social
-- Ejemplo para el usuario 'X'
SELECT solicitado AS amigo
FROM Amigos
WHERE solicitante = 'X'
UNION
SELECT solicitante AS amigo
FROM Amigos
WHERE solicitado = 'X';

-- Listar todos los mensajes de la red social
SELECT m.fecha, e.id_origen AS remitente, m.usuario_destino AS destinatario, m.contenido
FROM Mensajes m
         JOIN Envia e ON m.fecha = e.fecha AND m.usuario_destino = e.id_destino;

-- Contabilizar la cantidad de usuarios, agrupados por país
SELECT pais, COUNT(*) AS cantidad_usuarios
FROM Usuarios
GROUP BY pais;

-- Ejemplos para un tipo Texto (dar un ejemplo de cada tipo)
INSERT INTO Posteo (id, fecha)
VALUES (1, '2025-11-14');
INSERT INTO Texto (id_posteo, contenido)
VALUES (1, 'Texto');
INSERT INTO Publica (id_posteo, nombre_usuario)
VALUES (1, 'nuevo_usuario', 1);

-- Ejemplo para tipo Imagen
INSERT INTO Posteo (id, fecha)
VALUES (2, '2025-11-14');
INSERT INTO Imagen (id_posteo, url, resolucion)
VALUES (2, 'http://ejemplo.com/imagen.jpg', '1920x1080');
INSERT INTO Publica (id_posteo, nombre_usuario)
VALUES (2, 'nuevo_usuario');

-- Ejemplo para tipo Video
INSERT INTO Posteo (id, fecha)
VALUES (3, '2025-11-14');
INSERT INTO Video (id_posteo, url, duracion)
VALUES (3, 'http://ejemplo.com/video.mp4', 120);
INSERT INTO Publica (id_posteo, nombre_usuario)
VALUES (3, 'nuevo_usuario');

-- Actualizar una publicación (dar un ejemplo de cada tipo)
-- Ejemplo para tipo Texto (actualizar contenido de post con id=1)
UPDATE Texto
SET contenido = 'Contenido de texto actualizado.'
WHERE id_posteo = 1;

-- Ejemplo para tipo Imagen (actualizar URL y resolución de post con id=2)
UPDATE Imagen
SET url        = 'http://ejemplo.com/nueva_imagen.jpg',
    resolucion = '1280x720'
WHERE id_posteo = 2;

-- Ejemplo para tipo Video (actualizar duración de post con id=3)
UPDATE Video
SET duracion = 180
WHERE id_posteo = 3;

-- Eliminar una publicación (dar un ejemplo de cada tipo)
-- Ejemplo para tipo Texto (eliminar post con id=1)
DELETE
FROM Favoritos
WHERE id_posteo = 1;
DELETE
FROM Publica
WHERE id_posteo = 1;
DELETE
FROM Texto
WHERE id_posteo = 1;
DELETE
FROM Posteos
WHERE id = 1;

-- Ejemplo para tipo Imagen (eliminar post con id=2)
DELETE
FROM Favoritos
WHERE id_posteo = 2;
DELETE
FROM Publica
WHERE id_posteo = 2;
DELETE
FROM Imagen
WHERE id_posteo = 2;
DELETE
FROM Posteos
WHERE id = 2;

-- Ejemplo para tipo Video (eliminar post con id=3)
DELETE
FROM Favoritos
WHERE id_posteo = 3;
DELETE
FROM Publica
WHERE id_posteo = 3;
DELETE
FROM Video
WHERE id_posteo = 3;
DELETE
FROM Posteos
WHERE id = 3;

-- Desregistrar a un usuario de la aplicación (dar un ejemplo)
-- Ejemplo para eliminar 'juan'
DELETE
FROM Amigos
WHERE solicitado = 'juan'
   OR solicitante = 'juan';
DELETE
FROM Envia
WHERE id_origen = 'juan';
DELETE
FROM Mensajes
WHERE usuario_destino = 'juan';
DELETE
FROM Recibe
WHERE nombre_usuario = 'juan';
DELETE
FROM Favoritos
WHERE nombre_usuario = 'juan';
DELETE
FROM Publica
WHERE nombre_usuario = 'juan';
DELETE
FROM Grupos
WHERE creador = 'juan';
DELETE
FROM AmistadesAmigos
WHERE nombre_usuario = 'juan';
DELETE
FROM PublicacionesAmigos
WHERE nombre_usuario = 'juan';
DELETE
FROM Usuarios
WHERE nombre_usuario = 'juan';

-- Mostrar las publicaciones más populares ordenadas por cantidad de "favoritos"
SELECT p.id, COUNT(f.nombre_usuario) AS cantidad_favoritos
FROM Posteos p
         LEFT JOIN Favoritos f ON p.id = f.id_posteo
GROUP BY p.id
ORDER BY cantidad_favoritos DESC;

-- Mostrar los usuarios más populares basado en la cantidad de publicaciones "favoritas" que poseen sus publicaciones
SELECT u.nombre_usuario, COUNT(f.nombre_usuario) AS total_favoritos
FROM Usuarios u
         JOIN Publica pub ON u.nombre_usuario = pub.nombre_usuario
         JOIN Favoritos f ON pub.id_posteo = f.id_posteo
GROUP BY u.nombre_usuario
ORDER BY total_favoritos DESC;
