--DIA DOS CONSULTAS 
-------------------------------------------------------------------------------------------------------------------------------------------
--Realizar la siguiente consulta de Alumnos ( en donde solo se muestre el appelido paterno_ apellido materno, nombre, telefono y correo)
-- usando el AS es para darle un sobre nombre en la tabla mostrada a cada columna ejemplo 
-- primerApellido quedaria Apellido Paterno 

use InstitutoTich
SELECT primerApellido as [Apellido Paterno],segundoApellido as [Apellido Materno], nombre, telefono, correo 
FROM Alumnos

------------------------------------------------------------------------------------------------------------------------------------------

 --Realizar la siguiente consulta de Instructores (en donde se muestre nombre, ap , am, rfc y cuota por hora usaremos order by para 
 --ordenar el sueldo de mayor a menor )

 select * from instructores

 select nombre, primerApellido, segundoApellido, rfc, cuotaHora 
 from instructores
 order by cuotaHora desc

 ------------------------------------------------------------------------------------------------------------------------------------------
--  Realizar la consulta de los 5 alumnos m�s j�venes 

 select * from Alumnos 

 select top (5) nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus
 from Alumnos
 order by fechaNacimiento desc

 -------------------------------------------------------------------------------------------------------------------------------------------

--  Crear la Base de datos Ejercicios

  create database Ejercicios 

  ------------------------------------------------------------------------------------------------------------------------------------------
  -- Copiar las tablas de Alumnos e Instructores desde la Base de Datos 
     --            InstitutoTich a la de Ejercicios


use Ejercicios
SELECT * INTO Alumnos  from InstitutoTich.dbo.Alumnos
select * from Alumnos --para verificar que esta correcta


use Ejercicios
SELECT * INTO instructores  from InstitutoTich.dbo.instructores
select * from instructores --para verificar que esta correcta

------------------------------------------------------------------------------------------------------------------------------------------------
 --aqui mostramos a los 5 Alumnos mas jovenes de la base de datos InstitutosTich con el sueldo de menor a mayor
 
 
 select top (5) nombre, primerApellido, segundoApellido, correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus
 from Alumnos
 order by fechaNacimiento desc, sueldo asc

 --------------------------------------------------------------------------------------------------------------------------------------------



