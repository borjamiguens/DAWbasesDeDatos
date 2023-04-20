#*******************************************************************************************
#	CREACIÓN Y USO DE LA BASE DE DATOS 'CiclosInformatica'
#*******************************************************************************************
DROP DATABASE IF EXISTS CiclosInformatica;
CREATE DATABASE 		CiclosInformatica;
USE 					CiclosInformatica;
#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#*******************************************************************************************
#		TABLA Modulo
#*******************************************************************************************
#		idModulo		int				auto_increment desde 50
#		sigla			varchar(5)
#		codigo			varchar(6)
#		nombre			text
#		horas			int
#		curso			int
#		ciclo			text
#
#		Llave primaria 			->	idModulo
#		Valor único    			->	codigo
#		Comprobación de Valor no nulo	->	sigla, codigo, nombre, horas
#		Comprobación de Valor no vacío	->	sigla, codigo, nombre
#		Comprobación de Valor positivo	->	horas
#		Índice				->	codigo
#*******************************************************************************************
CREATE TABLE modulo(
	idModulo int auto_increment,
    sigla varchar(5),
    codigo varchar(6),
    nombre text,
    horas int,
    curso int,
    ciclo text,
    primary key (idModulo)
) auto_increment=50;

ALTER TABLE modulo

    ADD CONSTRAINT SIGLA_NOT_NULL 		CHECK (sigla IS NOT NULL),
    ADD CONSTRAINT CODIGO_NOT_NULL 		CHECK (codigo IS NOT NULL),
    ADD CONSTRAINT NOMBRE_NOT_NULL 		CHECK (nombre IS NOT NULL),
    ADD CONSTRAINT HORAS_NOT_NULL 		CHECK (horas IS NOT NULL),
    ADD CONSTRAINT SIGLA_NOT_EMPTY 		CHECK (sigla !=''),
    ADD CONSTRAINT CODIGO_NOT_EMPTY 	CHECK (codigo !=''),
    ADD CONSTRAINT NOMBRE_NOT_EMPTY 	CHECK (nombre !=''),
    ADD CONSTRAINT HORAS_IS_POSITIVE 	CHECK (horas >=0),
    ADD INDEX INDEX_CODIGO (codigo);
    
    
#*******************************************************************************************
#	AÑADIMOS LOS DATOS
#*******************************************************************************************


INSERT INTO modulo (sigla,codigo,nombre,horas,curso,ciclo) VALUES 	
	( 'LMSXI', 'MP0373' , 'Linguaxes de marcas e sistemas de xestión empresarial', 133, 1, 'DAW' ),
	( 'SI', 'MP0483' , 'Sistemas Informáticos', 186 , 1 , 'DAW'),
	( 'BD', 'MP0484', 'Bases de Datos', 187 , 1 , 'DAW'),
	( 'PROG', 'MP0485', 'Programación', 240 , 1 , 'DAW'),
	( 'CD', 'MP0487', 'Contornos de Desenvolvemento', 107 , 1 , 'DAW'),
    ( 'FOL', 'MP0617', 'Formación e orientación laboral', 107 , 1 , 'DAW'),
    ( 'EIE', 'MP0618', 'Empresa e iniciativa emprendedora',  53 , 2 , 'DAW'),
	( 'DWEBC', 'MP0612', 'Desenvolvemento Web en Contorno Cliente', 157 , 2 , 'DAW'),
	( 'DWEBS', 'MP0613', 'Desenvolvemento Web en Contorno Servidor', 175 , 2 , 'DAW'),
	( 'DAW', 'MP0614',  'Despregamento de Aplicacións Web', 88 , 2 ,  'DAW'),
	( 'DIW', 'MP0615', 'Deseño de Interfaces Web', 157 , 2 , 'DAW'),
	( 'PROX', 'MP0616', 'Proxecto de desenvolvemento de aplicacións web',  26 , 2 , 'DAW'),		
	( 'FCT', 'MP0619', 'Formación en centros de traballo', 384 , 2 , 'DAW'),
    
    ( 'LMSXI', 'MP0373' , 'Linguaxes de marcas e sistemas de xestión empresarial', 133, 1, 'DAM' ),
	( 'SI', 'MP0483' , 'Sistemas Informáticos', 186 , 1 , 'DAM'),
	( 'BD', 'MP0484', 'Bases de Datos', 187 , 1 , 'DAM'),
	( 'PROG', 'MP0485', 'Programación', 240 , 1 , 'DAM'),
	( 'CD', 'MP0487', 'Contornos de Desenvolvemento', 107 , 1 , 'DAM'),
    ( 'FOL', 'MP0493', 'Formación e orientación laboral', 107 , 1 , 'DAM'),
    ( 'EIE', 'MP0494', 'Empresa e iniciativa emprendedora',  53 , 2 , 'DAM'),
    ( 'AD', 'MP0486', 'Acceso a datos',  157 , 2 , 'DAM'),
    ( 'DI', 'MP0488', 'Desenvolvemento de interfaces',  140 , 2 , 'DAM'),
    ( 'PSP', 'MP0490', 'Programación de servizos e procesos',  70 , 2 , 'DAM'),
    ( 'PMDM', 'MP0489', 'Programación multimedia e dispositivos móbiles',  123 , 2 , 'DAM'),
    ( 'SXE', 'MP0491', 'Sistemas de xestión empresarial', 87 , 2 , 'DAM'),
    ( 'PROX', 'MP0492', 'Proxecto de desenvolvemento de aplicacións multiplataforma',  26 , 2 , 'DAM'),		
	( 'FCT', 'MP0495', 'Formación en centros de traballo', 384 , 2 , 'DAM'),
    
    
    ( 'LMSXI', 'MP0373' , 'Linguaxes de marcas e sistemas de xestión empresarial', 133, 1 , 'ASIR' ),
    ( 'FH', 'MP0371' , 'Fundamentos de hardware', 107, 1 , 'ASIR' ),
    ( 'ISO', 'MP0369' , 'Implantación de sistemas operativos', 213 , 1 , 'ASIR' ),
    ( 'PAR', 'MP0370' , 'Planificación e administración de redes', 213 , 1 , 'ASIR' ),
    ( 'XBD', 'MP0372' , 'Xestión de bases de datos', 187 , 1 , 'ASIR' ),
    ( 'FOL', 'MP0380', 'Formación e orientación laboral', 107 , 1 , 'ASIR'),
    ( 'EIE', 'MP0381', 'Empresa e iniciativa emprendedora',  53 , 2 , 'ASIR'),
    ( 'ASO', 'MP0374' , 'Administración de sistemas operativos', 140 , 2 , 'ASIR' ),
    ( 'ASXBD', 'MP0377' , 'Administración de sistemas xestores de bases de datos', 70 , 2 , 'ASIR' ),
    ( 'IAW', 'MP0376' , 'Implantación de aplicacións web', 122 , 2 , 'ASIR' ),
    ( 'SAD', 'MP0378' , 'Seguridade e alta dispoñibilidade', 105 , 2 , 'ASIR' ),
    ( 'SRI', 'MP0375' , 'Servizos de rede e internet', 140 , 2 , 'ASIR' ),
    ( 'PROX', 'MP0379', 'Proxecto de administración de sistemas informáticos en rede',  26 , 2 , 'ASIR'),		
	( 'FCT', 'MP0382', 'Formación en centros de traballo', 384 , 2 , 'ASIR');
    
    
SELECT * FROM modulo;
#*******************************************************************************************
#	CREAMOS LOS GRUPOS DE USUARIOS:	Direccion, Alumnado, Profesorado
#		En Alumnado -> AlumnadoDAM, AlumnadoDAW, AlumnadoASIR, AlumnadoSMR, AlumnadoIO, AlumnadoIC
#		En Profesorado -> ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR, ProfesoradoSMR, ProfesoradoIO, ProfesoradoIC
#-------------------------------------------------------------------------------------------
#	DROP ROLE IF EXISTS <Rol1>, <Rol2>, ..., <RolN>;
#	CREATE ROLE 	    <Rol1>, <Rol2>, ..., <RolN>;
#*******************************************************************************************
DROP ROLE IF EXISTS RolDireccion, RolAlumnado, RolProfesorado ;
CREATE ROLE 		RolDireccion, RolAlumnado, RolProfesorado ;

DROP ROLE IF EXISTS RolAlumnadoDAW, RolAlumnadoDAM, RolAlumnadoASIR;
CREATE ROLE 		RolAlumnadoDAW, RolAlumnadoDAM, RolAlumnadoASIR;

DROP ROLE IF EXISTS RolProfesoradoDAW, RolProfesoradoDAM, RolProfesoradoASIR;
CREATE ROLE 		RolProfesoradoDAW, RolProfesoradoDAM, RolProfesoradoASIR;


#*******************************************************************************************
#	ASIGNAMOS LOS MISMOS PRIVILEGIOS A LOS COMPONENTES DE LOS GRUPOS ALUMNADO Y PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <RolGrupo> TO <RolComponente1>, <RolComponente2>, ..., <RolComponenteN>;
#*******************************************************************************************
GRANT RolAlumnado 		TO RolAlumnadoDAW, RolAlumnadoDAM, RolAlumnadoASIR;
GRANT RolProfesorado 	TO RolProfesoradoDAW, RolProfesoradoDAM, RolProfesoradoASIR;

#*******************************************************************************************
#	CREAMOS LAS VISTAS ASOCIADAS A CADA CICLO FORMATIVO
#-------------------------------------------------------------------------------------------
#	DROP VIEW IF EXISTS ..., ..., ...;
#	CREATE VIEW ... AS SELECT ...;
#*******************************************************************************************
DROP VIEW IF EXISTS VistaModulosTotal; 		CREATE VIEW VistaModulosTotal 	AS SELECT * FROM modulo;
DROP VIEW IF EXISTS VistaModulosASIR; 		CREATE VIEW VistaModulosASIR 	AS SELECT * FROM modulo WHERE ciclo = 'ASIR';
DROP VIEW IF EXISTS VistaModulosDAM; 		CREATE VIEW VistaModulosDAM 	AS SELECT * FROM modulo WHERE ciclo = 'DAM';
DROP VIEW IF EXISTS VistaModulosDAW; 		CREATE VIEW VistaModulosDAW 	AS SELECT * FROM modulo WHERE ciclo = 'DAW';
#*******************************************************************************************
#	ASIGNAMOS LOS PERMISOS A DIRECCIÓN Y A LOS GRUPOS DEL PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>, <Rol2>, ..., <Rol3>;
#*******************************************************************************************
GRANT ALL ON modulo			 	TO RolDireccion;
GRANT ALL ON VistaModulosTotal 	TO RolDireccion;
GRANT ALL ON VistaModulosDAW 	TO RolProfesoradoDAW, RolDireccion;
GRANT ALL ON VistaModulosDAM 	TO RolProfesoradoDAM, RolDireccion;
GRANT ALL ON VistaModulosASIR 	TO RolProfesoradoASIR, RolDireccion;

#*******************************************************************************************
#	CREAMOS LOS USUARIOS DE DIRECCIÓN CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <direccion1>, <direccion2>, ..., <direccionN>;
#	CREATE USER <direccion1> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#	...........................
#	CREATE USER <direccionN> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#*******************************************************************************************
DROP USER IF EXISTS Director, Vicedirector, Secretario, JefeEstudiosDiurno, JefeEstudiosNocturno;
CREATE USER Director 				IDENTIFIED BY 'dir' 	DEFAULT ROLE RolDireccion;
CREATE USER Vicedirector 			IDENTIFIED BY 'vic' 	DEFAULT ROLE RolDireccion;
CREATE USER Secretario 				IDENTIFIED BY 'sec' 	DEFAULT ROLE RolDireccion;
CREATE USER JefeEstudiosDiurno 		IDENTIFIED BY 'jed' 	DEFAULT ROLE RolDireccion;
CREATE USER JefeEstudiosNocturno 	IDENTIFIED BY 'jen' 	DEFAULT ROLE RolDireccion;



#*******************************************************************************************
#	CREAMOS LOS USUARIOS DEL PROFESORADO CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <profesor1>, <profesor2>, ..., <profesorN>;
#	CREATE USER <profesor1> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#	...........................
#	CREATE USER <profesorN> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#*******************************************************************************************
DROP USER IF EXISTS  Prof_01DAM, Prof_02DAM, Prof_03DAM, Prof_04DAM, Prof_05DAM;
CREATE USER Prof_01DAM 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAM;
CREATE USER Prof_02DAM 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAM;
CREATE USER Prof_03DAM 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAM;
CREATE USER Prof_04DAM 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAM;
CREATE USER Prof_05DAM 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAM;

DROP USER IF EXISTS  Prof_01DAW, Prof_02DAW, Prof_03DAW, Prof_04DAW, Prof_05DAW;
CREATE USER Prof_01DAW 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAW;
CREATE USER Prof_02DAW 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAW;
CREATE USER Prof_03DAW 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAW;
CREATE USER Prof_04DAW 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAW;
CREATE USER Prof_05DAW 				IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoDAW;

DROP USER IF EXISTS  Prof_01ASIR, Prof_02ASIR, Prof_03ASIR, Prof_04ASIR, Prof_05ASIR;
CREATE USER Prof_01ASIR 			IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoASIR;
CREATE USER Prof_02ASIR 			IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoASIR;
CREATE USER Prof_03ASIR 			IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoASIR;
CREATE USER Prof_04ASIR 			IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoASIR;
CREATE USER Prof_05ASIR 			IDENTIFIED BY 'pro' 				DEFAULT ROLE RolProfesoradoASIR;
#*******************************************************************************************
#	DAMOS LOS RESPECTIVOS PRIVILEGIOS A LOS GRUPOS DEL ALUMNADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>;
#	---------------------
#	GRANT <permiso> ON <tabla> TO <RolN>;
#*******************************************************************************************
GRANT SELECT ON VistaModulosDAW 	TO RolAlumnadoDAW;
GRANT SELECT ON VistaModulosDAM 	TO RolAlumnadoDAM;
GRANT SELECT ON VistaModulosASIR 	TO RolAlumnadoASIR;

#*******************************************************************************************
#	CREAMOS LOS USUARIOS, ASIGNÁNDOLES LOS ROLES CORRESPONDIENTES
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <usuario1>, <usuario2>, ..., <usuarioN>;
#	CREATE USER <usuario1> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#	...........................
#	CREATE USER <usuarioN> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#*******************************************************************************************
DROP USER IF EXISTS  Al_01DAM, Al_02DAM, Al_03DAM, Al_04DAM, Al_05DAM;
CREATE USER Al_01DAM 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAM;
CREATE USER Al_02DAM 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAM;
CREATE USER Al_03DAM 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAM;
CREATE USER Al_04DAM 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAM;
CREATE USER Al_05DAM 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAM;

DROP USER IF EXISTS  Al_01DAW, Al_02DAW, Al_03DAW, Al_04DAW, Al_05DAW;
CREATE USER Al_01DAW 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAW;
CREATE USER Al_02DAW 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAW;
CREATE USER Al_03DAW 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAW;
CREATE USER Al_04DAW 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAW;
CREATE USER Al_05DAW 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoDAW;

DROP USER IF EXISTS  Al_01ASIR, Al_02ASIR, Al_03ASIR, Al_04ASIR, Al_05ASIR;
CREATE USER Al_01ASIR 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoASIR;
CREATE USER Al_02ASIR 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoASIR;
CREATE USER Al_03ASIR 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoASIR;
CREATE USER Al_04ASIR 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoASIR;
CREATE USER Al_05ASIR 				IDENTIFIED BY 'abc' 				DEFAULT ROLE RolAlumnadoASIR;
#*******************************************************************************************
#*******************************************************************************************