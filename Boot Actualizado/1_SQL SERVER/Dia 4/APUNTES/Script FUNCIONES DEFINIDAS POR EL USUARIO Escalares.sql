-----------------------------------SUBTEMA: FUNCIONES DEFINIDAS POR EL USUARIO------------------------------------------
--Funciones escalares: La funci�n que devuelve un solo valor de datos se llama funci�n escalar.

------------------------------------------CARACTER�STICAS DE LAS FUNCIONES----------------------------------------------
--Las funciones no pueden ejecutar Procedimientos Almacenados (S.P.).
--Solo se puede anidar hasta 32 funciones al momento de ejecutar.
--No pueden insertar datos en otra tabla con la instrucci�n INTO.
--En las funciones tipo tablas, el resultado no se puede regresar con la instrucci�n ORDER BY en el RETURN.
--Solo las tablas temporales como variables est�n permitidas dentro de las funciones.
-------------------------------------------SINTAXIS-------------------------------------
--Crear:
      /* CREATE FUNCTION <nombreFuncion>
		(
		<Parametro><TipodeDato>,�n
		) 

        RETURNS <TipodeDato> 
        AS
		BEGIN
			 <Instruccion, operacion, etc.>
             RETURN <campo de regreso del mismo valor del regreso de la funci�n>
		END */
----------------------------------------------------------------------------------------
--Modificar:
		/* ALTER FUNCTION <nombreFuncion>(<Parametro><TipodeDato>,�n) 
		   RETURNS <TipodeDato> 
		   AS
		   BEGIN
				 <Instruccion, operacion, etc.>
			     RETURN <campo de regreso del mismo valor del regreso de la funci�n>
		   END */
----------------------------------------------------------------------------------------
--Borrar:
       /* DROP FUNCTION <nombreFuncion> */
-----------------------------------------------------------------------------------------
-----------------------------------------FUNCIONES ESCALARES-------------------------------------------
--Funciones escalares: La funci�n que devuelve un solo valor de datos se llama funci�n escalar.
--La cl�usula "returns" indica el tipo de dato retornado.
go
Create or Alter FUNCTION Mayusculas
(
@Nombre Varchar(50),
@Apellido Varchar(50)
)
RETURNS Varchar(100)
AS
BEGIN
 RETURN (UPPER(@Apellido) + ', ' + UPPER(@Nombre))
END

--Ejecutar
Print dbo.Mayusculas('laura','ruiz')

-----------------------------------------Estructura de control Iterativa WHILE - Sint�xis-------------------------------------------
--La estructura WHILE hace repetir un conjunto de instrucciones en secuencia, un n�mero determinado de veces 
--mientras la condici�n sea verdadera, a esto se le denomina bucle o ciclo. 
--Si en alg�n momento es falsa el bucle se termina.

-------------------------------------------------------SINTAXIS----------------------------------------------
/*
WHILE condiciones
BEGIN
   {...Declaraciones...}
END;
*/
--condici�n: La condici�n se prueba cada paso a trav�s del bucle. Si la condici�n se eval�a en TRUE, se ejecuta 
--el cuerpo del bucle. Si la condici�n se eval�a como FALSE, el bucle termina.

--Declaraciones: Las instrucciones de c�digo para ejecutar en cada paso a trav�s del bucle.
--------------------------------------------------------------Notas:---------------------------------------------
--Utilizar�a una instrucci�n WHILE cuando no est� seguro de cu�ntas veces desea que se ejecute el cuerpo del bucle.
--Instrucci�n ...BREAK; ...se usa cuando se desea salir de un bucle WHILE y ejecutar las siguientes instrucciones 
--despu�s de la instrucci�n END del bucle.
--Utilice la instrucci�n BREAK para finalizar un BUCLE WHILE antes de tiempo.
--la instrucci�n ...CONTINUE; ...se usa cuando se desea que un bucle WHILE se ejecute de nuevo.
--Ignorar� cualquier declaraci�n despu�s de la instrucci�n CONTINUE


--Declaramos la variable que controlar� las repeticiones del bucle
declare @N INT=0
--Aplicamos la estructura iterativa
while (@N<100)
begin
     --Aumentamos el valor de N para iniciar en 1
     --y evaluarlo en la pr�xima iteraci�n
     set @N=@N+1
     --Evaluamos que s�lo se imprima el valor de N cuando es par, es decir su residuo es cero.
if (@N % 2 =0)
          Print 'Valor N: ' + convert(char(3),@N)
end

