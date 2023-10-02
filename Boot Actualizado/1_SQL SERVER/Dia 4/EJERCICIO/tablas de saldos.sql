--Hacer una función valuada en tabla que obtenga la tabla de amortización de los 
--Reembolsos quincenales que un participante tiene que realizar en 6 meses

GO

CREATE OR ALTER FUNCTION dbo.AmortizacionAlumnos12 (@IDA INT)
RETURNS @Amortizacion TABLE
(
Quincena TINYINT IDENTITY (1,1),
SaldoAnterior DECIMAL(10,2),
Pago DECIMAL(10,2),
SaldoNuevo DECIMAL(10,2)
)
AS
BEGIN
DECLARE @Sueldo DECIMAL(10,2)= (SELECT sueldo FROM Alumnos WHERE id = @IDA) 
DECLARE @SaldoAnterior DECIMAL (10,2) = (SELECT (sueldo * 2.5) 
  FROM Alumnos 
  WHERE id = @IDA)
DECLARE @Pago DECIMAL(10,2)= dbo.RembolsoMensual (@Sueldo)
DECLARE @Quincena INT = 12
WHILE @Quincena >= 1 
BEGIN
	INSERT INTO @Amortizacion 
    SELECT @SaldoAnterior, @Pago, (@SaldoAnterior - @Pago)
	FROM Alumnos 
		WHERE id = @IDA
	SET @SaldoAnterior = @SaldoAnterior - @Pago
	SET @Quincena = @Quincena - 1
	END
RETURN
END

GO
SELECT * FROM dbo.AmortizacionAlumnos12(12)




--Hacer una función valuada en tabla que obtenga la tabla de amortización de los 
--préstamos posibles que se le pueden hacer a un instructor. 
--La función recibirá como parámetro el id del instructor 
--El importe del préstamo será 200 veces la cuota por hora
--El porcentaje de interés será el 24% anual cuando la cuota por hora sea superior a 
--200
--Para el resto será de 18%
--El pago mensual será el equivalente a 25 horas


GO
CREATE OR ALTER FUNCTION dbo.AmortizacionPrestamoInsctructor(@IDI INT)
RETURNS @Amortizacion TABLE (
    Mes TINYINT IDENTITY(1, 1),
    [Sueldo Anterior] DECIMAL(10, 2),
    Intereses DECIMAL(10, 2),
    Pago DECIMAL(10, 2),
    [Sueldo Nuevo] DECIMAL(10, 2)
)
AS
BEGIN
    DECLARE @CuotaHora DECIMAL(10, 2) = (SELECT cuotaHora FROM Instructores WHERE id = @IDI);
    DECLARE @InteresAnual DECIMAL(9, 2) = CASE WHEN @CuotaHora > 200 THEN 24 ELSE 18 END;
    DECLARE @Importe DECIMAL(10, 2) = @CuotaHora * 200;
    DECLARE @InteresMes DECIMAL(10, 2) = @InteresAnual / 12;
    DECLARE @Mes TINYINT = 1;

    INSERT INTO @Amortizacion ([Sueldo Anterior], Intereses, Pago, [Sueldo Nuevo])
    SELECT @Importe, 0, 0, @Importe;

    WHILE @Mes <= 12
    BEGIN
        DECLARE @InteresTotal DECIMAL(10, 2) = @Importe * @InteresMes / 100;
        SET @Importe = @Importe - @CuotaHora * 25;

        IF @Importe <= 0
        BEGIN
            SET @Importe = 0;
        END

        INSERT INTO @Amortizacion ([Sueldo Anterior], Intereses, Pago, [Sueldo Nuevo])
        SELECT @Importe + @CuotaHora * 25, @InteresTotal, @CuotaHora * 25, @Importe;

        SET @Mes = @Mes + 1;
    END

    RETURN;
END
GO

SELECT * FROM dbo.AmortizacionPrestamoInsctructor(2);
SELECT cuotaHora FROM Instructores WHERE id = 2;