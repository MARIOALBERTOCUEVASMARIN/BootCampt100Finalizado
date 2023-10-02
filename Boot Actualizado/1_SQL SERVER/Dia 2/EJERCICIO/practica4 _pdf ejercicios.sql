practica 4 

--Realizar la siguiente Consulta con el nombre y apellidos en 
--Mayúsculas

select * from Alumnos

SELECT  UPPER (nombre) as Nombre, UPPER (primerApellido) as PrimerApellido, UPPER (segundoApellido) as SegundoApellido,  fechaNacimiento, GETDATE() as Hoy, DATEDIFF(year,fechaNacimiento,GETDATE()) AS 'Edad', 
DATEDIFF(year,fechaNacimiento,DATEADD(month, 5, getdate())) AS Edad5Meses
FROM Alumnos


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Realizar la consulta Anterior agregando columna con la fecha de 
--nacimiento extraída del CURPselect * from Alumnosselect id,primerApellido, segundoApellido, fechaNacimiento, curp , CONVERT(DATE, SUBSTRING(curp, 5, 6)) [FechaCurp]from Alumnos----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------Realizar una consulta con los datos del alumnos y una columna 
-- indicando el género con la palabra ‘Hombre’ o ‘Mujer’ según 
--corresponda de acuerdo con lo indicado en la columna 11 del curp
 select  *,iif (SUBSTRING(curp, 11, 1) = 'h','HOMBRE','MUJER') [Genero] 

from Alumnos

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Realizar la siguiente consulta de Alumnos, cambiando el correo de 
--Gmail por hotmail

SELECT id, nombre, primerApellido, segundoApellido, fechaNacimiento, correo,REPLACE(correo, 'gmail.com', 'hotmail.com') as CorreoHot 

FROM Alumnos
 