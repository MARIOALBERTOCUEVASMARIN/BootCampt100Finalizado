  -------------------------------------FUNCIONES AGREGADO--------------------------------------
--devuelven un solo valor, calculado a partir de valores de una columna.

--COUNT: devuelve el número total de filas seleccionadas por la consulta.
--MIN: devuelve el valor mínimo del campo que especifiquemos.
--MAX: devuelve el valor máximo del campo que especifiquemos.
--SUM: suma los valores del campo que especifiquemos. Sólo se puede utilizar en columnas numéricas.
--AVG: devuelve el valor promedio del campo que especifiquemos. Sólo se puede utilizar en columnas numéricas.



--Function AVG()
--devuelve el valor medio de una columna numérica.
-------------------------------------------SINTAXIS-------------------------------------
--SELECT AVG(column_name) FROM table_name

SELECT MIN(cuotaHora) as cuotaHora FROM Instructores
---------------------------------------La cláusula SQL HAVING----------------------------------
--La cláusula HAVING:Se usa en combinación con la cláusula GROUP BY para restringir los grupos de 
--filas devueltas solo a aquellos cuya condición es TRUE.
-------------------------------------------SINTAXIS-------------------------------------
/*
SELECT expresión1, expresión2, ... expresión_n, 
       función_agregado (expresión)
FROM tables
[WHERE condiciones]
GROUP BY expresión1, expresión2, ... expresión_n
HAVING condición_having;
ORDER BY expresión(n);
*/
--función_agregado: Puede ser una función como las funciones SUM, COUNT, MIN, MAX o AVG.
--expresión1, expresión2, ... expresión_n: Las expresiones que no están encapsuladas dentro de una función agregada y deben incluirse en la cláusula GROUP BY.
--WHERE condiciones: Opcional. Estas son las condiciones para seleccionar los registros.
--condición_having: Esta es una condición adicional que se aplica solo a los resultados agregados para restringir los grupos de filas devueltas. Solo aquellos grupos cuya condición se evalúe a TRUE se incluirán en el conjunto de resultados.

 SELECT Est.nombre as Estado, count(CurAlu.calificacion) as Total
  FROM Alumnos Alu INNER JOIN 
				Estados Est ON Alu.idEstadoOrigen = Est.id INNER JOIN
				CursosAlumnos CurAlu ON Alu.id = CurAlu.idAlumno 
  WHERE Alu.id >5
GROUP BY Est.nombre
HAVING AVG (CurAlu.calificacion) > 8
ORDER BY Estado
