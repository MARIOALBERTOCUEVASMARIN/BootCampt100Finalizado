--********************************************************************************************
-----------------------------------SUBTEMA: PROCEDIMIENTOS ALMACENADOS------------------------------------------
--El procedimiento almacenado (stored procedure) es un conjunto de comando SQL que pueden almacenarse en el servidor 
--el cual ejecuta una acción o un conjunto de acciones.

------------------------------------------CARACTERÍSTICAS DE LOS PROCEDIMIENTOS----------------------------------------------
--En los procedimientos almacenados pueden contener instrucciones SELECT, INSERT, UPDATE, DELETE.

--------------------------------------------------SINTAXIS--------------------------------------------------------------
--Crear:
     /* CREATE PROCEDURE <nombre>
		(
		<Parametro><TipodeDato>,…n
		) 
		AS
		<Instruccion, operacion, etc.> */

--Modificar:
	 /*ALTER PROCEDURE <nombre>
	   (
	    <Parametro><TipodeDato>,…n
	   ) 
       AS
        <Instruccion, operacion, etc.> */

--Borrar:
	 /*DROP PROCEDURE <nombre>*/
---------------------------------------------------------------------------------------------------------------------
CREATE or Alter PROCEDURE agregarEstados
@Id int,
@Nombre varchar(60)
AS
IF NOT EXISTS (SELECT * FROM Estados WHERE id=@Id)
BEGIN
	   SET IDENTITY_INSERT [dbo].[Estados] ON 
       INSERT [dbo].[Estados] ([id],[nombre])
       VALUES (@Id,@Nombre)
	   SET IDENTITY_INSERT [dbo].[Estados] OFF 
END
ELSE
BEGIN
       UPDATE Estados SET
       nombre = @Nombre
       WHERE id = @Id
END

EXEC agregarEstados @Id=32, @Nombre='Ciudad De Mexico'

select * from Estados
/*SCOPE_IDENTITY(): devuelve el último ID creado en la misma conexión y el mismo contexto 
(de ahí su nombre). En este caso el contexto se refiere a la consulta o procedimiento almacenado actual.*/
go
Create or alter procedure agregarEstadosScope 
  @Nombre varchar(60)
AS
BEGIN
DECLARE @id INT
INSERT INTO Estados  ([nombre])
    VALUES ( @Nombre)
SET @id = SCOPE_IDENTITY()
 select @id
END
Execute agregarEstadosScope 'florida'
----------------------------------------------------------------------------------------------
 go
 create or alter procedure consultarEstados
  @id int
 as
      select id, nombre
		from estados
			where id=@id OR @id<0

  exec consultarEstados @id=-1;


--********************************************************************************************
-----------------------------------SUBTEMA: VISTA (VIEW)------------------------------------------
--Una vista es una tabla virtual, lo podemos utilizar como una tabla normal dentro de las consultas 
--en SQL Server, una vista no almacena los datos por tal motivo no ocupa espacio en disco para los 
--datos. Una vista almacena la consulta correspondiente a la extracción de datos.

----------------------------------CARACTERÍSTICAS DE LA VISTA--------------------------------------
-------------------------------------------Ventajas------------------------------------------------
--Simplifica las sentencias complejas.
--Seguridad de los datos no se puede insertar filas en las vistas.
--Personalización.
--Unión de 2 o más tablas.

------------------------------------------Desventajas-----------------------------------------------
  --Dependencia total de la tabla, si la tabla sufre cambios, la vista deja de funcionar.
/*--No se pueden anidar vistas, al hacer esto el rendimiento afecta y a lenta los resultados. 
	Todas las vistas deben ser creadas sobre tablas.*/

--------------------------------------------------SINTAXIS-------------------------------------------------------------------
--Crear:
     /* CREATE VIEW <Nombre>
		AS
		<Select de la tabla o tablas> */
--Modificar:
	 /*	ALTER VIEW <Nombre>
		AS
		<Select de la tabla o tablas> */
--Borrar:
	 /* DROP VIEW <Nombre> */
--------------------------------------------------EJEMPLOS--------------------------------------------------------------------
CREATE OR ALTER VIEW V_Alumnos
AS
SELECT Alu.nombre AS Nombre,
       CurAlu.calificacion AS Calificacion
FROM Alumnos Alu LEFT JOIN 
	 CursosAlumnos CurAlu ON Alu.id = CurAlu.idAlumno
--Ejecutar una vista:
SELECT *
FROM V_Alumnos
WHERE Nombre LIKE '%Luis%'

/*Nota: Las vistas son tratadas igual que las tablas para ejecutarlas, incluso podemos seleccionar solo algunas de las columnas 
que la vista contenga, ademas de agregar filtros en la vista.*/

-------------------------------SUBTEMA: Triggers o Disparadores-----------------------------------
/*Un trigger(o desencadenador) es una clase especial de procedimiento almacenado que se ejecuta
automáticamente cuando se produce un evento en el servidor de bases de datos.
Los triggers o disparadores son objetos de la base de datos que ejecutan acciones cuando 
se producen ciertos eventos (tanto DML como DDL) (inserciones, modificaciones, borrados, 
creación de tablas, etc.).*/
-------------------------------------------SINTAXIS------------------------------------- 
/*CREATE TRIGGER trigger_name
ON table_name
AFTER  {[INSERT],[UPDATE],[DELETE]}
[NOT FOR REPLICATION]
AS
{sql_statements}*/

--trigger_name: Es el nombre definido por el usuario para el nuevo desencadenador. 
--table_name: Es la tabla a la que se aplica el desencadenador.
/*AFTER|INSERT|UPDATE|DELETE: Un solo disparador puede dispararse en respuesta a una o
--más acciones contra la tabla.*/
/*NOT FOR REPLICATION: La opción indica a SQL Server que no active el desencadenador cuando
  se realice la modificación de datos como parte de un proceso de replicación.*/
/*sql_statements: Es uno o más Transact-SQL utilizados para llevar a cabo acciones una vez 
que se produce un evento.*/
--------------------------------------------------------------------------------------------
-----------------------------Tablas "virtuales" para desencadenadores:----------------------
/*INSERTED | DELETED:SQL Server proporciona dos tablas virtuales que están disponibles 
específicamente para desencadenadores llamados y tablas. SQL Server utiliza estas 
tablas para capturar los datos de la fila modificada antes y después de que se produzca 
el evento.*/

/*Evento DML
	INSERT   
		Retenciones de tabla INSERTED: filas que se van a insertar
		Retenciones de tabla DELETED: vacío

	UPDATE
		Retenciones de tabla INSERTED: nuevas filas modificadas por la actualización
		Retenciones de tabla DELETED: filas existentes modificadas por la actualización

	DELETE
		Retenciones de tabla INSERTED: vacío
		Retenciones de tabla DELETED: filas que se van a eliminar*/

	Alter TRIGGER Trigger_EliminarAlumnos
	ON alumnos
	AFTER DELETE
	AS
	SET NOCOUNT ON --impide que se muestre en los mensajes la fila afectada 
	BEGIN
		INSERT INTO AlumnosBaja (nombre,
								 primerApellido,
								 segundoApellido
								 )
		SELECT d.nombre,
			   d.primerApellido,
			   d.segundoApellido

		FROM deleted d;
	END
	GO


SELECT * FROM Alumnos
DELETE FROM alumnos WHERE id =9;

truncate table alumnosBaja
select * from alumnosBaja
--****************************************************************************************
-------------------------------SUBTEMA: Transacciones-----------------------------------
/*--Una transacción es un conjunto de operaciones Transact SQL que se ejecutan como un único bloque, 
es decir, si falla una operación Transact SQL fallan todas.

--Si una transacción tiene éxito, todas las modificaciones de los datos realizadas durante 
la transacción se confirman y se convierten en una parte permanente de la base de datos. */

-------------------------------------------SINTAXIS------------------------------------- 
CREATE PROCEDURE TransaccionEfectivo
@IdCuentaOrigen int,
@IdCuentaDestino int,
@MontoTransacción decimal
AS
BEGIN
DECLARE @saldoActual decimal
	BEGIN TRY
	BEGIN TRANSACTION
	    SET @saldoActual=(SELECT saldo FROM Saldos WHERE id=@IdCuentaOrigen)
		UPDATE Saldos
		SET  saldo = IIF(@MontoTransacción<=@saldoActual,@saldoActual-@MontoTransacción,0)
		WHERE id=@IdCuentaOrigen
		UPDATE Saldos
		SET saldo = (SELECT saldo FROM Saldos WHERE id=@IdCuentaDestino)+@MontoTransacción
		WHERE id=@IdCuentaDestino
		INSERT Transacciones(idOrigen,idDestino,monto)
		VALUES(@IdCuentaOrigen,@IdCuentaDestino,@MontoTransacción)
	
	PRINT 'Transacción exitosa'
	COMMIT TRANSACTION
 END TRY
 BEGIN CATCH
	ROLLBACK TRANSACTION
    print 'Existio un error';
	THROW 51000,'Error al realizar la transferencia', 1;
 END CATCH
END
GO