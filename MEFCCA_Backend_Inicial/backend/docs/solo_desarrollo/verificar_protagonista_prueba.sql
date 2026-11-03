/* SOLO PARA DESARROLLO LOCAL.
   Este script permite probar la regla de publicación hasta que se implemente
   la ruta administrativa de verificación. No usar como proceso institucional
   ni ejecutar en una base de producción.

   1. Cambie el correo de ejemplo por el de la cuenta protagonista propia.
   2. Ejecute primero el SELECT y compruebe la cuenta.
   3. Ejecute el UPDATE únicamente para la cuenta de prueba aprobada por el equipo.
*/
USE MEFCCA_DB;
GO
DECLARE @correo NVARCHAR(254) = N'protagonista.prueba@example.com';

SELECT u.email, u.rol, p.id_protagonista, p.nombre_negocio, p.estado_verificacion
FROM dbo.USUARIOS AS u
INNER JOIN dbo.PROTAGONISTAS AS p ON p.id_usuario = u.id_usuario
WHERE u.email = @correo;
GO

DECLARE @correo_actualizar NVARCHAR(254) = N'protagonista.prueba@example.com';
UPDATE p
SET estado_verificacion = 1
FROM dbo.PROTAGONISTAS AS p
INNER JOIN dbo.USUARIOS AS u ON u.id_usuario = p.id_usuario
WHERE u.email = @correo_actualizar AND u.rol = N'Protagonista';

SELECT u.email, p.nombre_negocio, p.estado_verificacion
FROM dbo.USUARIOS AS u
INNER JOIN dbo.PROTAGONISTAS AS p ON p.id_usuario = u.id_usuario
WHERE u.email = @correo_actualizar;
GO
