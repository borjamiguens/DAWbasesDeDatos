#------------------------------------------------------------------------------------------------------
#  1. Creación de la Base de Datos
#------------------------------------------------------------------------------------------------------
DROP database if exists EmpleadosEmpresa ;
CREATE database EmpleadosEmpresa;
USE EmpleadosEmpresa;

#------------------------------------------------------------------------------------------------------
#  2. Creación de las tablas
#------------------------------------------------------------------------------------------------------
create table Empleado (
Id int,
DNI varchar (9),
Nombre varchar (30),
Salario int,
Telefono varchar (20),
IdDep int
);

create table Jefe (
Id int,
DNI varchar (9),
Nombre varchar (30),
Salario int,
Telefono varchar (20),
IdDep int
);

create table Departamento (
Id int,
Nombre varchar (30),
Ubicación varchar (50)
);
#------------------------------------------------------------------------------------------------------
#  3. Creación de claves pimarias
#------------------------------------------------------------------------------------------------------
alter table Empleado 
	add constraint Empleado_clave_primaria primary key (Id);
alter table Jefe
	add constraint Jefe_clave_primaria primary key (Id);
alter table Departamento
	add constraint Departamento_clave_primaria primary key (Id);
#------------------------------------------------------------------------------------------------------
#  4. Creación de claves foráneas
#------------------------------------------------------------------------------------------------------
alter table Empleado 
	add constraint Empleado_Departamento foreign key (IdDep) references Departamento(Id);
alter table Jefe
	add constraint Jefe_Departamento foreign key (IdDep) references Departamento(Id);
#------------------------------------------------------------------------------------------------------
#  5. Modificación de campos únicos
#------------------------------------------------------------------------------------------------------
#alter table Empleado change DNI DNI varchar (9) unique; #en change hay que poner nombre antiguo nombre nuevo
#alter table Empleado add unique (DNI);
alter table Empleado modify DNI varchar (9) unique;
alter table Jefe modify DNI varchar (9) unique,
				 modify IdDep int unique;


#------------------------------------------------------------------------------------------------------
#  6. Modificación de los nombres de la tabla Empleado:
#------------------------------------------------------------------------------------------------------
#	Id 	-> idEmpleado
#	DNI	-> NIFEmpleado
#	Nombre	-> NombreEmpleado
#	Teléfono-> tfEmpleado
#	IdDep	-> idDepartamento
#------------------------------------------------------------------------------------------------------
alter table Empleado
	rename column Id to idEmpleado,
    rename column DNI to NIFEmpleado,
    rename column Nombre to NombreEmpleado,
    rename column Telefono to tfEmpleado,
    rename column IdDep to idDepartamento;
    
alter table Empleado rename Empleados; #rename to opcional
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
describe Empleado;