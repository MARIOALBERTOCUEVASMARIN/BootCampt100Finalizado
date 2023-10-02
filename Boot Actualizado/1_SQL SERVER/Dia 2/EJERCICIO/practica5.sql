use InstitutoTich
go



select MIN(cuotaHora) as cuotaHora FROM Instructores

--Realizar la siguiente consulta Alumnos por Estado   bueno

SELECT Estados.nombre, 
       count(Alumnos.idEstadoOrigen) as Total
FROM Alumnos
	inner join
	Estados
		on Estados.id =	Alumnos.idEstadoOrigen
GROUP BY Estados.nombre


--Realizar la siguiente consulta Alumnos por Estatus

SELECT EstatusAlumnos.Nombre as Estatus, 
       count(Alumnos.idEstatus) as Total
FROM Alumnos
	inner join
	EstatusAlumnos
		on EstatusAlumnos.id =	Alumnos.idEstatus
GROUP BY EstatusAlumnos.Nombre

--Realizar la siguiente consulta Resumen de Calificaciones


select	'Calificaciones Alumnos' as [Resumen Calificaciones],
	    count(calificacion) as total,
		max(calificacion) as Maximo,
		min(calificacion) as Minimo,
		avg(calificacion) as Promedio
from CursosAlumnos



--Realizar la siguiente consulta Resumen de Calificaciones por Curso

use InstitutoTich
go
select cc.nombre as [Curso],c.fechaInicio,c.fechatermino,
		count(ca.calificacion) as total,
		max(ca.calificacion) as Maximo,
		min(ca.calificacion) as Minimo,
		avg(ca.calificacion) as Promedio
from Alumnos al
	inner join
	CursosAlumnos ca
		on ca.idAlumno=al.id
	inner join
	Cursos c
		on c.id=ca.idCurso
	inner join
	CatCursos cc
		on cc.id=c.idCatCurso
	group by cc.nombre,c.fechaInicio, c.fechatermino

--Realizar la siguiente consulta Resumen de Calificaciones por Estado, 
--considerando únicamente a los Estados que tienen promedio mayor a 


SELECT Est.nombre as Estado, 
		count(CurAlu.calificacion) as Total,
		MAX(CurAlu.calificacion) as Maximo,
		MIN(CurAlu.calificacion) as Minimo,
		avg(CurAlu.calificacion) as Promedio
FROM Alumnos Alu 
	 INNER JOIN 
	 Estados Est 
		ON Alu.idEstadoOrigen = Est.id 
	 INNER JOIN
	 CursosAlumnos CurAlu 
		ON Alu.id = CurAlu.idAlumno 
WHERE Alu.id >0
GROUP BY Est.nombre
HAVING AVG (CurAlu.calificacion) > 6
ORDER BY Estado



SELECT IIF(calificacion>6,COUNT(calificacion) as total, 0)
FROM CursosAlumnos

select*
from CursosAlumnos
order by calificacion desc;