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
/*Los parámetros de salida permiten al procedimiento almacenado devolver un valor 
de datos a quien realizó la llamada. 
Nota: Las funciones definidas por el usuario 
no pueden especificar parámetros de salida.*/

CREATE or Alter PROCEDURE CalcularOperacion
@Num1 DECIMAL(10,2),
@Num2 DECIMAL(10,2),
@Operador varchar(5) OUT,
@Result DECIMAL(18,2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
	 SET  @Result = (CASE @Operador
	WHEN '+' THEN @Num1+@Num2
	WHEN '-' THEN @Num1-@Num2
	WHEN '*' THEN @Num1*@Num2
	WHEN '/' THEN @Num1/IIF(@Num2<>0,@Num2,1)
	END) 
END

--Invocar procedimiento almacenado 
/*Al ejecutar el procedimiento, creo una variable 
que guarde el contenido del parametro de 
salida, puesto que sino, se pierde (es local al 
procedimiento*/

DECLARE @ResultadoOperacion DECIMAL(18,2);

EXEC CalcularOperacion @Num1=15.3,@Num2=5,@Operador='/',@Result =@ResultadoOperacion OUTPUT;  

SELECT @ResultadoOperacion AS Resultado;

------------------------------------------------------------------
DECLARE @ResultadoOperacion2 DECIMAL(18,2);

EXEC CalcularOperacion 15.3,3,@Operador='+',@Result =@ResultadoOperacion2 OUTPUT;  

SELECT @ResultadoOperacion2 AS Resultado;
---------------------------------------------------------------------------------------
go
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

EXEC agregarEstados @Id=33, @Nombre='Guatemala'

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
 GO
 create or alter procedure consultarEstados
  @id int
 as
      select id, nombre
		from estados
			where id=@id OR @id<0

  exec consultarEstados @id=-2;

--****************************************************************************************
-------------------------------SUBTEMA: Transacciones-----------------------------------
/*--Una transacción es un conjunto de operaciones Transact SQL que se ejecutan como un único bloque, 
es decir, si falla una operación Transact SQL fallan todas.

--Si una transacción tiene éxito, todas las modificaciones de los datos realizadas durante 
la transacción se confirman y se convierten en una parte permanente de la base de datos. */

/*La instrucción Throw se usa para provocar una excepción 
y transferir la ejecución a un bloque CATCH en SQL Server.*/
 
 THROW 51000,'Error al realizar la transferencia', 1;

/*Los siguientes son los argumentos/parámetros:

  Número de error: el número de error puede ser una constante o variable y representa la excepción. 
  Es un INT y debe ser mayor o igual a 50000 y menor o igual al valor máximo de INT 
  (en otras palabras, 2147483647).

  Mensaje: este es un valor de cadena que representa la descripción de la excepción. 
  El tipo de datos del argumento message es NVARCHAR (2048).

  Estado: es un valor constante o variable que debe estar entre 0 y 255, 
  que representa el estado a asociar con el mensaje. El tipo de datos de sate es TINYINT.

  ---------Punto a considerar al usar la expresión "THROW":-------------------

   *La instrucción antes de la instrucción THROW debe ir seguida del terminador de la sentencia, es decir, punto y coma (;).
   *Si la instrucción THROW se utiliza sin ningún argumento, debe estar dentro de un bloque CATCH.
   *Si un TRY ... El bloque CATCH no está disponible, entonces la sesión ha finalizado.*/
-------------------------------------------SINTAXIS------------------------------------- 
CREATE PROCEDURE TransaccionMonetaria
    @CuentaOrigen INT,
    @CuentaDestino INT,
    @Cantidad DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verificar saldo suficiente en la cuenta origen
        DECLARE @SaldoOrigen DECIMAL(18, 2);
        SELECT @SaldoOrigen = Saldo FROM Cuentas WHERE ID = @CuentaOrigen;

        IF @SaldoOrigen >= @Cantidad
        BEGIN
            -- Restar la cantidad de la cuenta origen
            UPDATE Cuentas SET Saldo = Saldo - @Cantidad WHERE ID = @CuentaOrigen;

            -- Sumar la cantidad a la cuenta destino
            UPDATE Cuentas SET Saldo = Saldo + @Cantidad WHERE ID = @CuentaDestino;
            COMMIT;
            PRINT 'Transacción completada exitosamente.';
        END
        ELSE
        BEGIN
            ROLLBACK;
            PRINT 'Saldo insuficiente en la cuenta origen.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error en la transacción. Se ha realizado un rollback.';
		THROW 51000,'Error al realizar la transferencia', 1;
    END CATCH;
END;

----------------------------------------------------------------------------------------------



