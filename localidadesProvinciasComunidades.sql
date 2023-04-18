#------------------------------------------------------------------------------------------------------
#  1. Creación de la Base de Datos
#------------------------------------------------------------------------------------------------------
DROP database if exists Pais;
CREATE database Pais;
USE Pais;
#------------------------------------------------------------------------------------------------------
#  2. Creación de las tablas
#------------------------------------------------------------------------------------------------------
Create table Localidades(
	id_localidad int,
    nombre varchar (50),
    poblacion int,
    n_provincia int
);

Create table Provincias(
	n_provincia int,
    nombre varchar (25),
    superficie int,
    id_capital int,
    id_comunidad int
);

Create table Comunidades(
	id_comunidad int,
    nombre varchar (25),
    id_capital int,
    max_provincias int
);

#------------------------------------------------------------------------------------------------------
#  3. Creación de claves pimarias
#------------------------------------------------------------------------------------------------------
alter table Localidades add constraint Localidad_clave_primaria primary key (id_localidad);
alter table Provincias add constraint Provincia_clave_primaria primary key (n_provincia);
alter table Comunidades add constraint Comunidad_clave_primaria primary key (id_comunidad);

#------------------------------------------------------------------------------------------------------
#  4. Creación de claves foráneas
#------------------------------------------------------------------------------------------------------
alter table Localidades 
	add constraint Localidad_Provincia foreign key (n_provincia) references Provincias(n_provincia);
alter table Provincias 
	add constraint Capital_Provincia foreign key (id_capital) references Localidades(id_localidad),
	add constraint Provincia_comunidad foreign key (id_comunidad) references Comunidades(id_comunidad);
alter table Comunidades 
	add constraint Capital_comunidad foreign key (id_capital) references Localidades(id_localidad);

#------------------------------------------------------------------------------------------------------
#  5. Modificación de campos únicos
#------------------------------------------------------------------------------------------------------
alter table Provincias modify Nombre varchar (25) unique,
	modify id_capital int unique;
alter table Comunidades modify Nombre varchar (25) unique;

#------------------------------------------------------------------------------------------------------
#  6. Modificación de campos no nulos
#------------------------------------------------------------------------------------------------------
alter table Localidades modify Nombre varchar (50) not null,
	modify n_provincia int not null;
    
alter table Provincias modify Nombre varchar (50) not null,
	modify id_capital int not null,
	modify id_comunidad int not null;
    
alter table Comunidades modify Nombre varchar (50) not null,
	modify id_capital int not null;

#------------------------------------------------------------------------------------------------------
#  7. Renombra n_provincia por numero_provincia
#------------------------------------------------------------------------------------------------------
alter table Localidades rename column n_provincia to numero_provincia;
alter table Provincias rename column n_provincia to numero_provincia;

#------------------------------------------------------------------------------------------------------
#  8. Renombra nombre por nombreLocalidad, nombreProvincia y nombreComunidad
#------------------------------------------------------------------------------------------------------
alter table Localidades rename column nombre to nombreLocalidad;
alter table Provincias rename column nombre to nombreProvincia;
alter table Comunidades rename column nombre to nombreComunidades;

#------------------------------------------------------------------------------------------------------
#  9. Renombra id_capital por capitalProvincia y capitalComunidad
#------------------------------------------------------------------------------------------------------
alter table Provincias rename column id_capital to capitalProvincia;
alter table Comunidades rename column id_capital to capitalComunidad;

#------------------------------------------------------------------------------------------------------
# 10. Muestra la descripción de las tres tablas.
#------------------------------------------------------------------------------------------------------
describe Localidades;
describe Provincias;
describe Comunidades;