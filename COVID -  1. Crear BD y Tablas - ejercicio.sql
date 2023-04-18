#-------------------------------------------------------------------------------------
# CREACIÓN DE LA BASE DE DATOS
#-------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS DatosCovid;
CREATE DATABASE DatosCovid;
USE DatosCovid;
#-------------------------------------------------------------------------------------
# CREACIÓN DE LA TABLA "Covid"
#		prov_ISO			cadena de caracteres 2					# CÓDIGO ISO DE LA PROVINCIA
#		fecha				datos de tipo fecha						# FECHA DE LOS DATOS
#		casos				entero									# CASOS NOTIFICADOS CON PRUEBA DIANÓSTICA POSITIVA
#		prob_PCR			entero									# PRUEBA DE LABORATORIO PCR O TÉCNICAS MOLECULARES
#		prob_AnCps			entero									# PRUEBA DE LABORATORIO DE TEST RÁPIDO DE ANTICUERPOS
#		prob_Ant			entero									# PRUEBA DE LABORATORIO DE TEST DE DETECCIÓN DE ANTÍGENO
#		prob_El				entero									# PRUEBA DE LABORATORIO DE SEROLOGÍA DE ALTA RESOLUCIÓN
#		prob_desc			entero									# PRUEBAS DE LABOTARIO SIN CONFIRMAR
#		
#		clave primaria		Prov_ISO, fecha
#-------------------------------------------------------------------------------------
CREATE TABLE Covid(
		prov_ISO 			varchar(2),								# CÓDIGO ISO DE LA PROVINCIA
		fecha				date,									# FECHA DE LOS DATOS
		casos				int,									# CASOS NOTIFICADOS CON PRUEBA DIANÓSTICA POSITIVA
		prob_PCR			int,									# PRUEBA DE LABORATORIO PCR O TÉCNICAS MOLECULARES
		prob_AnCps			int,									# PRUEBA DE LABORATORIO DE TEST RÁPIDO DE ANTICUERPOS
		prob_Ant			int,									# PRUEBA DE LABORATORIO DE TEST DE DETECCIÓN DE ANTÍGENO
		prob_El				int,									# PRUEBA DE LABORATORIO DE SEROLOGÍA DE ALTA RESOLUCIÓN
		prob_desc			int,									# PRUEBAS DE LABOTARIO SIN CONFIRMAR
		
		CONSTRAINT PK_COVID PRIMARY KEY (prov_ISO, fecha) 
);
#-------------------------------------------------------------------------------------
# CREACIÓN DE LA TABLA "Población"
#		ProvinciaISO		cadena de caracteres  2
#		Nombre				cadena de caracteres 25
#		Sexo				cadena de caracteres 10
#		Periodo				entero
#		Total				cadena de caracteres  9
#
#		clave primaria		ProvinciaISO, Sexo, Periodo
#-------------------------------------------------------------------------------------
CREATE TABLE Población(
		ProvinciaISO		varchar(2),
		Nombre				varchar(25),
		Sexo				varchar(10),
		Periodo				int,
		Total				varchar(9),

		CONSTRAINT PK_POBLACION PRIMARY KEY (ProvinciaISO, Sexo, Periodo) 
);
#-------------------------------------------------------------------------------------
#	MODIFICACIÓN DE LA TABLA Covid
#		Nuevo nombre de la tabla	->	DatosCovid
#					prov_ISO		->	provinciaISO
#					prob_PCR		->	pruebaPCR
#					prob_AnCps		->	pruebaAnticuerpos
#					prob_Ant		->	pruebaAntígenos
#					prob_El			->	pruebaElisa
#					prob_desc		->	pruebaDesconocida
#-------------------------------------------------------------------------------------
ALTER TABLE Covid	
	RENAME DatosCovid,
	RENAME COLUMN prov_ISO TO provinciaIso,
	RENAME COLUMN prob_PCR TO pruebaPCR,
	RENAME COLUMN prob_AnCps TO pruebaAnticuerpos,
	RENAME COLUMN prob_Ant TO pruebaAntigenos,
	RENAME COLUMN prob_El TO pruebaElisa,
	RENAME COLUMN prob_desc TO pruebaDesconocida;

        
        
#-------------------------------------------------------------------------------------
#	CREACIÓN DE LA CLAVE FORÁNEA ENTRE LAS TABLAS DatosCovid y Población por el campo común
#-------------------------------------------------------------------------------------
#	ALTER TABLE Poblacion ADD CONSTRAINT FK_POBLACION FOREIGN KEY (ProvinciaISO) REFERENCES DatosCovid(provinciaISO);
ALTER TABLE DatosCovid ADD CONSTRAINT FK_DATOSCOVID FOREIGN KEY (provinciaISO) REFERENCES Población(ProvinciaISO);
