practica 1 

 --Crear una funci�n Suma que reciba dos n�meros enteros y regrese la suma de 
-- ambos n�meros
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
--Crear la funci�n GetGenero la cual reciba como par�metros el curp y regrese el g�nero al que pertenece


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

--Crear la funci�n GetFechaNacimiento la cual reciba como par�metros el curp y 
--regrese la fecha de nacimiento. La fecha de nacimiento deber� completarse a 4 
--d�gitos, debi�ndose determinar si es a�o dos mil o a�o mil novecientos
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

--Crear la funci�n GetidEstado la cual reciba como par�metros el curp y regrese el 
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
SET CURP_prefixClave = 'MC' -- Estado de M�xico
WHERE id = 14;

UPDATE Estados
SET CURP_prefixClave = 'MN' -- Michoac�n
WHERE id = 15;

UPDATE Estados
SET CURP_prefixClave = 'MS' -- Morelos
WHERE id = 16;

UPDATE Estados
SET CURP_prefixClave = 'NT' -- Nayarit
WHERE id = 17;

UPDATE Estados
SET CURP_prefixClave = 'NL' -- Nuevo Le�n
WHERE id = 18;

UPDATE Estados
SET CURP_prefixClave = 'OC' -- Oaxaca
WHERE id = 19;

UPDATE Estados
SET CURP_prefixClave = 'PL' -- Puebla
WHERE id = 20;

UPDATE Estados
SET CURP_prefixClave = 'QT' -- Quer�taro
WHERE id = 21;

UPDATE Estados
SET CURP_prefixClave = 'QR' -- Quintana Roo
WHERE id = 22;

UPDATE Estados
SET CURP_prefixClave = 'SP' -- San Luis Potos�
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
SET CURP_prefixClave = 'YN' -- Yucat�n
WHERE id = 30;

UPDATE Estados
SET CURP_prefixClave = 'ZS' -- Zacatecas
WHERE id = 31;

INSERT INTO Estados (id, nombre, CURP_prefixClave)
VALUES (32, 'Ciudad de M�xico', 'DF');

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Realizar una funci�n llamada Calculadora que reciba como par�metros dos 
--enteros y un operador (+,-,*,/,%) regresando el resultado de la operaci�n se 
--deber� cuidar de no hacer divisi�n entre cero

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
--Realizar una funci�n llamada GetHonorarios que calcule el importe a pagar a un 
--determinado instructor y curso, por lo que la funci�n recibir� como par�metro el id 
--del instructor y el id del curso.

--   instructor y del curso par�metros
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



--Crear la funci�n GetEdad la cual reciba como par�metros la fecha de nacimiento y 
--la fecha a la que se requiere realizar el c�lculo de la edad. Los a�os deber�n se 
--cumplidos, considerando mes y d�a

GO
CREATE OR ALTER FUNCTION dbo.GetEdad (@FechaN DATE, @FechaCal DATE)
RETURNS INT
AS
BEGIN
RETURN (DATEDIFF(MONTH, @FechaN, @FechaCal) / 12) 
END
--Dividir el resultado entre 12 convierte los meses en a�os.
GO
select dbo.GetEdad ('1999-04-19', GETDATE()) as [Tu edad actual es:]

select fechaNacimiento
from Alumnos


--Crear la funci�n Factorial la cual reciba como par�metros un n�mero entero y 
--regrese como resultado el factorial.








--Crear la funci�n ReembolsoQuincenal la cual reciba como par�metros un 
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


--Realizar una funci�n que calcule el impuesto que debe pagar un instructor para un 
--determinado curso. De tal manera que la funci�n recibir� id de un instructor y el id 
--del curso correspondiente.
--El c�lculo del impuesto se realiza de la siguiente forma: 
--Determinar el porcentaje que aplicar� dependiendo del estado de nacimiento
--Chiapas = 5 %
--Sonora = 10 %
--Veracruz = 7 %
--El resto del pa�s 8 %goCREATE OR ALTER FUNCTION dbo.CalcularImpuesto
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
    
    -- Determinar el porcentaje de impuesto seg�n el estado de nacimiento
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
    
    SELECT @HorasCurso = DATEDIFF(HOUR, C.FechaInicio, C.fechaTermino) -- Obtener la duraci�n del curso en horas
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



--Haciendo uso de la funci�n GetEdad, obtener una relaci�n de alumnos con la edad 
--a la fecha de inscripci�n, y la edad actual. De aquellos alumnos que actualmente 
--tengan m�s de 25 a�os.

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

/*12. Realizar una funci�n que determine el porcentaje a descontar en los reembolsos, 
con base a la cantidad de meses en que se realizar� el reembolso y el sueldo 
mensual logrado, de acuerdo al siguiente procedimiento:
a. El porcentaje de descuento ser� en funci�n de la cantidad de 
mensualidades en que se realizar� el reembolso.
b. La cantidad m�ximo de meses para realizar el reembolso es de 6 meses
c. El porcentaje m�ximo de descuento a otorgar ser� el que resulte el sueldo 
mensual entre 1,000
i. Ejemplo : Si el sueldo mensual es de 20,000 pesos el descuento 
ser� del 20 %
d. El porcentaje m�ximo de descuento ser� otorgado si el reembolso total se 
realiza cuando le corresponde efectuar la primera parcialidad de dicho 
reembolso
e. Los porcentaje de descuento a otorgar disminuir� inversamente 
proporcional a la cantidad de meses en que se cubrir� totalmente el 
reembolso, de tal forma que si el reembolso se cubre en la mitad del 
periodo m�ximo (3 meses = 6 meses /2), el porcentaje a descontar ser� la 
mitad del porcentaje m�ximo ( en el ejemplo 10% = 20% / 2), y si el 
reembolso se realiza en el m�ximo del plazo, el descuento a otorgar ser� 
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


--Hacer una funci�n que convierta a may�sculas la primera letra de cada palabra de 
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

    -- Iterar sobre las palabras y convertir la primera letra a may�scula
    SELECT @resultado = @resultado + ' ' + UPPER(LEFT(word, 1)) + LOWER(SUBSTRING(word, 2, LEN(word)))
    FROM @palabras;

    -- Eliminar el espacio inicial
    SET @resultado = LTRIM(@resultado);

    RETURN @resultado;
END;

SELECT dbo.ConvertirPrimeraLetraMayuscula ('XAVI EL MEJOR PROFE') AS [�quien es el mejor profe de tich?]


