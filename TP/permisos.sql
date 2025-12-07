/* ROLES DEL SISTEMA (por si no existen)*/
CREATE ROLE Administrador;
CREATE ROLE Usuario;

/*
ADMINISTRADOR
Tiene control total del esquema y elementos  
*/

-- Acceso total al esquema
GRANT
ALL
PRIVILEGES
ON
SCHEMA
red_social_bdd TO Administrador;

-- Acceso total a todas las tablas del esquema
GRANT ALL PRIVILEGES ON ALL
TABLES IN SCHEMA red_social_bdd TO Administrador;

-- Acceso total a todas las secuencias del esquema
GRANT USAGE,
SELECT,
UPDATE
ON ALL SEQUENCES IN SCHEMA red_social_bdd TO Administrador;

/*
 USUARIO 
Puede crear publicaciones, grupos y enviar mensajes  
*/

-- Permiso para usar el esquema
GRANT
USAGE
ON
SCHEMA
red_social_bdd TO Usuario;

-- Permisos para crear publicaciones 
GRANT SELECT, INSERT ON red_social_bdd.Posteos TO Usuario;
GRANT SELECT, INSERT ON red_social_bdd.Texto TO Usuario;
GRANT SELECT, INSERT ON red_social_bdd.Imagen TO Usuario;
GRANT SELECT, INSERT ON red_social_bdd.Video TO Usuario;

-- Publicaciones realizadas por un usuario
GRANT SELECT, INSERT ON red_social_bdd.Pubica TO Usuario;

-- Permisos para crear grupos
GRANT SELECT, INSERT ON red_social_bdd.Grupos TO Usuario;

-- Permite unirse al grupo
GRANT SELECT, INSERT ON red_social_bdd.Pertenece_a TO Usuario;

-- Permisos para enviar mensajes entre usuarios 
GRANT SELECT, INSERT ON red_social_bdd.Envia TO Usuario;

-- Permisos sobre favoritos, comentarios y likes 
GRANT SELECT, INSERT, DELETE ON red_social_bdd.Favorito TO Usuario;
GRANT SELECT, INSERT ON red_social_bdd.Comentarios TO Usuario;

-- Permisos sobre amistades
GRANT SELECT, INSERT ON red_social_bdd.Amigos TO Usuario;
GRANT SELECT, INSERT ON red_social_bdd.Amistades TO Usuario;

-- Permisos sobre notificaciones recibidas 
GRANT SELECT, INSERT ON red_social_bdd.Notificaciones TO Usuario;
GRANT SELECT, INSERT ON red_social_bdd.Recibe TO Usuario;

-- Publicaciones que aparecen por amigos o grupos
GRANT SELECT, INSERT ON red_social_bdd.PublicacionesAmigos TO Usuario;
GRANT SELECT, INSERT ON red_social_bdd.PublicacionesGrupos TO Usuario;

-- Permisos sobre secuencias
GRANT
USAGE,
SELECT
ON ALL SEQUENCES IN SCHEMA red_social_bdd TO Usuario;

