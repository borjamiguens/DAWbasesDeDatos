#------------------------------------------------------------------------------------------------------
#  1. Creación de la Base de Datos llamada EmpleadosEmpresa
#------------------------------------------------------------------------------------------------------
DROP DATABASE  IF EXISTS EmpleadosEmpresa;
CREATE DATABASE EmpleadosEmpresa;
#------------------------------------------------------------------------------------------------------
#  2. Selecciona la base de datos recién creada para ser utilizada.
#------------------------------------------------------------------------------------------------------
USE EmpleadosEmpresa;

#------------------------------------------------------------------------------------------------------
#  3. Crea un tabla llamada Empleados con los siguientes campos:
#		ID como un entero de 11 dígitos, autoincremental y llave primaria
#		Nombre como cadena de 30 caracteres
#		Apellidos como cadena de3 50 caracteres
#------------------------------------------------------------------------------------------------------

CREATE TABLE Empleados
( 	
	Id int						primary key 	auto_increment, 		
	nombre varchar(30),		
	apellidos varchar(50)
    
);