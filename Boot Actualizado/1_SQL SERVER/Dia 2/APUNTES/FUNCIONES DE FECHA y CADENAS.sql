  -----------------------------------FUNCIONES DE FECHA--------------------------------------------
--Funci�n GETDATE()
--Devuelva la fecha y hora del sistema de base de datos actual:
  SELECT GETDATE();

--Funci�n DATEDIFF()
--Devuelve la diferencia entre dos valores de fecha, en a�os:
SELECT DATEDIFF(year,'2010/05/12','2022/05/12') AS DateDif;

--Devuelve la diferencia entre dos valores de fecha, en meses:
SELECT DATEDIFF(month, '2022/05/12', '2022/08/12') AS DateDif;

--Devuelve la diferencia entre dos valores de fecha, en horas:
SELECT DATEDIFF(hour, '2022/05/12 07:00', '2022/05/12 12:45') AS DateDif;

SELECT DATEDIFF(DAY, '2022/05/12 07:00', '2022/05/12 12:45') AS DateDif;

--Funci�n DATEADD()
--A�ade un a�o a una fecha y, a continuaci�n, devuelve la fecha:
SELECT DATEADD(year, 1, '2022/05/12') AS DateAd;

--Agregue dos meses a una fecha y, a continuaci�n, devuelva la fecha:
SELECT DATEADD(month, 2, '2022/05/12') AS DateAd;

--Reste dos meses de una fecha y, a continuaci�n, devuelva la fecha:
SELECT DATEADD(month, -2, '2022/05/12') AS DateAd;
----------------------------------------FUNCIONES DE CADENAS-------------------------------------------
--Las funciones de cadena realizan operaciones en valores de cadena y devuelven valores num�ricos o de cadena.

--Funci�n UPPER()
--Convierta el texto en may�sculas:

-------------------------------------------SINTAXIS-------------------------------------
--UPPER(text)
/*text: es una expresi�n de datos de caracteres. character_expression puede ser una constante,
--variable o columna de car�cter.*/

SELECT UPPER('texto en may�sculas') as texto;

SELECT UPPER(nombre) AS NOMBRE
FROM Instructores


SELECT LOWER('HOLA') as texto;

--Funci�n SUBSTRING()
--Extrae algunos caracteres de una cadena.
-------------------------------------------SINTAXIS-------------------------------------
--SUBSTRING(string, start, length)
--string: Es una expresi�n de car�cter, binario, texto y ntexto.
--start: Es una expresi�n entera o bigint que especifica d�nde comienzan los caracteres devueltos.
--length:Es una expresi�n entera o bigint positiva que especifica cu�ntos caracteres de la expresi�n se devolver�n. 

SELECT SUBSTRING('Curso Sql', 1,5) AS Extracci�nCadena;

SELECT nombre,rfc,SUBSTRING(rfc, 9, 2) as [Dia Nacimiento rfc]
FROM Instructores

SELECT * FROM Instructores

--Funci�n REPLACE()
--reemplaza todas las apariciones de una subcadena dentro de una cadena, con una nueva subcadena.
-------------------------------------------SINTAXIS-------------------------------------
--REPLACE(string, old_string, new_string)
--string: Es la expresi�n de cadena donde se va a buscar.
--old_string: Es la subcadena que se remplazara.
--new_string: Es la cadena de reemplazo.

SELECT REPLACE('Curso Sql otra cadena Sql', 'Sql', 'C#') as Cursos;

SELECT correo,REPLACE(correo, '.com', '.mx') as Correo FROM Instructores

--SELECT * FROM Instructores

--Funci�n Ascii()
--devuelve el valor ASCII para el car�cter espec�fico
-------------------------------------------SINTAXIS-------------------------------------
--ASCII(car�cter)
--El car�cter para el que se devolver� el valor ASCII. 
--Si se ingresa m�s de un car�cter, solo devolver� el valor del primer car�cter
SELECT ASCII('@') as [c�digo ASCII];


--La funci�n CHAR()
--devuelve el car�cter basado en el c�digo ASCII.
-------------------------------------------SINTAXIS-------------------------------------
--Char(c�digo num�rico ASCII)
--El c�digo num�rico ASCII para devolver el car�cter 

SELECT Char(64) as [car�cter ASCII];

--Funci�n CHARINDEX()
--busca una subcadena en una cadena y devuelve la posici�n.
--Si no se encuentra la subcadena, esta funci�n devuelve 0.
--Nota: Esta funci�n no distingue entre may�sculas y min�sculas.
-------------------------------------------SINTAXIS-------------------------------------
--CHARINDEX(subcadena, cadena, inicio)
--subcadena: La subcadena a buscar
--inicio:La posici�n donde comenzar� la b�squeda (si no desea comenzar al principio de la cadena). La primera posici�n en la cadena es 1

SELECT CHARINDEX('Sql', 'Curso Sql') AS Cursos;

------------------------------------------FUNCI�N CONVERT()--------------------------
--funci�n CONVERT convierte una expresi�n de un tipo de datos a otro tipo de datos.
-------------------------------------------SINTAXIS-------------------------------------
--CONVERT( tipo [(longitud)],expresi�n[,estilo])
--tipo: El tipo de datos al que desea convertir la expresi�n. Puede ser uno de los siguientes:
--------bigint, int, smallint, tinyint, bit, decimal, num�rico, dinero, smallmoney, float, real, 
--------datetime, smalldatetime, char, varchar, text, nchar, nvarchar, ntext, binary, varbinary o image.
--longitud: Opcional. La longitud del tipo de datos resultante para char, varchar, nchar, nvarchar, binario y varbinario.
--expresi�n: Valor que se va a convertir en otro tipo de datos.
--estilo: Opcional. El formato utilizado para convertir entre tipos de datos, como un formato de fecha o 
--un formato de cadena.

SELECT CONVERT(DATE, SUBSTRING(rfc, 5, 6)) [Dia Nacimiento rfc]
FROM Instructores

SELECT SUBSTRING(rfc, 5, 6) [Dia Nacimiento rfc]
FROM Instructores