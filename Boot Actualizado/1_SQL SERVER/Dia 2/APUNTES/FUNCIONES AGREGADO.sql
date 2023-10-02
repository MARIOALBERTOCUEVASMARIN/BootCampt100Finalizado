  -------------------------------------FUNCIONES AGREGADO--------------------------------------
--devuelven un solo valor, calculado a partir de valores de una columna.

--COUNT: devuelve el n�mero total de filas seleccionadas por la consulta.
--MIN: devuelve el valor m�nimo del campo que especifiquemos.
--MAX: devuelve el valor m�ximo del campo que especifiquemos.
--SUM: suma los valores del campo que especifiquemos. S�lo se puede utilizar en columnas num�ricas.
--AVG: devuelve el valor promedio del campo que especifiquemos. S�lo se puede utilizar en columnas num�ricas.



--Function AVG()
--devuelve el valor medio de una columna num�rica.
-------------------------------------------SINTAXIS-------------------------------------
--SELECT AVG(column_name) FROM table_name

SELECT MIN(cuotaHora) as cuotaHora FROM Instructores
---------------------------------------La cl�usula SQL HAVING----------------------------------
--La cl�usula HAVING:Se usa en combinaci�n con la cl�usula GROUP BY para restringir los grupos de 
--filas devueltas solo a aquellos cuya condici�n es TRUE.
-------------------------------------------SINTAXIS-------------------------------------
/*
SELECT expresi�n1, expresi�n2, ... expresi�n_n, 
       funci�n_agregado (expresi�n)
FROM tables
[WHERE condiciones]
GROUP BY expresi�n1, expresi�n2, ... expresi�n_n
HAVING condici�n_having;
ORDER BY expresi�n(n);
*/
--funci�n_agregado: Puede ser una funci�n como las funciones SUM, COUNT, MIN, MAX o AVG.
--expresi�n1, expresi�n2, ... expresi�n_n: Las expresiones que no est�n encapsuladas dentro de una funci�n agregada y deben incluirse en la cl�usula GROUP BY.
--WHERE condiciones: Opcional. Estas son las condiciones para seleccionar los registros.
--condici�n_having: Esta es una condici�n adicional que se aplica solo a los resultados agregados para restringir los grupos de filas devueltas. Solo aquellos grupos cuya condici�n se eval�e a TRUE se incluir�n en el conjunto de resultados.

 SELECT Est.nombre as Estado, count(CurAlu.calificacion) as Total
  FROM Alumnos Alu INNER JOIN 
				Estados Est ON Alu.idEstadoOrigen = Est.id INNER JOIN
				CursosAlumnos CurAlu ON Alu.id = CurAlu.idAlumno 
  WHERE Alu.id >5
GROUP BY Est.nombre
HAVING AVG (CurAlu.calificacion) > 8
ORDER BY Estado
