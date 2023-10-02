
--Crear un store procedureCodigoAscii que imprima los caracteres con su respectivo 
--código ascii en decimal. Solo para los caracteres cuyo código sea mayor a 32

GO
CREATE OR ALTER PROC CodigoAcii 
AS
BEGIN
DECLARE @Caracter INT= 33
WHILE @Caracter <= 300
BEGIN
	PRINT CONCAT(CHAR(@Caracter), ' ASCII=> ', @Caracter)
	SET @Caracter = @Caracter + 1
	END
END

GO
EXEC CodigoAcii


--Crear el store procedure Factorial que reciba como parámetro un número entero y 
--que devuelve el factorial calculado en un parámetro de salida
-- Crear el procedimiento almacenado

go
CREATE PROCEDURE calcularFactorial
@numeroEntero INT,
@factorial INT OUTPUT
AS
BEGIN

IF @numeroEntero < 0       -- Verificar si el número es negativo y manejarlo en consecuencia
BEGIN
SET @factorial = NULL; -- Puedes manejar este caso como desees
RETURN;
END
SET @factorial = 1; -- Iniciar el resultado del factorial

DECLARE @contador INT = 1; 
WHILE @contador <= @numeroEntero
BEGIN
SET @factorial = @factorial * @contador;
SET @contador = @contador + 1;
END
END

DECLARE @resultado INT;
EXEC calcularFactorial @numeroEntero = 10, @factorial = @resultado OUTPUT;
SELECT @resultado;

--Crear las siguientes Tablas

CREATE TABLE Saldos 
(
id INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(30) NOT NULL, 
saldo DECIMAL(10, 2) NOT NULL
)

CREATE TABLE Transacciones
(
id INT PRIMARY KEY IDENTITY(1,1),
idOrigen INT NOT NULL,
idDestino INT NOT NULL, 
monto DECIMAL(9,2) NOT NULL

CONSTRAINT fk_idOrigen FOREIGN KEY (idOrigen) REFERENCES dbo.saldos (id),
CONSTRAINT fk_idDestino FOREIGN KEY (idDestino) REFERENCES dbo.saldos (id)
)
DROP TABLE Transacciones

--Crear un store procedure “Transacciones” que recibirá como parámetros el id de la 
--cuenta de origen, el id de la cuenta destino y el monto de la transacción. Se 
--deberá crear dentro de una transacción a fin de que los saldos de las cuentas 
--involucradas y la tabla de transacciones quede perfectamente consistente.
-- Crear el procedimiento almacenado Transacciones

-- Insertar datos en la tabla Saldos
INSERT INTO Saldos (nombre, saldo) VALUES ('Cuenta Origen', 1000.00);
INSERT INTO Saldos (nombre, saldo) VALUES ('Cuenta Destino', 500.00);

-- Verificar los IDs de las cuentas que has insertado
SELECT * FROM Transacciones;
select * from saldos

CREATE PROCEDURE Transacciones1
    @IdOrigen INT,
    @IdDestino INT,
    @Monto DECIMAL(9, 2)
AS
BEGIN
    BEGIN TRANSACTION;
    DECLARE @SaldoOrigen DECIMAL(10, 2);
    DECLARE @SaldoDestino DECIMAL(10, 2);

SELECT @SaldoOrigen = saldo FROM saldos WHERE id = @IdOrigen;
SELECT @SaldoDestino = saldo FROM saldos WHERE id = @IdDestino;

IF @SaldoOrigen >= @Monto
BEGIN
      UPDATE saldos SET saldo = @SaldoOrigen - @Monto WHERE id = @IdOrigen;
      UPDATE saldos SET saldo = @SaldoDestino + @Monto WHERE id = @IdDestino;

INSERT INTO Transacciones (idOrigen, idDestino, monto)
VALUES (@IdOrigen, @IdDestino, @Monto);
COMMIT;
 END
 ELSE
 BEGIN
 ROLLBACK;
END
END


-- Declarar e inicializar las variables
DECLARE @IdOrigen INT;
DECLARE @IdDestino INT;
DECLARE @Monto DECIMAL(9, 2);

-- Asignar valores a las variables
SET @IdOrigen = 1; 
SET @IdDestino = 2; 
SET @Monto = 200.00; 

-- Ejecutar el procedimiento almacenado Transacciones1
EXEC Transacciones1 @IdOrigen, @IdDestino, @Monto;
