#------------------------------------------------------------------------------------------------------
#  1. Creación de la Base de Datos llamada PersonasCoches
#------------------------------------------------------------------------------------------------------
DROP DATABASE  IF EXISTS PersonasCoches;
CREATE DATABASE PersonasCoches;
#------------------------------------------------------------------------------------------------------
#  2. Selecciona la base de datos recién creada para ser utilizada.
#------------------------------------------------------------------------------------------------------
USE PersonasCoches;
#------------------------------------------------------------------------------------------------------
#  3. Crea un tabla llamada Persona con los siguientes campos:
#		NIF como cadena de 9 caracteres
#		Nombre como cadena de 30 caracteres
#		Apellido como cadena de 50 caracteres
#------------------------------------------------------------------------------------------------------
CREATE TABLE Persona
( 	
	NIF 		varchar(9), 		
	Nombre 		varchar(30),		
	Apellido 	varchar(50)
    
);
#------------------------------------------------------------------------------------------------------
#  4. Crea otra tabla llamada Coche con los siguientes campos:
#		Matrícula como cadena de 9 caracteres
#		Model como cadena de 20 caracteres
#		Tipo como cadena de 20 caracteres
#------------------------------------------------------------------------------------------------------
CREATE TABLE Coche
( 	
	Matricula 	varchar(9), 		
	Model 		varchar(20),		
	Tipo 		varchar(20)
    
);
#------------------------------------------------------------------------------------------------------
#  5. Muestra la codificación de sendas tablas
#------------------------------------------------------------------------------------------------------
describe Persona;
describe Coche;
#------------------------------------------------------------------------------------------------------
#  6. En la tabla Persona, asigna el NIF como clave primaria
#------------------------------------------------------------------------------------------------------
alter table Persona	ADD PRIMARY KEY (NIF);
#------------------------------------------------------------------------------------------------------
#  7. En la tabla Coche, asigna Matrícula como clave primaria
#------------------------------------------------------------------------------------------------------
alter table Coche	ADD PRIMARY KEY (Matricula);
#------------------------------------------------------------------------------------------------------
#  8. En la tabla Persona, cambia el campo Apellido por Apellidos
#------------------------------------------------------------------------------------------------------
alter table Persona		RENAME COLUMN Apellido	 TO Apellidos; 	#renombrar un atributo con rename
#------------------------------------------------------------------------------------------------------
#  9. En la tabla Coche, cambia el campo Model por Modelo
#------------------------------------------------------------------------------------------------------
alter table Coche		CHANGE COLUMN Model 	Modelo varchar(20); 		#renombrar un atributo con change
																			#habría que meter todo lo que lleve Modelo arriba
																			#es un coñazo
#------------------------------------------------------------------------------------------------------
#  10. En la tabla Persona, crea un campo Vehículo que sea clave foránea de la clave Matrícula de la tabla Coche
#------------------------------------------------------------------------------------------------------
alter table Persona ADD COLUMN Vehiculo varchar(9);
#la clave foranea nos implica que tenga la misma estructura
alter table Persona ADD CONSTRAINT clave_foranea_Coche
	FOREIGN KEY (Vehiculo) REFERENCES Coche(Matricula);
describe Persona;
#------------------------------------------------------------------------------------------------------
#  11. En la tabla Coche, crea un campo Propietario que sea clave foránea de la clave NIF de la tabla Persona
#------------------------------------------------------------------------------------------------------
alter table Coche ADD COLUMN Propietario varchar(9);
alter table Coche ADD CONSTRAINT clave_foranea_Persona #por defecto sería Coche_ibfk_1
	FOREIGN KEY (Propietario) REFERENCES Persona(NIF);
describe Coche;
#probamos a ver si puedo borrar el NIF

#probamos a ver si puedo borrar la clave foranea
alter table Coche drop foreign key clave_foranea_Persona;
alter table Coche drop Propietario;
#------------------------------------------------------------------------------------------------------
#  12. En la tabla Persona, agrega la restricción de que el campo Nombre no pueda ser nulo
#------------------------------------------------------------------------------------------------------
alter table Persona MODIFY Nombre varchar(30) NOT NULL;
#------------------------------------------------------------------------------------------------------
#  13. En la tabla Coche, agrega la restricción de que el campo Tipo no pueda ser nulo
#------------------------------------------------------------------------------------------------------
alter table Coche MODIFY Tipo varchar(20) NOT NULL;
#------------------------------------------------------------------------------------------------------
#  14. Borramos el campo apellido de Persona
#------------------------------------------------------------------------------------------------------
alter table Persona DROP Apellidos; #borramos el campo apellidos
#------------------------------------------------------------------------------------------------------
#  15. Borramos el campo vehículo
#------------------------------------------------------------------------------------------------------
# alter table Persona drop Vehiculo; #no puedo borrar la columna por ser necesaria como clave foranea
#tendría que modificar la clave foranea antes
#alter table Persona drop foreign key persona_ibfk_1;#esto es el contraint que pone por defecto
													#mysql de forma autoincremental inicialmente
alter table Persona drop foreign key clave_foranea_Coche; #he nombrado el constraint de esta forma
alter table Persona drop Vehiculo;

#vamos a borrar la clave primaria de Persona, el NIF


alter table Persona DROP PRIMARY KEY;#como sola va a haber un clave primaria no tengo que especificar el nombre
#alter table Persona DROP FOREIGN KEY clava_foranea_Persona; #error esta clave foranea está en coche, no en persona
alter table Coche DROP FOREIGN KEY clave_foranea_Persona;
alter table Persona DROP NIF;

#Ahora borramos el atributo Propietario, que es la clave foranea

alter table Coche drop Propietario;


#------------------------------------------------------------------------------------------------------
#  16. Muesta la definición de las tablas Persona y Coche.
#------------------------------------------------------------------------------------------------------
describe Persona;
describe Coche;