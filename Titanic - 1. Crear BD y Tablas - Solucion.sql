#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'Titanic'
#--------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS Titanic;
CREATE DATABASE Titanic;
USE Titanic;

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'Passengers'
#--------------------------------------------------------------------------------------------
#		PassengerID			entero, no nulo
#		Survived			entero, no nulo
#		Pclass				entero, no nula
#		Name				cadena de texto, no nula
#		Sex					cadena de texto 10, no nula
#		Age					cadena de texto 4, no nula
#		SibSp				entero, no nulo					Sibilings / spouses (hermanos o cónyuges)
#		Parch				entero, no nulo
#		Ticket				cadena de texto, no nula
#		Fare				número decimal, no nulo
#		Cabin				cadena de texto 20, no nula
#		Embarked			cadena de texto 1, no nula
#
#		Clave primaria		PassengerID
#--------------------------------------------------------------------------------------------
CREATE TABLE Passengers(
	PassengerID INT NOT NULL,
    Survived 	INT NOT NULL,
    Pclass		INT NOT NULL,
    Name		TEXT NOT NULL,
    Sex			VARCHAR (10) NOT NULL,
    Age			VARCHAR (4) NOT NULL,
    SibSp		INT NOT NULL,
    Parch		INT NOT NULL,
    Ticket 		TEXT NOT NULL,
    Fare		DOUBLE NOT NULL,
    Cabin		VARCHAR (20) NOT NULL,
    Embarked 	VARCHAR (1) NOT NULL,
    PRIMARY KEY (PassengerID)    
);

SHOW CREATE TABLE Passengers;

#--------------------------------------------------------------------------------------------
#	CONVERSIÓN DE LA TABLA Passengers al formato de la tabla pasajerosTitanic,
#	recuerda cambiar también el tipo de los caracteres a Español.
#--------------------------------------------------------------------------------------------
#ALTER TABLE Passengers DROP PRIMARY KEY ;

ALTER TABLE Passengers RENAME pasajerosTitanic; 
ALTER TABLE pasajerosTitanic
	CHANGE  COLUMN PassengerID idPasajero INT NOT NULL, # PRIMARY KEY,
	CHANGE  COLUMN Survived Sobrevivió INT NOT NULL,
	CHANGE  COLUMN Pclass Clase INT NOT NULL,
	CHANGE  COLUMN Name Nombre TEXT NOT NULL,
	CHANGE  COLUMN Sex Sexo VARCHAR (10) NOT NULL,
	CHANGE  COLUMN Age Edad VARCHAR (4) NOT NULL,
	CHANGE  COLUMN SibSp Familiares INT NOT NULL,
	CHANGE  COLUMN Parch PadresHijos INT NOT NULL,
	CHANGE  COLUMN Ticket Ticket TEXT NOT NULL,
	CHANGE  COLUMN Fare Tarifa DOUBLE NOT NULL,
	CHANGE  COLUMN Cabin Cabina VARCHAR (20) NOT NULL,
	CHANGE  COLUMN Embarked Embarque VARCHAR (20) NOT NULL
    ;
    
#--------------------------------------------------------------------------------------------
# Muestra cómo ha quedado la configuración de la Base de Datos Titanic, finalmente
# ¿Has modificado la configuración de la base de datos a los caracteres españoles?
#--------------------------------------------------------------------------------------------
SHOW CREATE TABLE pasajerosTitanic;
#--------------------------------------------------------------------------------------------
# Muestra cómo ha quedado la configuración de la tabla PasajerosTitanic, finalmente
#--------------------------------------------------------------------------------------------
ALTER DATABASE 			Titanic
		CHARACTER SET	utf16				# SHOW COLLATION WHERE CHARSET = 'utf16';
		COLLATE			utf16_spanish2_ci;
        
SHOW CREATE TABLE pasajerosTitanic;

#--------------------------------------------------------------------------------------------
# ¿Cómo harías para comprobar la configuración final de los campos de la tabla PasajerosTitanic?
#--------------------------------------------------------------------------------------------
#pulsar en el icono toggle wrapping of cell contents o a la pestaña DDL correspondiente

