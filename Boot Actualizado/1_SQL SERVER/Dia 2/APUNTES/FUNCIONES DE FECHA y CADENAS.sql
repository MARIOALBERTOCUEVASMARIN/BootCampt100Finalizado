  -----------------------------------FUNCIONES DE FECHA--------------------------------------------
--Función GETDATE()
--Devuelva la fecha y hora del sistema de base de datos actual:
  SELECT GETDATE();

--Función DATEDIFF()
--Devuelve la diferencia entre dos valores de fecha, en años:
SELECT DATEDIFF(year,'2010/05/12','2022/05/12') AS DateDif;

--Devuelve la diferencia entre dos valores de fecha, en meses:
SELECT DATEDIFF(month, '2022/05/12', '2022/08/12') AS DateDif;

--Devuelve la diferencia entre dos valores de fecha, en horas:
SELECT DATEDIFF(hour, '2022/05/12 07:00', '2022/05/12 12:45') AS DateDif;

SELECT DATEDIFF(DAY, '2022/05/12 07:00', '2022/05/12 12:45') AS DateDif;

--Función DATEADD()
--Añade un año a una fecha y, a continuación, devuelve la fecha:
SELECT DATEADD(year, 1, '2022/05/12') AS DateAd;

--Agregue dos meses a una fecha y, a continuación, devuelva la fecha:
SELECT DATEADD(month, 2, '2022/05/12') AS DateAd;

--Reste dos meses de una fecha y, a continuación, devuelva la fecha:
SELECT DATEADD(month, -2, '2022/05/12') AS DateAd;
----------------------------------------FUNCIONES DE CADENAS-------------------------------------------
--Las funciones de cadena realizan operaciones en valores de cadena y devuelven valores numéricos o de cadena.

--Función UPPER()
--Convierta el texto en mayúsculas:

-------------------------------------------SINTAXIS-------------------------------------
--UPPER(text)
/*text: es una expresión de datos de caracteres. character_expression puede ser una constante,
--variable o columna de carácter.*/

SELECT UPPER('texto en mayúsculas') as texto;

SELECT UPPER(nombre) AS NOMBRE
FROM Instructores


SELECT LOWER('HOLA') as texto;

--Función SUBSTRING()
--Extrae algunos caracteres de una cadena.
-------------------------------------------SINTAXIS-------------------------------------
--SUBSTRING(string, start, length)
--string: Es una expresión de carácter, binario, texto y ntexto.
--start: Es una expresión entera o bigint que especifica dónde comienzan los caracteres devueltos.
--length:Es una expresión entera o bigint positiva que especifica cuántos caracteres de la expresión se devolverán. 

SELECT SUBSTRING('Curso Sql', 1,5) AS ExtracciónCadena;

SELECT nombre,rfc,SUBSTRING(rfc, 9, 2) as [Dia Nacimiento rfc]
FROM Instructores

SELECT * FROM Instructores

--Función REPLACE()
--reemplaza todas las apariciones de una subcadena dentro de una cadena, con una nueva subcadena.
-------------------------------------------SINTAXIS-------------------------------------
--REPLACE(string, old_string, new_string)
--string: Es la expresión de cadena donde se va a buscar.
--old_string: Es la subcadena que se remplazara.
--new_string: Es la cadena de reemplazo.

SELECT REPLACE('Curso Sql otra cadena Sql', 'Sql', 'C#') as Cursos;

SELECT correo,REPLACE(correo, '.com', '.mx') as Correo FROM Instructores

--SELECT * FROM Instructores

--Función Ascii()
--devuelve el valor ASCII para el carácter específico
-------------------------------------------SINTAXIS-------------------------------------
--ASCII(carácter)
--El carácter para el que se devolverá el valor ASCII. 
--Si se ingresa más de un carácter, solo devolverá el valor del primer carácter
SELECT ASCII('@') as [código ASCII];


--La función CHAR()
--devuelve el carácter basado en el código ASCII.
-------------------------------------------SINTAXIS-------------------------------------
--Char(código numérico ASCII)
--El código numérico ASCII para devolver el carácter 

SELECT Char(64) as [carácter ASCII];

--Función CHARINDEX()
--busca una subcadena en una cadena y devuelve la posición.
--Si no se encuentra la subcadena, esta función devuelve 0.
--Nota: Esta función no distingue entre mayúsculas y minúsculas.
-------------------------------------------SINTAXIS-------------------------------------
--CHARINDEX(subcadena, cadena, inicio)
--subcadena: La subcadena a buscar
--inicio:La posición donde comenzará la búsqueda (si no desea comenzar al principio de la cadena). La primera posición en la cadena es 1

SELECT CHARINDEX('Sql', 'Curso Sql') AS Cursos;

------------------------------------------FUNCIÓN CONVERT()--------------------------
--función CONVERT convierte una expresión de un tipo de datos a otro tipo de datos.
-------------------------------------------SINTAXIS-------------------------------------
--CONVERT( tipo [(longitud)],expresión[,estilo])
--tipo: El tipo de datos al que desea convertir la expresión. Puede ser uno de los siguientes:
--------bigint, int, smallint, tinyint, bit, decimal, numérico, dinero, smallmoney, float, real, 
--------datetime, smalldatetime, char, varchar, text, nchar, nvarchar, ntext, binary, varbinary o image.
--longitud: Opcional. La longitud del tipo de datos resultante para char, varchar, nchar, nvarchar, binario y varbinario.
--expresión: Valor que se va a convertir en otro tipo de datos.
--estilo: Opcional. El formato utilizado para convertir entre tipos de datos, como un formato de fecha o 
--un formato de cadena.

SELECT CONVERT(DATE, SUBSTRING(rfc, 5, 6)) [Dia Nacimiento rfc]
FROM Instructores

SELECT SUBSTRING(rfc, 5, 6) [Dia Nacimiento rfc]
FROM Instructores