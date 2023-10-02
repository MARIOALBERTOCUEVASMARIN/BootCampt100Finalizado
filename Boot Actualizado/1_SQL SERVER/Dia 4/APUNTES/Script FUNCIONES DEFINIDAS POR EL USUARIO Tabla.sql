-----------------------------------SUBTEMA: FUNCIONES DEFINIDAS POR EL USUARIO------------------------------------------

-----------------------------------------FUNCIONES CON VALORES DE TABLA-------------------------------------------
--Funciones con valores de tabla: la función que devuelve varios registros como un tipo de datos de tabla se denomina 
--función con valores de tabla.
/*
create function <nombreFuncion>
 (
 <Parametro><TipodeDato>,…n
 )
 returns @NombreTablaRetorno table-- nombre de la tabla
 --formato de la tabla
 (
  <Campo1><TipodeDato>,
  <Campo2><TipodeDato>,
  <Campo3><TipodeDato>
 )
 as
 begin
   insert @NombreTablaRetorno
    select @ValorCampo1, @ValorCampo2, @ValorCampo3 
   RETURN
 end
 */


CREATE OR ALTER FUNCTION listaAlumnosPorCurso 
(
@idCurso int
)
RETURNS @tablaAlumnos TABLE
(
       # SMALLINT identity(1,1),
       Nombre VARCHAR(50),
       Cal TINYINT,
	   [NombreCurso] VARCHAR(50)
)
AS
BEGIN
       INSERT INTO @tablaAlumnos
             SELECT Concat(alu.nombre,'',alu.primerApellido,'',alu.segundoApellido),curAlu.calificacion,CC.Nombre
                    FROM Alumnos alu
                    INNER JOIN CursosAlumnos curAlu ON curAlu.idAlumno=alu.id
					INNER JOIN Cursos Cur ON Cur.id= curAlu.idCurso
					INNER JOIN CatCursos CC ON CC.id = Cur.idCatCurso
					WHERE Cur.id= @idCurso
       RETURN
END
GO

SELECT * FROM listaAlumnosPorCurso(1)

Drop FUNCTION listaAlumnosPorCurso;
