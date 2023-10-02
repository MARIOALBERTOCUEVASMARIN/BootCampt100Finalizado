-------------------------------------------------------------CONSULTAS MULTIPLES TABLAS--------------------------------------------------------------
--Union de tablas SQL Server
--Las uniones de SQL Server se usan para recuperar los datos de dos o m�s tablas relacionadas.


--Inner Join.
/*La uni�n interna en SQL Server se usa para devolver solo las filas coincidentes de ambas 
tablas involucradas en la uni�n mediante la eliminaci�n de los registros no coincidentes.*/

-------------------------------------------SINTAXIS------------------------------------- 
--SELECT nombreColumna(s)
--FROM tabla1
--INNER JOIN tabla2
--ON tabla1.nombreColumna=table2.nombreColumna;
--*******************************************************************************************

SELECT Catcur.Nombre as Curso, Horas as hora, Cur.fechaInicio,fechaTermino
	FROM Cursos Cur INNER JOIN  CatCursos Catcur
	ON Cur.idCatCurso = Catcur.id 
	WHERE Horas = 120

	SELECT *
	FROM Cursos INNER JOIN  CatCursos 
	ON Cursos.idCatCurso = CatCursos.id 
	WHERE Horas = 120

--Left Join.
/*La uni�n externa izquierda en SQL Server se usa para recuperar todas las filas coincidentes 
tanto de las tablas involucradas en la uni�n como de las filas no coincidentes de la tabla lateral izquierda.*/
-------------------------------------------SINTAXIS-------------------------------------
--SELECT nombreColumna(s)
--FROM tabla1
--LEFT JOIN tabla2
--ON tabla1.nombreColumna=tabla2.nombreColumna;

SELECT Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos LEFT JOIN  CatCursos 
	ON Cursos.idCatCurso = CatCursos.id 
	WHERE Horas = 120

--Right Join.
/*se usa para recuperar todas las filas coincidentes tanto de las tablas involucradas en la uni�n 
como de las filas no coincidentes de la tabla del lado derecho.*/

-------------------------------------------SINTAXIS-------------------------------------
--SELECT nombreColumna(s)
--FROM tabla1
--RIGHT JOIN tabla2
--ON tabla1.nombreColumna=tabla2.nombreColumna;

SELECT CatCur.Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos Cur RIGHT JOIN  CatCursos CatCur 
	ON Cur.idCatCurso = CatCur.id 
	WHERE Horas = 120

--Cross JOIN
 /*La CROSS JOIN no contiene una cl�usula ON. En Cross Join, cada registro de una tabla se une con 
 cada registro de la otra tabla. En SQL Server, la uni�n cruzada no debe tener una cl�usula ON o where.*/
 -------------------------------------------SINTAXIS-------------------------------------
  --select nombreColumna(s)
  --from tabla1
  --CROSS JOIN tabla2

  SELECT Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos CROSS JOIN  CatCursos 

	SELECT *
	FROM Cursos CROSS JOIN  CatCursos 
	
--Funci�n ISNULL()
/*Devuelva el valor especificado SI la expresi�n es NULL, de lo contrario devuelva la expresi�n*/
-------------------------------------------SINTAXIS-------------------------------------
--ISNULL(expression, value)
--expression:Es la expresi�n que se va a comprobar para ver si es nula "NULL"
--value: Es la expresi�n que se va a devolver si la expression es nala"NULL"

SELECT ISNULL('Hola', 'Tich');
SELECT ISNULL(NULL, 'Alumnos');

--Funci�n IIF()
--Devuelve un valor si una condici�n es Verdadera y otro valor si una condici�n es Falsa.
-------------------------------------------SINTAXIS-------------------------------------
--IIF(boolean_expression, true_value, false_value )

--boolean_expression: Expresi�n booleana v�lida.
--true_value: Valor que se devolver� si la expression es eval�a como Verdadera.
--false_value: Valor que se devolver� si la expression es eval�a como Falsa.

SELECT IIF(400>7000, 'Verdadero', 'Falso');

SELECT nombre,primerApellido,segundoApellido, IIF(cuotaHora>80, 'Especialista', 'Basico') as [Tipo Instructor]  
FROM Instructores

--Funci�n CONCAT()
--Agrega dos o m�s cadenas juntas.
-------------------------------------------SINTAXIS-------------------------------------
--CONCAT(string1, string2, ...., string_n)

SELECT Concat('Hola',' ','Mundo') AS NombreCompleto

SELECT Concat(nombre,' ',primerApellido, ' ',segundoApellido) AS NombreCompleto
FROM Alumnos

--Instrucci�n SQL CASE
--devuelve un valor cuando se cumple la primera condici�n
/*Por lo tanto, una vez que una condici�n es verdadera, dejar� de leer y devolver� el
resultado. Si no se cumplen las condiciones, devuelve el valor de la cl�usula.ELSE
*Si no hay ning�n art�culo y no se cumplen las condiciones, devuelve NULL.*/
-------------------------------------------SINTAXIS-------------------------------------
--CASE
--    WHEN condition1 THEN result1
--    WHEN condition2 THEN result2
--    WHEN conditionN THEN resultN
--    ELSE result
--END;
SELECT calificacion,
	CASE
	WHEN calificacion BETWEEN 9 AND 10 THEN 'Excelente'
	WHEN calificacion BETWEEN 7 AND 8 THEN 'Bien'
	WHEN calificacion = 6 THEN 'Suficiente'
	ELSE 'N/A'
	END AS Nivel
  FROM CursosAlumnos
