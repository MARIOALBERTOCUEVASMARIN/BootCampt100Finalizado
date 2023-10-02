practica 1 

 --Crear una función Suma que reciba dos números enteros y regrese la suma de 
-- ambos números
go
Create or Alter FUNCTION Suma
(
@Num1 int,
@Num2 int
)
RETURNS int
AS
BEGIN
 RETURN @Num1 + @Num2;
END
go
--Ejecutar
select dbo.Suma(10,5)



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Crear la función GetGenero la cual reciba como parámetros el curp y regrese el género al que pertenece


go
Create or Alter FUNCTION GetGenero
(
@Curp varchar (18)
)
RETURNS varchar (20)
AS
BEGIN
 RETURN Iif (SUBSTRING(@curp, 11, 1) = 'H', 'Hombre', 'Mujer')
END
go
--Ejecutar
SELECT dbo.GetGenero('CUMM990419HDFVRR04')

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Crear la función GetFechaNacimiento la cual reciba como parámetros el curp y 
--regrese la fecha de nacimiento. La fecha de nacimiento deberá completarse a 4 
--dígitos, debiéndose determinar si es año dos mil o año mil novecientos
go
Create or Alter FUNCTION GetFechadeNacimiento
(
@Curp varchar (18)
)
RETURNS date
AS
BEGIN
 RETURN convert(Date ,SUBSTRING(@curp, 5, 6))
END
go
--Ejecutar
SELECT dbo.GetFechadeNacimiento('CUMM990419HDFVRR04')


----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Crear la función GetidEstado la cual reciba como parámetros el curp y regrese el 
--Id Estado con base en la siguiente tabla
GO
CREATE OR ALTER FUNCTION GetIdEstado (@curp VARCHAR(18))
RETURNS INT
BEGIN
RETURN (
		SELECT id 
		FROM Estados 
		WHERE CURP_prefixClave LIKE SUBSTRING(@curp, 12, 2)
		)
END

GO
PRINT dbo.GetIdEstado ('CUMM990419HDFVRR04')

ALTER TABLE Estados
ADD CURP_prefixClave CHAR(2);

 

select * from Estados

UPDATE Estados
SET CURP_prefixClave = 'AS' -- Aguascalientes
WHERE id = 1;

UPDATE Estados
SET CURP_prefixClave = 'BC' -- Baja California
WHERE id = 2;

UPDATE Estados
SET CURP_prefixClave = 'BS' -- Baja California Sur
WHERE id = 3;

UPDATE Estados
SET CURP_prefixClave = 'CC' -- Campeche
WHERE id = 4;

UPDATE Estados
SET CURP_prefixClave = 'CS' -- Chiapas
WHERE id = 5;

UPDATE Estados
SET CURP_prefixClave = 'CH' -- Chihuahua
WHERE id = 6;

UPDATE Estados
SET CURP_prefixClave = 'CL' -- Coahuila
WHERE id = 7;

UPDATE Estados
SET CURP_prefixClave = 'CM' -- Colima
WHERE id = 8;

UPDATE Estados
SET CURP_prefixClave = 'DG' -- Durango
WHERE id = 9;

UPDATE Estados
SET CURP_prefixClave = 'GT' -- Guanajuato
WHERE id = 10;

UPDATE Estados
SET CURP_prefixClave = 'GR' -- Guerrero
WHERE id = 11;

UPDATE Estados
SET CURP_prefixClave = 'HG' -- Hidalgo
WHERE id = 12;

UPDATE Estados
SET CURP_prefixClave = 'JC' -- Jalisco
WHERE id = 13;

UPDATE Estados
SET CURP_prefixClave = 'MC' -- Estado de México
WHERE id = 14;

UPDATE Estados
SET CURP_prefixClave = 'MN' -- Michoacán
WHERE id = 15;

UPDATE Estados
SET CURP_prefixClave = 'MS' -- Morelos
WHERE id = 16;

UPDATE Estados
SET CURP_prefixClave = 'NT' -- Nayarit
WHERE id = 17;

UPDATE Estados
SET CURP_prefixClave = 'NL' -- Nuevo León
WHERE id = 18;

UPDATE Estados
SET CURP_prefixClave = 'OC' -- Oaxaca
WHERE id = 19;

UPDATE Estados
SET CURP_prefixClave = 'PL' -- Puebla
WHERE id = 20;

UPDATE Estados
SET CURP_prefixClave = 'QT' -- Querétaro
WHERE id = 21;

UPDATE Estados
SET CURP_prefixClave = 'QR' -- Quintana Roo
WHERE id = 22;

UPDATE Estados
SET CURP_prefixClave = 'SP' -- San Luis Potosí
WHERE id = 23;

UPDATE Estados
SET CURP_prefixClave = 'SL' -- Sinaloa
WHERE id = 24;

UPDATE Estados
SET CURP_prefixClave = 'SR' -- Sonora
WHERE id = 25;

UPDATE Estados
SET CURP_prefixClave = 'TC' -- Tabasco
WHERE id = 26;

UPDATE Estados
SET CURP_prefixClave = 'TS' -- Tamaulipas
WHERE id = 27;

UPDATE Estados
SET CURP_prefixClave = 'TL' -- Tlaxcala
WHERE id = 28;

UPDATE Estados
SET CURP_prefixClave = 'VZ' -- Veracruz
WHERE id = 29;

UPDATE Estados
SET CURP_prefixClave = 'YN' -- Yucatán
WHERE id = 30;

UPDATE Estados
SET CURP_prefixClave = 'ZS' -- Zacatecas
WHERE id = 31;

INSERT INTO Estados (id, nombre, CURP_prefixClave)
VALUES (32, 'Ciudad de México', 'DF');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Realizar una función llamada Calculadora que reciba como parámetros dos 
--enteros y un operador (+,-,*,/,%) regresando el resultado de la operación se 
--deberá cuidar de no hacer división entre cero

go
Create or Alter FUNCTION Calculadora
(
@Num1 int,
@Num2 int,
@Operador char 
)
RETURNS int
AS
BEGIN 
RETURN 
         CASE
 
	WHEN @operador = '+' then @num1 + @num2 
	WHEN @operador = '-' then @num1 - @num2 
	WHEN @operador = '*' then @num1 * @num2 
	WHEN @operador = '/' then 
	     
		 case when @num2 = 0 then null
		 else @num1 / @num2
		 end
	     else 0
	     END 
         end
         go


--Ejecutar
select dbo.Calculadora(10,5,'*') as [El Resultado Es]

------------------------------------------------------------------------------------------------------------------------------------------------------
--Realizar una función llamada GetHonorarios que calcule el importe a pagar a un 
--determinado instructor y curso, por lo que la función recibirá como parámetro el id 
--del instructor y el id del curso.

--   instructor y del curso parámetros
GO
CREATE OR ALTER FUNCTION dbo.GetHonorarios (@IDINSTR INT, @IDCUR INT)
RETURNS FLOAT
AS
BEGIN
	DECLARE @CuotaInscructor INT = 
	(SELECT cuotaHora FROM Instructores WHERE id = @IDINSTR)
	DECLARE @HorasCurso INT = 
	(SELECT CatC.horas 
	FROM CatCursos CatC INNER JOIN Cursos Cur ON Cur.idCatCurso = CatC.id 
	                    INNER JOIN CursosInstructores CurIn ON CurIn.idCurso = Cur.id
  WHERE CurIn.idCurso = @IDCUR AND CurIn.idInstructor = @IDINSTR)
RETURN (@CuotaInscructor * @HorasCurso)
END

GO
SELECT dbo.GetHonorarios (1, 2) AS [El pago del instructor es:]


select * from instructores
select * from CursosInstructores
select * from Cursos
select * from CatCursos



--Crear la función GetEdad la cual reciba como parámetros la fecha de nacimiento y 
--la fecha a la que se requiere realizar el cálculo de la edad. Los años deberán se 
--cumplidos, considerando mes y día

GO
CREATE OR ALTER FUNCTION dbo.GetEdad (@FechaN DATE, @FechaCal DATE)
RETURNS INT
AS
BEGIN
RETURN (DATEDIFF(MONTH, @FechaN, @FechaCal) / 12) 
END
--Dividir el resultado entre 12 convierte los meses en años.
GO
select dbo.GetEdad ('1999-04-19', GETDATE()) as [Tu edad actual es:]

select fechaNacimiento
from Alumnos


--Crear la función Factorial la cual reciba como parámetros un número entero y 
--regrese como resultado el factorial.








--Crear la función ReembolsoQuincenal la cual reciba como parámetros un 
--SueldoMensual y regrese como resultado el Importe de Reembolso quincenal, 
--considerando que el importe total a reembolsar es igual a dos meses y medio de 
--sueldo, y el periodo de reembolso es de 6 meses

GO
CREATE OR ALTER FUNCTION dbo.RembolsoQuincenal 
(
@RembolsoMensual DECIMAL(10, 2)
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
	DECLARE @Rembolso DECIMAL(10, 2) = (@RembolsoMensual * 2.5)
	RETURN @Rembolso / 24
END

GO
PRINT dbo.RembolsoQuincenal (20000)


--Realizar una función que calcule el impuesto que debe pagar un instructor para un 
--determinado curso. De tal manera que la función recibirá id de un instructor y el id 
--del curso correspondiente.
--El cálculo del impuesto se realiza de la siguiente forma: 
--Determinar el porcentaje que aplicará dependiendo del estado de nacimiento
--Chiapas = 5 %
--Sonora = 10 %
--Veracruz = 7 %
--El resto del país 8 %goCREATE OR ALTER FUNCTION dbo.CalcularImpuesto
(
@IDINSTR INT,
@IDCUR INT
)
RETURNS DECIMAL(10, 2)
AS BEGIN
    DECLARE @EstadoNacimiento CHAR(2)
    DECLARE @PorcentajeImpuesto DECIMAL(10, 2)
    DECLARE @CostoCurso DECIMAL(10, 2)
    DECLARE @HorasCurso INT
    DECLARE @Impuesto DECIMAL(10, 2)
    
    
    SELECT @EstadoNacimiento = SUBSTRING(I.CURP, 9, 2)
    FROM Instructores I
    WHERE I.id = @IDINSTR
    
    -- Determinar el porcentaje de impuesto según el estado de nacimiento
    SET @PorcentajeImpuesto = 
        CASE 
            WHEN @EstadoNacimiento = 'CH' THEN 0.05 -- Chiapas
            WHEN @EstadoNacimiento = 'SR' THEN 0.10 -- Sonora
            WHEN @EstadoNacimiento = 'VZ' THEN 0.07 -- Veracruz
            ELSE 0.08 
        END
    SELECT @CostoCurso = C.idCatCurso -- costo del curso por horas
    FROM Cursos C
    WHERE C.id = @IDCUR
    
    SELECT @HorasCurso = DATEDIFF(HOUR, C.FechaInicio, C.fechaTermino) -- Obtener la duración del curso en horas
    FROM Cursos C
    WHERE C.id = @IDCUR
    SET @CostoCurso = @CostoCurso * @HorasCurso -- Calcular el costo total del curso
    SET @Impuesto = @CostoCurso * @PorcentajeImpuesto -- Calcular el impuesto c/%
    
    RETURN @Impuesto
END
go


DECLARE @Impuesto DECIMAL(10, 2)
SET @Impuesto = dbo.CalcularImpuesto(1, 3) 
SELECT 'El impuesto a pagar es: $' + CAST(@Impuesto AS VARCHAR(20))

select * from instructores
select * from Cursos
select * from CatCursos
select * from instructores



--Haciendo uso de la función GetEdad, obtener una relación de alumnos con la edad 
--a la fecha de inscripción, y la edad actual. De aquellos alumnos que actualmente 
--tengan más de 25 años.

GO

SELECT CONCAT(Alu.nombre, ' ', Alu.primerApellido, ' ', Alu.segundoaPellido ),
dbo.GetEdad
(
Alu.fechaNacimiento, GETDATE()
) AS EdadActual, 

dbo.GetEdad(
Alu.fechaNacimiento, 
(

SELECT fechaInscripcion FROM CursosAlumnos WHERE CursosAlumnos.id = Alu.id)
) AS EdadFechaIncripcion

FROM Alumnos Alu
WHERE dbo.GetEdad(Alu.fechaNacimiento, GETDATE()) > 25
ORDER BY dbo.GetEdad(Alu.fechaNacimiento, GETDATE())

/*12. Realizar una función que determine el porcentaje a descontar en los reembolsos, 
con base a la cantidad de meses en que se realizará el reembolso y el sueldo 
mensual logrado, de acuerdo al siguiente procedimiento:
a. El porcentaje de descuento será en función de la cantidad de 
mensualidades en que se realizará el reembolso.
b. La cantidad máximo de meses para realizar el reembolso es de 6 meses
c. El porcentaje máximo de descuento a otorgar será el que resulte el sueldo 
mensual entre 1,000
i. Ejemplo : Si el sueldo mensual es de 20,000 pesos el descuento 
será del 20 %
d. El porcentaje máximo de descuento será otorgado si el reembolso total se 
realiza cuando le corresponde efectuar la primera parcialidad de dicho 
reembolso
e. Los porcentaje de descuento a otorgar disminuirá inversamente 
proporcional a la cantidad de meses en que se cubrirá totalmente el 
reembolso, de tal forma que si el reembolso se cubre en la mitad del 
periodo máximo (3 meses = 6 meses /2), el porcentaje a descontar será la 
mitad del porcentaje máximo ( en el ejemplo 10% = 20% / 2), y si el 
reembolso se realiza en el máximo del plazo, el descuento a otorgar será 
cero.*/

CREATE OR ALTER FUNCTION dbo.DescuentoCurso
(
@Meses int ,
@SueldoMensual decimal (10,2)
)
RETURNS INT
AS
BEGIN DECLARE @Porcentaje int = (@SueldoMensual/1000)
  RETURN 
  CASE 
      WHEN @Meses = 1 then (@porcentaje)
	  WHEN @Meses = 2 then (@porcentaje * 0.75)
	  WHEN @Meses = 3 then (@porcentaje * 0.50)
	  WHEN @Meses = 4 then (@porcentaje * 0.25)
	  ELSE 0
	  END
END

select dbo.DescuentoCurso (1, 20000)


--Hacer una función que convierta a mayúsculas la primera letra de cada palabra de 
--un cadena de caracteres recibida


CREATE or ALTER FUNCTION dbo.ConvertirPrimeraLetraMayuscula
(
@cadena VARCHAR(MAX)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @resultado VARCHAR(MAX) = '';
    DECLARE @palabras TABLE (word VARCHAR(MAX));

    -- Dividir la cadena en palabras y almacenarlas en una tabla temporal
    INSERT INTO @palabras
    SELECT value
    FROM STRING_SPLIT(@cadena, ' ');

    -- Iterar sobre las palabras y convertir la primera letra a mayúscula
    SELECT @resultado = @resultado + ' ' + UPPER(LEFT(word, 1)) + LOWER(SUBSTRING(word, 2, LEN(word)))
    FROM @palabras;

    -- Eliminar el espacio inicial
    SET @resultado = LTRIM(@resultado);

    RETURN @resultado;
END;

SELECT dbo.ConvertirPrimeraLetraMayuscula ('XAVI EL MEJOR PROFE') AS [¿quien es el mejor profe de tich?]


