-----------------------------------SUBTEMA: FUNCIONES DEFINIDAS POR EL USUARIO------------------------------------------
--Funciones escalares: La función que devuelve un solo valor de datos se llama función escalar.

------------------------------------------CARACTERÍSTICAS DE LAS FUNCIONES----------------------------------------------
--Las funciones no pueden ejecutar Procedimientos Almacenados (S.P.).
--Solo se puede anidar hasta 32 funciones al momento de ejecutar.
--No pueden insertar datos en otra tabla con la instrucción INTO.
--En las funciones tipo tablas, el resultado no se puede regresar con la instrucción ORDER BY en el RETURN.
--Solo las tablas temporales como variables están permitidas dentro de las funciones.
-------------------------------------------SINTAXIS-------------------------------------
--Crear:
      /* CREATE FUNCTION <nombreFuncion>
		(
		<Parametro><TipodeDato>,…n
		) 

        RETURNS <TipodeDato> 
        AS
		BEGIN
			 <Instruccion, operacion, etc.>
             RETURN <campo de regreso del mismo valor del regreso de la función>
		END */
----------------------------------------------------------------------------------------
--Modificar:
		/* ALTER FUNCTION <nombreFuncion>(<Parametro><TipodeDato>,…n) 
		   RETURNS <TipodeDato> 
		   AS
		   BEGIN
				 <Instruccion, operacion, etc.>
			     RETURN <campo de regreso del mismo valor del regreso de la función>
		   END */
----------------------------------------------------------------------------------------
--Borrar:
       /* DROP FUNCTION <nombreFuncion> */
-----------------------------------------------------------------------------------------
-----------------------------------------FUNCIONES ESCALARES-------------------------------------------
--Funciones escalares: La función que devuelve un solo valor de datos se llama función escalar.
--La cláusula "returns" indica el tipo de dato retornado.
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

-----------------------------------------Estructura de control Iterativa WHILE - Sintáxis-------------------------------------------
--La estructura WHILE hace repetir un conjunto de instrucciones en secuencia, un número determinado de veces 
--mientras la condición sea verdadera, a esto se le denomina bucle o ciclo. 
--Si en algún momento es falsa el bucle se termina.

-------------------------------------------------------SINTAXIS----------------------------------------------
/*
WHILE condiciones
BEGIN
   {...Declaraciones...}
END;
*/
--condición: La condición se prueba cada paso a través del bucle. Si la condición se evalúa en TRUE, se ejecuta 
--el cuerpo del bucle. Si la condición se evalúa como FALSE, el bucle termina.

--Declaraciones: Las instrucciones de código para ejecutar en cada paso a través del bucle.
--------------------------------------------------------------Notas:---------------------------------------------
--Utilizaría una instrucción WHILE cuando no esté seguro de cuántas veces desea que se ejecute el cuerpo del bucle.
--Instrucción ...BREAK; ...se usa cuando se desea salir de un bucle WHILE y ejecutar las siguientes instrucciones 
--después de la instrucción END del bucle.
--Utilice la instrucción BREAK para finalizar un BUCLE WHILE antes de tiempo.
--la instrucción ...CONTINUE; ...se usa cuando se desea que un bucle WHILE se ejecute de nuevo.
--Ignorará cualquier declaración después de la instrucción CONTINUE


--Declaramos la variable que controlará las repeticiones del bucle
declare @N INT=0
--Aplicamos la estructura iterativa
while (@N<100)
begin
     --Aumentamos el valor de N para iniciar en 1
     --y evaluarlo en la próxima iteración
     set @N=@N+1
     --Evaluamos que sólo se imprima el valor de N cuando es par, es decir su residuo es cero.
if (@N % 2 =0)
          Print 'Valor N: ' + convert(char(3),@N)
end

