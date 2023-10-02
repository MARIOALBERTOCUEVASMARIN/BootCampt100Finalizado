
practica 3  FUNCIONES FECHA 

use InstitutoTich 

-- Realizar la siguiente consulta de Alumnos, con edad actual y edad en 
-- 5 Meses


select * from Alumnos

update Alumnos set fechaNacimiento = DATEADD(year, 1, fechaNacimiento) --aumenta en la tabla 

select id, nombre, primerApellido,segundoApellido, fechaNacimiento, GETDATE() as Hoy, DATEDIFF(year,fechaNacimiento,GETDATE()) AS 'Edad', 
DATEDIFF(year,fechaNacimiento,DATEADD(month, 5, getdate())) AS Edad5Meses
from Alumnos