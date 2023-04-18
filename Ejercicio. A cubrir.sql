#------------------------------------------------------------------------------------------------------
#  1. Creación de la Base de Datos
#------------------------------------------------------------------------------------------------------
DROP DATABASE  IF EXISTS Empresa;
CREATE DATABASE Empresa;
USE Empresa;

#------------------------------------------------------------------------------------------------------
#  2. Creación de las tablas
#------------------------------------------------------------------------------------------------------

CREATE TABLE Departamento
( 	idDep int  		,
	nombre varchar(50) ,
    ubicacion varchar(30) 		  
	
    
);

CREATE TABLE Empleado
( 	idEmpleado int,
	dni varchar(30),
	nombre varchar(50),
    salario int,
	telefono varchar(50),
    idDep int 		
	
    
);

CREATE TABLE Jefe
( 	idJefe int,
	dni varchar(30),
	nombre varchar(50),
    salario int,
	telefono varchar(50),
    idDep int 		
	
    
);


#------------------------------------------------------------------------------------------------------
#  3. Creación de claves pimarias
#------------------------------------------------------------------------------------------------------
alter table Departamento	ADD PRIMARY KEY (idDep);
alter table Empleado		ADD PRIMARY KEY (idEmpleado);
alter table Jefe			ADD PRIMARY KEY (idJefe);


#------------------------------------------------------------------------------------------------------
#  4. Creación de claves foráneas
#------------------------------------------------------------------------------------------------------
alter table Empleado	ADD FOREIGN KEY (idDep)	REFERENCES Departamento(idDep);
alter table Jefe		ADD FOREIGN KEY (idDep)	REFERENCES Departamento(idDep);

#------------------------------------------------------------------------------------------------------
#  5. Modificación de campos únicos
#------------------------------------------------------------------------------------------------------
alter table departamento		MODIFY nombre			varchar (50) NOT NULL;
alter table departamento		MODIFY ubicacion		varchar (30) NOT NULL;

alter table Empleado			MODIFY DNI				varchar (30) NOT NULL UNIQUE;
alter table Empleado			MODIFY nombre			varchar (50) NOT NULL;
alter table Empleado			MODIFY salario			int NOT NULL;
alter table Empleado			MODIFY Telefono			varchar (50) NOT NULL;
alter table Empleado			MODIFY idDep			int NOT NULL;


alter table Jefe			MODIFY DNI					varchar (30) NOT NULL UNIQUE;
alter table Jefe			MODIFY nombre				varchar (50) NOT NULL;
alter table Jefe			MODIFY salario				int NOT NULL;
alter table Jefe			MODIFY Telefono				varchar (50) NOT NULL;
alter table Jefe			MODIFY idDep				int NOT NULL;


#------------------------------------------------------------------------------------------------------
#  6. Modificación de los nombres de la tabla Empleado:
#------------------------------------------------------------------------------------------------------
#	Id 	-> idEmpleado
#	DNI	-> NIFEmpleado
#	Nombre	-> NombreEmpleado
#	Teléfono-> tfEmpleado
#	IdDep	-> idDepartamento


#------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------
#  7. Modificación de los nombres de la tabla Departamento:
#------------------------------------------------------------------------------------------------------
#	Id 	-> idDepartamento
#	Nombre	-> NombreDepartamento
#------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------
#  8. Modificación de los nombres de la tabla Jefe:
#------------------------------------------------------------------------------------------------------
#	Id 	-> idJefe
#	Nombre	-> NombreJefe
#	IdDep	-> idDepartamento
#------------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------------
#  9. Muestra la descripción de las tres tablas.
#------------------------------------------------------------------------------------------------------
INSERT INTO Departamento( idDep, nombre , ubicacion ) VALUES ( "1", "Informática", "Vigo" );
INSERT INTO Empleado( idEmpleado, DNI, nombre , salario, telefono, idDep ) VALUES ( "1","53480000j","Borja", "1000", "546789555", "1" );
INSERT INTO Jefe( idJefe, DNI, nombre , salario, telefono, idDep ) VALUES ("1","5376500j","Sancho", "3000", "548888855", "1" );
select * from Departamento;
select * from Empleado;
select * from Jefe;
