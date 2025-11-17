-- Registrar un usuario
INSERT INTO Usuarios (nombre_usuario, pais, correo, contador_ingresos) VALUES ('nuevo_usuario', 'Argentina', 'nuevo@ejemplo.com', 0);

-- Listar todos los usuarios de la red social
SELECT * FROM Usuarios;

-- Listar todas las amistades de la red social
SELECT id_usuario, id_solicitante FROM Amigos;

-- Listar los amigos de un usuario particular de la red social
-- Ejemplo para el usuario 'X'
SELECT id_solicitante AS amigo FROM Amigos WHERE id_usuario = 'X'
UNION
SELECT id_usuario AS amigo FROM Amigos WHERE id_solicitante = 'X';

-- Listar todos los mensajes de la red social
SELECT m.fecha, e.nombre_usuario AS remitente, m.id_destino AS destinatario, m.contenido
FROM Mensajes m
JOIN Envia e ON m.fecha = e.fecha AND m.id_destino = e.id_destino;

-- Contabilizar la cantidad de usuarios, agrupados por país
SELECT pais, COUNT(*) AS cantidad_usuarios FROM Usuarios GROUP BY pais;

-- Realizar una publicación (dar un ejemplo de cada tipo)
-- Ejemplo para tipo Texto
INSERT INTO Posteos (id, fecha) VALUES (1, '2025-11-14');
INSERT INTO Textos (id, contenido) VALUES (1, 'Texto');
INSERT INTO Publicaciones (nombre_usuario, id_posteo) VALUES ('nuevo_usuario', 1);

-- Ejemplo para tipo Imagen
INSERT INTO Posteos (id, fecha) VALUES (2, '2025-11-14');
INSERT INTO Imagenes (id, URL, resolucion) VALUES (2, 'http://ejemplo.com/imagen.jpg', '1920x1080');
INSERT INTO Publicaciones (nombre_usuario, id_posteo) VALUES ('nuevo_usuario', 2);

-- Ejemplo para tipo Video
INSERT INTO Posteos (id, fecha) VALUES (3, '2025-11-14');
INSERT INTO Videos (id, duracion) VALUES (3, 120);
INSERT INTO Publicaciones (nombre_usuario, id_posteo) VALUES ('nuevo_usuario', 3);

-- Actualizar una publicación (dar un ejemplo de cada tipo)
-- Ejemplo para tipo Texto (actualizar contenido de post con id=1)
UPDATE Textos SET contenido = 'Contenido de texto actualizado.' WHERE id = 1;

-- Ejemplo para tipo Imagen (actualizar URL y resolución de post con id=2)
UPDATE Imagenes SET URL = 'http://ejemplo.com/nueva_imagen.jpg', resolucion = '1280x720' WHERE id = 2;

-- Ejemplo para tipo Video (actualizar duración de post con id=3)
UPDATE Videos SET duracion = 180 WHERE id = 3;

-- Eliminar una publicación (dar un ejemplo de cada tipo)

-- Ejemplo para tipo Texto (eliminar post con id=1)
DELETE FROM Favoritos WHERE id_posteo = 1;
DELETE FROM Publicaciones WHERE id_posteo = 1;
DELETE FROM Textos WHERE id = 1;
DELETE FROM Posteos WHERE id = 1;

-- Ejemplo para tipo Imagen (eliminar post con id=2)
DELETE FROM Favoritos WHERE id_posteo = 2;
DELETE FROM Publicaciones WHERE id_posteo = 2;
DELETE FROM Imagenes WHERE id = 2;
DELETE FROM Posteos WHERE id = 2;

-- Ejemplo para tipo Video (eliminar post con id=3)
DELETE FROM Favoritos WHERE id_posteo = 3;
DELETE FROM Publicaciones WHERE id_posteo = 3;
DELETE FROM Videos WHERE id = 3;
DELETE FROM Posteos WHERE id = 3;

-- Desregistrar a un usuario de la aplicación (dar un ejemplo)

-- Ejemplo para eliminar 'juan'
DELETE FROM Amigos WHERE id_usuario = 'juan' OR id_solicitante = 'juan';
DELETE FROM Envia WHERE nombre_usuario = 'juan';
DELETE FROM Mensajes WHERE id_destino = 'juan';
DELETE FROM Pertenece WHERE nombre_usuario = 'juan';
DELETE FROM Recibe WHERE nombre_usuario = 'juan';
DELETE FROM Favoritos WHERE nombre_usuario = 'juan';
DELETE FROM Publicaciones WHERE nombre_usuario = 'juan';
DELETE FROM Grupos WHERE id_creador = 'juan';
DELETE FROM Amistad WHERE id_solicitante = 'juan';
DELETE FROM Publicaciones_amigo WHERE id_amigo = 'juan';
DELETE FROM Usuarios WHERE nombre_usuario = 'juan';

-- Mostrar las publicaciones más populares ordenadas por cantidad de “favoritos”
SELECT p.id, COUNT(f.nombre_usuario) AS cantidad_favoritos
FROM Posteos p
LEFT JOIN Favoritos f ON p.id = f.id_posteo
GROUP BY p.id
ORDER BY cantidad_favoritos DESC;

-- Mostrar los usuarios más populares basándose en la cantidad de publicaciones “favoritas” que poseen sus publicaciones
SELECT u.nombre_usuario, COUNT(f.nombre_usuario) AS total_favoritos
FROM Usuarios u
JOIN Publicaciones pub ON u.nombre_usuario = pub.nombre_usuario
JOIN Favoritos f ON pub.id_posteo = f.id_posteo
GROUP BY u.nombre_usuario
ORDER BY total_favoritos DESC;
