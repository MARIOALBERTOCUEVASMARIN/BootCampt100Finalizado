-------------------------------------------------------------CONSULTAS MULTIPLES TABLAS--------------------------------------------------------------
--Union de tablas SQL Server
--Las uniones de SQL Server se usan para recuperar los datos de dos o más tablas relacionadas.


--Inner Join.
/*La unión interna en SQL Server se usa para devolver solo las filas coincidentes de ambas 
tablas involucradas en la unión mediante la eliminación de los registros no coincidentes.*/

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
/*La unión externa izquierda en SQL Server se usa para recuperar todas las filas coincidentes 
tanto de las tablas involucradas en la unión como de las filas no coincidentes de la tabla lateral izquierda.*/
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
/*se usa para recuperar todas las filas coincidentes tanto de las tablas involucradas en la unión 
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
 /*La CROSS JOIN no contiene una cláusula ON. En Cross Join, cada registro de una tabla se une con 
 cada registro de la otra tabla. En SQL Server, la unión cruzada no debe tener una cláusula ON o where.*/
 -------------------------------------------SINTAXIS-------------------------------------
  --select nombreColumna(s)
  --from tabla1
  --CROSS JOIN tabla2

  SELECT Nombre as Curso, Horas as hora, fechaInicio,fechaTermino
	FROM Cursos CROSS JOIN  CatCursos 

	SELECT *
	FROM Cursos CROSS JOIN  CatCursos 
	
--Función ISNULL()
/*Devuelva el valor especificado SI la expresión es NULL, de lo contrario devuelva la expresión*/
-------------------------------------------SINTAXIS-------------------------------------
--ISNULL(expression, value)
--expression:Es la expresión que se va a comprobar para ver si es nula "NULL"
--value: Es la expresión que se va a devolver si la expression es nala"NULL"

SELECT ISNULL('Hola', 'Tich');
SELECT ISNULL(NULL, 'Alumnos');

--Función IIF()
--Devuelve un valor si una condición es Verdadera y otro valor si una condición es Falsa.
-------------------------------------------SINTAXIS-------------------------------------
--IIF(boolean_expression, true_value, false_value )

--boolean_expression: Expresión booleana válida.
--true_value: Valor que se devolverá si la expression es evalúa como Verdadera.
--false_value: Valor que se devolverá si la expression es evalúa como Falsa.

SELECT IIF(400>7000, 'Verdadero', 'Falso');

SELECT nombre,primerApellido,segundoApellido, IIF(cuotaHora>80, 'Especialista', 'Basico') as [Tipo Instructor]  
FROM Instructores

--Función CONCAT()
--Agrega dos o más cadenas juntas.
-------------------------------------------SINTAXIS-------------------------------------
--CONCAT(string1, string2, ...., string_n)

SELECT Concat('Hola',' ','Mundo') AS NombreCompleto

SELECT Concat(nombre,' ',primerApellido, ' ',segundoApellido) AS NombreCompleto
FROM Alumnos

--Instrucción SQL CASE
--devuelve un valor cuando se cumple la primera condición
/*Por lo tanto, una vez que una condición es verdadera, dejará de leer y devolverá el
resultado. Si no se cumplen las condiciones, devuelve el valor de la cláusula.ELSE
*Si no hay ningún artículo y no se cumplen las condiciones, devuelve NULL.*/
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
