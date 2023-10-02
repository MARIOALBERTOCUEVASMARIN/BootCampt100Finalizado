TEMA SQL SERVER

SUBTEMA CREACION DE BASE DE DATOS

CREAR LA BASE DE DATOS EJERCICIOSTICH USANDO LA INSTRUCCION DDL ( COMANDOS )
-----------------------------------------------------------------------------------------------------------------------
create database EjerciciosTich 

use EjerciciosTich 
----------------------------------------------------------------------------------------------------------------------
CREAR LAS SIGUIENTES TABLAS DE FORMA GRAFICA 

PASO 1 DAR CLICK EN LA BASE DE DATOS 
PASO 2 DAR CLICK DERECHO EN EL FOLDER TABLAS
PASO 3 DAR CLICK EN "NUEVO" DAR CLICK EN "TABLA"
PASO 4 SE PONEN LOS CAMPOS DESEADOS Y EL TIPO DE DATOS Y SI QUIERES QUE SEA NULL O NO NULL

CREAR LAS TABLAS CON CODIGO

use EjerciciosTich 

create table CursosInstructores(
id int identity(1,1) primary key,
idCurso smallint not null,
idInstructor int not null,
fechaContratacion date )


create table AlumnosBaja(
id int identity(1,1) primary key,
nombre varchar (50) not null,
primerApellido varchar (50) not null,
segundoApellido varchar (50),
fechaBaja datetime
)

-----------------------------------------------------------------------------------------------------------------------

Crear 7 tablas por medio de codigo (DDL) y agregar sus relaciones con FOREIGN KEY

-----------------------------------------------------------------------------------------------------------------------
use InstitutoTich

create table Estados(
id int primary key,
nombre varchar (50)

)

create table EstatusAlumnos (
id smallint primary key,
Clave char (10) not null,
Nombre varchar (100) not null

)

create table CatCursos (
id smallint primary key identity(1,1),
clave varchar (15) not null,
nombre varchar (50) not null,
descripcion varchar (1000),
horas tinyint not null,
idPreRequisito smallint,
activo bit

)


create table Cursos(
id smallint primary key identity (1,1),
idCatCurso smallint,
fechaInicio date,
fechaTermino date,
activo bit,
foreign key (idCatCurso) references CatCursos (id)
)


create table Alumnos(
id int primary key identity (1,1),
nombre varchar (60) not null,
primerApellido varchar (50) not null,
segundoApellido varchar (50),
correo varchar (80) not null,
telefono nchar (10) not null,
fechaNacimiento date not null,
curp char (18) not null,
sueldo decimal (9,2),
idEstadoOrigen int not null,
idEstatus smallint not null,
foreign key (idEstadoOrigen) references Estados(id),
foreign key (idEstatus) references EstatusAlumnos (id)
)

create table instructores (
id int primary key identity (1,1),
nombre varchar (60) not null,
primerApellido varchar (50) not null,
segundoApellido varchar (50),
correo varchar (80) not null,
telefono nchar (10) not null,
fechaNacimiento date not null,
rfc char (13) not null,
curp char (18) not null,
cuotaHora decimal (9,2) not null,
activo bit not null
)

create table CursosAlumnos (
id int identity(1,1) primary key,
idCurso smallint not null,
idAlumno int not null,
fechaInscripcion date not null,
fechaBaja date,
calificacion tinyint,
foreign key (idCurso) references Cursos (id),
foreign key (idAlumno) references Alumnos (id)
)


alter table CursosInstructores add constraint FK_cursos_Instructores
foreign key (idInstructor) references instructores (id) 


alter table CursosInstructores add constraint FK_cursos_Cursos
foreign key (idCurso) references Cursos (id) 

-----------------------------------------------------------------------------------------------------------------------

CHECAR QUE EL DIAGRAMA ENTIDADA RELACION QUEDARA COMO EL EJEMPLO (IMAGEN DEL FOLDER)

-----------------------------------------------------------------------------------------------------------------------
E_21 AGREGAR REGISTROS 
REALIZAREMOS LA PRACTICA QUE DEJO EL PROFESOR 


Agregar los registros a la Tabla de Estados proporcionados en el script 
correspondiente


USE InstitutoTich

SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([id], [nombre]) VALUES (1, N'Aguascalientes')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (2, N'Baja California')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (3, N'Baja California Sur')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (4, N'Campeche')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (5, N'Chihuahua')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (6, N'Chiapas')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (7, N'Coahuila')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (8, N'Colima')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (9, N'Durango')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (10, N'Guanajuato')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (11, N'Guerrero')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (12, N'Hidalgo')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (13, N'Jalisco')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (14, N'México')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (15, N'Michoacán')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (16, N'Morelos')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (17, N'Nayarit')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (18, N'Nuevo León')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (19, N'Oaxaca')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (20, N'Puebla')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (21, N'Querétaro')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (22, N'Quintana Roo')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (23, N'San Luis Potosí')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (24, N'Sinaloa')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (25, N'Sonora')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (26, N'Tabasco')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (27, N'Tamaulipas')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (28, N'Tlaxcala')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (29, N'Veracruz')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (30, N'Yucatán')
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (31, N'Zacatecas')

SET IDENTITY_INSERT [dbo].[Estados] OFF



Agregar los registros a la Tabla de EstatusAlumno proporcionados en el script 
correspondiente

USE InstitutoTich
SET IDENTITY_INSERT [dbo].[EstatusAlumnos] ON 
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (1, N'PTO       ', N'Prospecto')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (2, N'PRO       ', N'En curso propedéutico')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (3, N'CAP       ', N'En capacitación')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (4, N'INC       ', N'En Incursión')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (5, N'LAB       ', N'Laborando')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (6, N'LIB       ', N'Liberado')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (7, N'NI        ', N'No le interesó')
INSERT [dbo].[EstatusAlumnos] ([id], [Clave], [Nombre]) VALUES (8, N'BA        ', N'Baja')

SET IDENTITY_INSERT [dbo].[EstatusAlumnos] OFF 


Agregar al menos cuatro registros a la Tabla de CatCursos donde dos de ellos 
deberán tener como prerrequisito otro curso de esta misma tabla

USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[CatCursos] ON 

insert into CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito,activo)
values (1,'mate1', 'Matematicas', 'se les enseñara  las y los alumnos a sabber sumar, restar, multiplicar y dividir',40,null,1);
insert into CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito,activo)
values (2, 'mate2', 'Matematicas 2', 'se les enseñara  las y los alumnos a sabber funciones aritmeticas',40,1,1);
 insert into CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito,activo)
values (3, 'mate3', 'Matematicas 3', 'se les enseñara  las y los alumnos a sabber funciones de perimr y segundo grado',40,2,1);
insert into CatCursos (id, clave, nombre, descripcion, horas, idPreRequisito,activo)
values (4, 'mate4', 'Matematicas 4', 'se les enseñara  lasy los alumnos a sabber funciones de tercer grado',40,3,0);

SET IDENTITY_INSERT [dbo].[CatCursos] OFF

GO



Agregar al menos seis registros a la Tabla de Cursos, donde se deberá referenciar a 
todos los registros que están en CatCursos

USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 


insert into Cursos(id,idCatCurso, fechaInicio, fechaTermino,activo)
values (2, 1, CAST(N'2023-10-01' AS Date),CAST(N'2024-11-30' AS Date),1)
insert into Cursos(id,idCatCurso, fechaInicio, fechaTermino,activo)
values (3, 4, CAST(N'2024-04-01' AS Date),CAST(N'2024-06-30' AS Date),0)
insert into Cursos(id,idCatCurso, fechaInicio, fechaTermino,activo)
values (4, 3, CAST(N'2024-02-01' AS Date),CAST(N'2024-03-30' AS Date),1)
insert into Cursos(id,idCatCurso, fechaInicio, fechaTermino,activo)
values (5, 2, CAST(N'2025-12-01' AS Date),CAST(N'2024-01-30' AS Date),1)
insert into Cursos(id,idCatCurso, fechaInicio, fechaTermino,activo)
values (6, 2, CAST(N'2025-10-01' AS Date),CAST(N'2024-11-30' AS Date),1)
SET IDENTITY_INSERT [dbo].[Cursos] OFF

GO



 Agregar dos registros en la tabla Alumnos, por cada uno de los cursos que se 
encuentren en la Cursos

USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (30,'Mario', 'Cuevas', 'Marin', '1230@gmail.com',1212121212, CAST(N'1999-11-30' AS Date), 'cumm990419hdfvrr04',10000,15, 3)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (19,'Miguel', 'Perez', 'Juarez', '456@gmail.com',1313131313, CAST(N'1998-10-10' AS Date), 'jjjj990419hdfvrr04',20000,1, 8)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (20,'Alejandra', 'Cuevas', 'Marin', '000@gmail.com',141141414, CAST(N'1987-05-30' AS Date), 'mmmm990419hdfvrr04',30000,16, 7)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (21,'Gerardo', 'Cuevas', 'Marin', 'aaaa@gmail.com',1555515151, CAST(N'2007-11-30' AS Date), 'pppp990419hdfvrr04',10000,18, 6)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (22,'Karen', 'Flores', 'Merchant', 'bbbb@gmail.com',1616161616, CAST(N'1980-02-02' AS Date), 'llll990419hdfvrr04',10000,4, 7)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (23,'Angel', 'Contreras', 'Martin', 'cccccc@gmail.com',1717171717, CAST(N'1999-04-30' AS Date), 'hhhh990419hdfvrr04',20000,4, 6)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (24,'Jose', 'Figueroa', 'Marin', '789@gmail.com',1818181818, CAST(N'2010-12-31' AS Date), 'iuuu990419hdfvrr04',10000,6, 5)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (25,'Mariana', 'Alvarez', 'Ramirez', '852@gmail.com',191919919, CAST(N'1988-03-22' AS Date), 'yyyy990419hdfvrr04',10000,6, 5)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (26,'Juan', 'Consuelo', 'Mar', '7410@gmail.com',2020202020, CAST(N'1995-01-02' AS Date), 'cumm990419hdfvrr04',30000,3, 4)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (27,'Alexander', 'Cabello', 'Mercurio', '963@gmail.com',2221212121, CAST(N'1992-07-26' AS Date), 'cumm990419hdfvrr04',30000,14, 3)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (28,'Fabritzio', 'Cervantes', 'Miranda', '159@gmail.com',2323232323, CAST(N'1998-01-01' AS Date), 'cumm990419hdfvrr04',10000,7, 3)
insert into Alumnos(id,nombre,primerApellido, segundoApellido,correo, telefono, fechaNacimiento, curp, sueldo, idEstadoOrigen, idEstatus)
values (29,'Leonardo', 'Morfin', 'Marron', '1230@gmail.com',1212121212, CAST(N'1998-01-01' AS Date), 'cumm990419hdfvrr04',10000,4, 1)

SET IDENTITY_INSERT [dbo].[Alumnos] OFF

GO



 Agregar al menos cuatro registros en la tabla Instructores

 INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (1, N'Oscar', N'López', N'Osorio', N'olopez@ti-capitalhumano.com', N'7226181450', CAST(N'1984-08-03' AS Date), N'LOOO840803S08', N'LOOO840803HMCPSS08', CAST(110.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (2, N'Jorge', N'Valdivia', N'Rosas', N'jvaldivia@ti-capitalhumano.com', N'5561040510', CAST(N'1964-01-26' AS Date), N'VARJ640126R00', N'VARJ640126HDFLSR00', CAST(100.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (3, N'Luis', N'Vázquez', N'Cuj', N'luisvazquez@ti-capitalhumano.com', N'5540612941', CAST(N'1974-10-11' AS Date), N'VACL741011JS5', N'VACL741011HTCZJS05', CAST(80.00 AS Decimal(9, 2)), 1)
INSERT [dbo].[Instructores] ([id], [nombre], [primerApellido], [segundoApellido], [correo], [telefono], [fechaNacimiento], [rfc], [curp], [cuotaHora], [activo]) VALUES (4, N'José', N'Morales', N'Narváez', N'jose.morales@ti-capitalhumano.com', N'5511506288', CAST(N'1984-12-31' AS Date), N'MONM941231N07', N'MONM941231HCCRRN07', CAST(70.00 AS Decimal(9, 2)), 1)
SET IDENTITY_INSERT [dbo].[Instructores] OFF
GO


 Agregar los registros necesarios a la Tabla CursosAlumnos para cumplir con lo 
indicado en el punto 5 de estos ejercicios.

USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[CursosAlumnos] ON 

insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (1,1,29, CAST(N'2023-11-30' AS Date),null,10 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (2,1,17, CAST(N'2023-11-30' AS Date),null,9 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (3,2,18, CAST(N'2023-11-30' AS Date),null,5 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (4,2,30, CAST(N'2023-10-20' AS Date),null,8 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (5,3,7, CAST(N'2023-10-01' AS Date),null,7 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (6,3,1, CAST(N'2023-11-22' AS Date),null,7 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (7,4,15, CAST(N'2023-11-21' AS Date),null,8 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (8,4,16, CAST(N'2023-11-01' AS Date),null,9 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (9,5,17, CAST(N'2023-10-03' AS Date),null,10 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (10,5,22, null,null,10 )
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (11,6,20, null,null,6)
insert into CursosAlumnos(id,idCurso, idAlumno, fechaInscripcion, fechaBaja, calificacion)
values (12,6,2, CAST(N'2023-11-30' AS Date),null,5)

SET IDENTITY_INSERT [dbo].[Alumnos] OFF

GO



Agregar los registros necesarios a la Tabla CursosInstructores para que cada curso 
haya sido impartido por al menos 2 instructores



USE [InstitutoTich]
GO
SET IDENTITY_INSERT [dbo].[CursosInstructores] ON 

insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (1, 1, 1, '2023-09-01')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (2, 2, 1, '2023-09-01')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (3, 3, 2, '2023-10-15')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (4, 4, 2, '2023-10-15')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (5, 5, 3, '2023-10-03')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (6, 6, 3, '2023-10-03')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (7, 1, 4, '2023-09-19')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (8, 1, 4, '2023-09-19')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (9, 1, 1, '2023-09-20')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (10, 6, 1, '2023-09-20')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (11, 5, 4, '2023-09-19')
insert into CursosInstructores (id, idCurso, idInstructor, fechaContratacion)
values (12, 1, 2, '2023-10-15')

SET IDENTITY_INSERT [dbo].[cursosInstructores] OFF

GO



-----------------------------------------------------------------------------------------------------------------------

CREA LA TABLA ISR E INSERTA LOS DATOS 

SET IDENTITY_INSERT [dbo].[TablaISR] ON 

INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (1, CAST(0.01 AS Decimal(19, 2)), CAST(285.45 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)), CAST(1.92 AS Decimal(19, 2)), CAST(200.85 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (2, CAST(285.46 AS Decimal(19, 2)), CAST(872.85 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.85 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (3, CAST(872.86 AS Decimal(19, 2)), CAST(1309.20 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (4, CAST(1309.21 AS Decimal(19, 2)), CAST(1713.60 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(200.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (5, CAST(1713.61 AS Decimal(19, 2)), CAST(1745.70 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(193.80 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (6, CAST(1745.71 AS Decimal(19, 2)), CAST(2193.75 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(188.70 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (7, CAST(2193.76 AS Decimal(19, 2)), CAST(2327.55 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(174.75 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (8, CAST(2327.56 AS Decimal(19, 2)), CAST(2422.80 AS Decimal(19, 2)), CAST(5.55 AS Decimal(19, 2)), CAST(6.40 AS Decimal(19, 2)), CAST(160.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (9, CAST(2422.81 AS Decimal(19, 2)), CAST(2632.65 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(160.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (10, CAST(2632.66 AS Decimal(19, 2)), CAST(3071.40 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(145.35 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (11, CAST(3071.41 AS Decimal(19, 2)), CAST(3510.15 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(125.10 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (12, CAST(3510.16 AS Decimal(19, 2)), CAST(3642.60 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(107.40 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (13, CAST(3642.61 AS Decimal(19, 2)), CAST(4257.90 AS Decimal(19, 2)), CAST(142.20 AS Decimal(19, 2)), CAST(10.88 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (14, CAST(4257.91 AS Decimal(19, 2)), CAST(4949.55 AS Decimal(19, 2)), CAST(341.85 AS Decimal(19, 2)), CAST(16.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (15, CAST(4949.56 AS Decimal(19, 2)), CAST(5925.90 AS Decimal(19, 2)), CAST(452.55 AS Decimal(19, 2)), CAST(17.92 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (16, CAST(5925.91 AS Decimal(19, 2)), CAST(11951.85 AS Decimal(19, 2)), CAST(627.60 AS Decimal(19, 2)), CAST(21.36 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (17, CAST(11951.86 AS Decimal(19, 2)), CAST(18837.75 AS Decimal(19, 2)), CAST(1914.75 AS Decimal(19, 2)), CAST(23.52 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (18, CAST(18837.76 AS Decimal(19, 2)), CAST(35964.30 AS Decimal(19, 2)), CAST(3534.30 AS Decimal(19, 2)), CAST(30.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (19, CAST(35964.31 AS Decimal(19, 2)), CAST(47952.30 AS Decimal(19, 2)), CAST(8672.25 AS Decimal(19, 2)), CAST(32.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (20, CAST(47952.31 AS Decimal(19, 2)), CAST(143856.90 AS Decimal(19, 2)), CAST(12508.35 AS Decimal(19, 2)), CAST(34.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
INSERT [dbo].[TablaISR] ([id], [LimInf], [LimSup], [CuotaFija], [ExedLimInf], [Subsidio]) VALUES (21, CAST(143856.91 AS Decimal(19, 2)), CAST(99999999.00 AS Decimal(19, 2)), CAST(45115.95 AS Decimal(19, 2)), CAST(35.00 AS Decimal(19, 2)), CAST(0.00 AS Decimal(19, 2)))
SET IDENTITY_INSERT [dbo].[TablaISR] OFF
GO





