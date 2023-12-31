---------------------------------------------------------------------------------------------------------------------------------------------

--FUNCIONES INNER JOIN Y CONSULTAS BASICAS CON FUNCIONES 
-- checar con el pdf consultas multiples

-------------------------------------------------------------------------------------------------------------------------------------------

--realizamos una consulta de instructoes en donde pedimos nombre del instructor, Ap, Am, rfc, Cuotahora cambiando el nombre con un AS y el estatusdel instructor 
--aqui tuvimos que usar un IFF para poner un nombre s el estado real es 0 , 1 y si es 1 sera Activo

USE InstitutoTich

SELECT * FROM instructores

SELECT nombre, primerApellido as [Apellido Paterno], segundoApellido as [Apellido Materno], rfc, cuotaHora as [Cuota por Hora], 
IIF(Activo>0, 'Activo', 'Inactivo') as [Estatus] 
FROM instructores

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Realizar la siguiente consulta de Cursos 

select * from Cursos
SELECT * FROM CatCursos

SELECT Catcur.Nombre as Curso, Horas as horas, Cur.fechaInicio,fechaTermino
	FROM Cursos Cur INNER JOIN  CatCursos Catcur
	ON Cur.idCatCurso = Catcur.id 
	WHERE Horas = 40

-----------------------------------------------------------------------------------------------------------------

--Realizar la siguiente consulta de alumnos 

SELECT * FROM EstatusAlumnos


SELECT Al.nombre, Al.primerApellido, Al.segundoApellido, Al.curp , Es.nombre as [Estado] ,Ea.Nombre
FROM Alumnos Al inner join Estados Es           ON Al.idEstadoOrigen = Es.id
                inner join EstatusAlumnos Ea    ON Al.idEstatus = Ea.id
   
   
----------------------------------------------------------------------------------------------------------------------------------------------------

-- Realizar la siguiente consulta de Instructores, en que cursos ha 
-- participado

SELECT * FROM  instructores
SELECT * FROM Cursos
SELECT * FROM CatCursos

-----------------------------------------------------FORMA INCORRRECTA-----------------------------------------------------------------
SELECT   Concat(Inst.nombre,' ',primerApellido, ' ',segundoApellido) AS Instructor, cuotaHora, cat.nombre, fechaInicio, fechaTermino
FROM instructores Inst inner join CursosInstructores Ci     ON Inst.id     = Ci.idInstructor
                       inner join CatCursos Cat             ON Inst.activo = Cat.activo
					   inner join Cursos Cur                ON Inst.activo = Cur.activo
WHERE cat.nombre = 'Matematicas' 

------------------------------------------------------FORMA CORRECTA ------------------------------------------------------------------------

SELECT   Concat(Inst.nombre,' ',primerApellido, ' ',segundoApellido) AS Instructor, cuotaHora, cat.nombre, fechaInicio, fechaTermino
FROM instructores Inst inner join CursosInstructores Ci     ON Inst.id     = Ci.idInstructor
                       inner join Cursos Cur                ON Ci.idCurso = Cur.id
                       inner join CatCursos Cat             ON Cur.idCatCurso = Cat.id
					  


--------------------------------------------------------------------------------------------------------------------------------------------------
--Realizar la siguiente consulta de Alumnos, mostrando los cursos ha tomado

select * from Alumnos

select AL.nombre, primerApellido, segundoApellido, ES.nombre, CA.fechaInscripcion, CUR.fechaInicio, CUR.fechaTermino, calificacion   
from Alumnos AL inner join Estados ES             ON ES.id = AL.idEstadoOrigen
                inner join CursosAlumnos CA       ON AL.id = CA.idAlumno
                inner join Cursos CUR             ON CUR.id = CA.idCurso


---------------------------------------------------------------------------------------------------------------------------------------------------
--Consulta de alumnos: Nombre y apellidos, curso, fecha inicial, fecha 
--final, calificación. Ordenado de la calificación más alta a la más baja

select  Concat(AL.nombre,' ',primerApellido, ' ',segundoApellido) AS [Nombre y Apellidos], CAT.nombre as [Curso], CUR.fechaInicio as [Fecha Inicial], CUR.fechaTermino AS [Fecha Final], calificacion   
from Alumnos AL inner join Estados ES             ON ES.id = AL.idEstadoOrigen
                inner join CursosAlumnos CA       ON AL.id = CA.idAlumno
                inner join Cursos CUR             ON CUR.id = CA.idCurso
				inner join CatCursos CAT          ON CAT.id = CUR.idCatCurso
ORDER BY calificacion DESC

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Realizar la siguiente consulta de los Cursos con su correspondiente 
--curso de prerrequisito

SELECT * FROM Cursos
SELECT * FROM CatCursos


SELECT CatCursos.clave AS [Clave], CatCursos.nombre AS [Curso] , CatCursos.horas as [Horas],
ISNULL (CAT.nombre, 'sin prerequisito') as PreRequisito
FROM CatCursos   LEFT join  CatCursos CAT       ON CatCursos.idPreRequisito = Cat.id

				

use InstitutoTich


SELECT clave AS [Clave], nombre AS [Curso] , horas as [Horas],idPreRequisito as [Prerrequisito],

     CASE
	WHEN clave = 'mate1' THEN 'SIN REQUISITO'
	WHEN clave = 'mate2' THEN 'mate1'
	WHEN clave = 'mate3' THEN 'mate2'
	WHEN clave = 'mate4' THEN 'PROXIMAMENTE'
	ELSE 'N/A'
	END AS Nivel
	
FROM CatCursos CAT inner join cursos cur         ON CUR.idCatCurso = cat.id
order by clave asc
				

use InstitutoTich



---------------------------------------------------------------------------------------------------------------------------------------------------

--Realizar una consulta con los datos del alumno y curso, dentro de 
--ellos la calificación, obteniendo el nivel alcanzado de acuerdo con lo 
--siguienteselect AL.nombre, primerApellido, segundoApellido, Cat.nombre, CUR.fechaInicio, CUR.fechaTermino, calificacion,
   
	CASE
	WHEN calificacion BETWEEN 9 AND 10 THEN 'Excelente'
	WHEN calificacion BETWEEN 7 AND 8 THEN 'Bien'
	WHEN calificacion = 6 THEN 'Suficiente'
	ELSE 'N/A'
	END AS Nivel
  
from Alumnos AL inner join Estados ES             ON ES.id = AL.idEstadoOrigen
                inner join CursosAlumnos CA       ON AL.id = CA.idAlumno
                inner join Cursos CUR             ON CUR.id = CA.idCurso
				inner join CatCursos  CAT         ON CUR.idCatCurso = CAT.id
