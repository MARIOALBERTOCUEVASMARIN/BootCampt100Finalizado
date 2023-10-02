ejercicios finales 

--Realizar una vista vAlumnos que obtenga el siguiente resultado

GO

CREATE OR ALTER VIEW vAlumnos
AS
SELECT A.id, A.nombre, A.primerApellido, A.segundoaPellido, A.correo, A.telefono, A.curp, E.nombre AS Estado, EA.nombre AS Estatus
FROM Alumnos A
INNER JOIN Estados E ON A.idEstadoOrigen = E.id
INNER JOIN EstatusAlumnos EA ON A.idEstatus = EA.id

GO
SELECT *
FROM vAlumnos

--------------------------------------------------------------------------------------------------------
--Realizar el procedimiento almacenado consultarEstados el cual obtendrá la 
--siguiente consulta, recibiendo como parámetro el id del registro que se 
--requiere consultar de la tabla Estados. En caso de que el valor sea -1 (menos 
--uno) deberá regresar todos los registros de dicha tabla

go
create or alter procedure 
@id int
 as
select id, nombre
from estados
where id=@id OR @id<0

exec consultarEstados @id=-1;

---------------------------------------------------------------------------------------------------------------------------
--Realizar el procedimiento almacenado consultarEstatusAlumnos el cual 
--obtendrá la siguiente consulta, recibiendo como parámetro el id del registro 
--que se requiere consultar de la tabla estatusAlumnos. En caso de que el valor 
--sea -1 (menos uno) deberá regresar todos los registros de dicha tabla.

go
create or alter procedure consultarEstatusAlumnos
@id int
as
select id, nombre
from EstatusAlumnos
where id=@id OR @id<0

exec consultarEstatusAlumnos @id=-1;


------------------------------------------------------------------------------------------------------------

--Realizar el procedimiento almacenado consultarAlumnos el cual obtendrá la 
--siguiente consulta, recibiendo como parámetro el id del registro que se 
--requiere consultar de la tabla Alumnos. En caso de que el valor sea -1 (menos 
--uno) deberá regresar todos los registros de dicha tabla.
GO
CREATE OR ALTER PROC ConsultarAlumnos
(@IDA INT)
AS BEGIN
	IF @IDA = -1
	BEGIN
    SELECT * FROM vAlumnos
	END
	ELSE
	BEGIN
    SELECT * FROM vAlumnos WHERE id = @IDA
	END
END

GO
EXEC ConsultarAlumnos 1

------------------------------------------------------------------------------------------------------------------------------
--Realizar el procedimiento almacenado consultarEAlumnos el cual obtendrá la 
---siguiente consulta, recibiendo como parámetro el id del registro que se 
--requiere consultar de la tabla Alumnos. En caso de que el valor sea -1 (menos 
--uno) deberá regresar todos los registros de dicha tabla.
go
 create or alter procedure consultarEAlumnos
 @id int
 as
 select *
 from Alumnos
 where id=@id OR @id<0

 exec consultarEAlumnos @id = -1;


 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Realizar el procedimiento almacenado actualizarEstatusAlumnos el cual 
--recibirá como parámetros el id del Alumno al cual se le requiere cambiar el 
--estatus y el valor del nuevo estatus.
go
CREATE OR ALTER PROC ActualizarEstatusAlumnos
(
@IDA INT,
@ValorEstatus INT
)
AS
BEGIN
IF @IDA IN (SELECT id FROM Alumnos) AND @ValorEstatus IN (SELECT id FROM EstatusAlumnos) 
BEGIN
UPDATE Alumnos SET idEstatus = @ValorEstatus WHERE id = @IDA
SELECT  *
FROM Alumnos
WHERE id = @IDA
END
ELSE
BEGIN	
PRINT 'Valores invalidos'
END
END
GO


EXEC ActualizarEstatusAlumnos 1, 5-----------------------------------------------------------------------------------------------------------------------------------------------------Realizar el procedimiento almacenado agregarAlumnos el cual recibirá como 
--parámetros los valores de cada una de las columnas de la tabla de Alumnos 
--con los cuales se insertará el registro a la tabla Alumnos. El procedimiento 
--deberá regresar el id con el que se creo el registro en formato de entero.goCREATE or Alter PROCEDURE AgregarAlumnos
@Id int,
@Nombre varchar(60),
@PrimerApellido varchar (60),
@SegundoApellido varchar (60),
@Correo varchar (60),
@Telefono varchar (60),
@FechaNacimiento date, 
@Curp varchar (60),
@Sueldo decimal (9,2),
@IdEstadoOrigen int,
@idEstatus smallint

AS
IF NOT EXISTS (SELECT * FROM Alumnos WHERE id=@Id)
BEGIN
	   SET IDENTITY_INSERT [dbo].[Alumnos] ON 
       INSERT [dbo].[Alumnos] ([id],
	                [nombre],
					primerApellido, 
					segundoApellido, 
					correo, telefono,
					fechaNacimiento, 
					curp, 
					sueldo, 
					idEstadoOrigen, 
					idEstatus) 
       VALUES (@Id,@Nombre,@PrimerApellido,@SegundoApellido,@Correo,@Telefono,@FechaNacimiento,@Curp,@Sueldo,@IdEstadoOrigen,@idEstatus)
	   SET IDENTITY_INSERT [dbo].[Alumnos] OFF 
END
ELSE
BEGIN
       UPDATE Alumnos SET
       nombre = @Nombre,
	   primerApellido = @PrimerApellido,
	   segundoApellido = @SegundoApellido,
	   correo = @Correo,
	   telefono = @Telefono,
	   fechaNacimiento = @FechaNacimiento,
	   curp = @Curp,
	   sueldo= @Sueldo,
	   idEstadoOrigen = @IdEstadoOrigen,
	   idEstatus =@idEstatus
	   
       WHERE id = @Id
END

EXEC AgregarAlumnos @Id=31, 
                    @Nombre='Silverio', 
					@PrimerApellido='Gaitan', 
                    @SegundoApellido='Uribe', 
					@Correo = 'guadalupanomarin@outlok.com',
					@Telefono ='5525380283', 
					@FechaNacimiento = '1950-02-03',
					@Curp ='ASDF500203HDFVRR04',
					@Sueldo ='2000000',
					@IdEstadoOrigen =32,
					@idEstatus =5

go


select * from Alumnos------------------------------------------------------------------------------------------------------------------------------------------------------------------Realizar el procedimiento almacenado actualizarAlumnos el cual recibirá 
--como parámetros los valores de cada una de las columnas de la tabla de --Alumnos con los cuales se actualizarán los valores que existen en la tabla 
--Alumnos del registro que corresponda al id enviado como parámetro. El 
--procedimiento deberá regresar la cantidad de registros actualizados.goCREATE or Alter PROCEDURE ActualizarAlumnos
@Id int,
@Nombre varchar(60),
@PrimerApellido varchar (60),
@SegundoApellido varchar (60),
@Correo varchar (60),
@Telefono varchar (60),
@FechaNacimiento date, 
@Curp varchar (60),
@Sueldo decimal (9,2),
@IdEstadoOrigen int,
@idEstatus smallint

AS
IF NOT EXISTS (SELECT * FROM Alumnos WHERE id=@Id)
BEGIN
	   SET IDENTITY_INSERT [dbo].[Alumnos] ON 
       INSERT [dbo].[Alumnos] ([id],
	                [nombre],
					primerApellido, 
					segundoApellido, 
					correo, telefono, 
					fechaNacimiento,
					curp, 
					sueldo,
					idEstadoOrigen,
					idEstatus) 
       VALUES (@Id,
	           @Nombre,
			   @PrimerApellido,
			   @SegundoApellido,
			   @Correo,
			   @Telefono,
			   @FechaNacimiento,
			   @Curp,
			   @Sueldo,
			   @IdEstadoOrigen,
			   @idEstatus)
	   SET IDENTITY_INSERT [dbo].[Alumnos] OFF 
END
ELSE
BEGIN
       UPDATE Alumnos SET
       nombre = @Nombre,
	   primerApellido = @PrimerApellido,
	   segundoApellido = @SegundoApellido,
	   correo = @Correo,
	   telefono = @Telefono,
	   fechaNacimiento = @FechaNacimiento,
	   curp = @Curp,
	   sueldo= @Sueldo,
	   idEstadoOrigen = @IdEstadoOrigen,
	   idEstatus =@idEstatus
	   
       WHERE id = @Id
END

EXEC ActualizarAlumnos 
                    @Id=30, 
                    @Nombre='Silverio', 
					@PrimerApellido='Gaitan', 
                    @SegundoApellido='Uribe', 
					@Correo = 'guadalupanomarin@outlok.com',
					@Telefono ='5525380283', 
					@FechaNacimiento = '1950-02-03',
					@Curp ='ASDF500203HDFVRR04',
					@Sueldo ='2000000',
					@IdEstadoOrigen =32,
					@idEstatus =5

go


select * from Alumnos


-----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Realizar el procedimiento almacenado eliminarAlumnos el cual recibirá como 
parámetros el valor del id del registro del alumno del que se requiere eliminar.
Primeramente se deberán eliminar todos los registros de la Tabla de 
CursosAlumnos los cuales tengan el id del alumno a eliminar y posteriormente 
el eliminar al alumno de la Tabla de Alumnos.
Esto deberá considerarse como una transacción ya que se trate de actualizar 
dos tablas relacionadas.
En caso de que no se haya eliminado el registro de la tabla de Alumnos 
deberá levantar una excepción.*/


GO
CREATE OR ALTER PROC eliminarAlumno (@IDAlumn INT)
AS
BEGIN
BEGIN TRY
BEGIN TRANSACTION
      IF @IDAlumn IN (SELECT id FROM Alumnos)
BEGIN
	  DELETE CursosAlumnos     WHERE idAlumno = @IDAlumn
	  DELETE Alumnos           WHERE id = @IDAlumn
END
ELSE
BEGIN;
	  THROW 51000, 'Error al realizar la peticion a', 4-- colocamos el id del alumno que queremos eliminar 
END
	  COMMIT TRANSACTION
	  PRINT CONCAT('Eliminaste al : ', @ID)
END TRY
BEGIN CATCH
	  ROLLBACK TRANSACTION
	  PRINT 'SI te aparece esto es por que colocaste un id inexistente y no se realizo tu transaccion';
			
	END CATCH
END

GO
EXEC eliminarAlumno 4 -- aqui colocamos el id a eliminar 
SELECT * FROM Alumnos

--Crear el trigger Trigger_EliminarAlumnos el cual se debe ejecutar cuando se 
--elimina un registro de la tabla de Alumnos. Este trigger deberá insertar un 
--registro en la Tabla AlumnosBaja del alumno eliminado.

GO
CREATE OR ALTER TRIGGER Trigger_EliminarAlumnos
ON Alumnos
AFTER DELETE
AS
SET NOCOUNT ON
BEGIN
	INSERT INTO AlumnosBaja (
	nombre, 
	primerApellido, 
	segundoApellido, 
	fechaBaja)
	SELECT Alumnos.nombre, 
	       Alumnos.primerApellido, 
		   Alumnos.segundoaPellido, 
		   GETDATE()
	FROM alumnos

END

EXEC eliminarAlumno 2

SELECT * FROM Alumnos
select * from AlumnosBaja

--Obtener un respaldo de su base de datos InstitutoTich

GO
BACKUP DATABASE InstitutoTich
TO DISK = 'E:\Backup Tich\InstitutoTich.bak'
WITH FORMAT, COMPRESSION;


--Crear una base de datos PruebasTich con el respaldo de la base de datos 
--InstitutoTich.

GO
CREATE DATABASE PruebasTich_codigo

RESTORE FILELISTONLY
FROM DISK = 'E:\Backup Tich\InstitutoTich.bak'

RESTORE DATABASE PruebasTich_codigo
FROM DISK = 'E:\Backup Tich\InstitutoTich.bak'
WITH REPLACE,
MOVE 'InstitutoTICH' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PruebasTich_codigo.mdf',
MOVE 'InstitutoTICH_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\\PruebasTich_codigo.ldf';
