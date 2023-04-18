#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'empleadoDepartamento'
#--------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS empleadoDepartamento;
CREATE DATABASE empleadoDepartamento;
USE empleadoDepartamento;
#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Departamento'
#--------------------------------------------------------------------------------------------
#		codigo				entero, no nulo
#		nombre				cadena de texto 20, no nula
#		presupuesto			entero, no nulo
#		gastos				entero, no nulo
#
#		Clave primaria		codigo
#--------------------------------------------------------------------------------------------
CREATE TABLE Departamento(
	codigo 			int 		not null	primary key,
	nombre 			varchar(20) not null,
	presupuesto		int			not null,
	gastos			int 		not null
);
#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Empleado'
#--------------------------------------------------------------------------------------------
#		codEmpleado			entero, no nulo
#		NIF					cadena de texto 9, no nula
#		nombre				cadena de texto 20, no nula
#		apellido1			cadena de texto 20, no nula
#		apellido2			cadena de texto 20, por defecto nula
#		codigo				entero
#
#		Clave primaria		codEmpleado
#		Clave foránea		codigo		enlace con la tabla Departamento
#--------------------------------------------------------------------------------------------
CREATE TABLE Empleado(
	codEmpleado		int not null primary key,
    NIF				varchar(9) not null, 
    nombre			varchar(20) not null,
    apellido1 		varchar(20) not null,
    apellido2 		varchar(20) null,
    codigo			int
);
ALTER TABLE Empleado ADD CONSTRAINT claveForaneaEmpleado FOREIGN KEY (codigo) REFERENCES Departamento(codigo);
SHOW TABLES;
#--------------------------------------------------------------------------------------------
#	AGREGACIÓN DE DATOS
#--------------------------------------------------------------------------------------------
	INSERT INTO Departamento VALUES ( 1, 'Investigación', 120000, 6000 ),
								( 2, 'Desarrollo', 150000, 21000 ),
								( 3, 'Estudio', 50000, 29000 ),
                                ( 4, 'Recursos Humanos', 280000, 25000 );

	INSERT INTO Empleado VALUES ( 1, '23456789A', 'Fulgencio', 'Tormentoso', 'Peleón', 1 ),
							( 2, '12345678B', 'Fulgencia', 'Valiente', 'Cobarde', NULL ),
							( 3, '35463445C', 'Guillermino', 'Guerra', 'Paz', 2 ),
                            ( 4, '34547654D', 'Guillermina', 'Rica', 'Pobre', NULL );
                            
#--------------------------------------------------------------------------------------------
#	CONSULTAS
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado;
SELECT * FROM Departamento;

#--------------------------------------------------------------------------------------------
#  1. Composición cruzada (Producto Cartesiano)
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado, Departamento;
#--------------------------------------------------------------------------------------------
#  2. Composición cruzada (Producto Cartesiano) con CROSS JOIN
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado CROSS JOIN departamento;
	
#--------------------------------------------------------------------------------------------
#  3. Composición interna (Intersección)
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado, Departamento
	WHERE Empleado.codigo=Departamento.codigo;
#--------------------------------------------------------------------------------------------
#  4. Composición interna con INNER JOIN
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado INNER JOIN Departamento
	ON	Empleado.codigo=Departamento.codigo;
#--------------------------------------------------------------------------------------------
#  5. Composición interna con NATURAL JOIN
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado NATURAL JOIN Departamento;#como hay más de un campo común no hace nada
#--------------------------------------------------------------------------------------------
#  6. Composición externa con LEFT OUTER JOIN
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado LEFT OUTER JOIN Departamento
	ON Empleado.codigo=Departamento.codigo;
#--------------------------------------------------------------------------------------------
#  7. Composición externa con RIGHT OUTER JOIN
#--------------------------------------------------------------------------------------------
SELECT * FROM Departamento RIGHT OUTER JOIN Empleado
	ON Empleado.codigo=Departamento.codigo;
#--------------------------------------------------------------------------------------------
#  8. Composición externa con FULL OUTER JOIN
#--------------------------------------------------------------------------------------------
SELECT * FROM Empleado FULL JOIN Departamento;
#--------------------------------------------------------------------------------------------
#  9. Composición externa con NATURAL LEFT JOIN
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
# 10. Composición externa con NATURAL RIGHT JOIN
#--------------------------------------------------------------------------------------------

