#*******************************************************************************************
#	CREACIÓN Y USO DE LA BASE DE DATOS 'CiclosInformatica'
#*******************************************************************************************
drop database if exists CiclosInformatica;
create database CiclosInformatica;
use CiclosInformatica;
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
create table modulo(
	idModulo int auto_increment,
    sigla varchar(5),
    codigo varchar(6),
    nombre text,
    horas int,
    curso int,
    ciclo text,
    primary key (idModulo)
) auto_increment=50;

alter table modulo
	-- add constraint PK_MODULO primary key (idModulo),
    -- add constraint UNIQUE_SIGLA unique (Sigla),
	-- add constraint UNIQUE_CODIGO unique (codigo),
    add constraint SIGLA_NOT_NULL check (sigla is not null),
    add constraint CODIGO_NOT_NULL check (codigo is not null),
    add constraint NOMBRE_NOT_NULL check (nombre is not null),
    add constraint HORAS_NOT_NULL check (horas is not null),
    add constraint SIGLA_NOT_EMPTY check (sigla !=''),
    add constraint CODIGO_NOT_EMPTY check (codigo !=''),
    add constraint NOMBRE_NOT_EMPTY check (nombre !=''),
    add constraint HORAS_IS_POSITIVE check (horas >=0),
    add index INDEX_CODIGO (codigo);
    
    
#*******************************************************************************************
#	AÑADIMOS LOS DATOS
#*******************************************************************************************
-- ('MME','MP0221','Montaxe e Mantemento de equipos',240,1,'SMR');

insert into modulo (sigla,codigo,nombre,horas,curso,ciclo) VALUES 	
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
    
    
select * from modulo;
#truncate modulo;
#*******************************************************************************************
#	CREAMOS LOS GRUPOS DE USUARIOS:	Direccion, Alumnado, Profesorado
#		En Alumnado -> AlumnadoDAM, AlumnadoDAW, AlumnadoASIR, AlumnadoSMR, AlumnadoIO, AlumnadoIC
#		En Profesorado -> ProfesoradoDAM, ProfesoradoDAW, ProfesoradoASIR, ProfesoradoSMR, ProfesoradoIO, ProfesoradoIC
#-------------------------------------------------------------------------------------------
#	DROP ROLE IF EXISTS <Rol1>, <Rol2>, ..., <RolN>;
#	CREATE ROLE 	    <Rol1>, <Rol2>, ..., <RolN>;
#*******************************************************************************************

#*******************************************************************************************
#	ASIGNAMOS LOS MISMOS PRIVILEGIOS A LOS COMPONENTES DE LOS GRUPOS ALUMNADO Y PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <RolGrupo> TO <RolComponente1>, <RolComponente2>, ..., <RolComponenteN>;
#*******************************************************************************************

#*******************************************************************************************
#	CREAMOS LAS VISTAS ASOCIADAS A CADA CICLO FORMATIVO
#-------------------------------------------------------------------------------------------
#	DROP VIEW IF EXISTS ..., ..., ...;
#	CREATE VIEW ... AS SELECT ...;
#*******************************************************************************************

#*******************************************************************************************
#	ASIGNAMOS LOS PERMISOS A DIRECCIÓN Y A LOS GRUPOS DEL PROFESORADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>, <Rol2>, ..., <Rol3>;
#*******************************************************************************************

#*******************************************************************************************
#	CREAMOS LOS USUARIOS DE DIRECCIÓN CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <direccion1>, <direccion2>, ..., <direccionN>;
#	CREATE USER <direccion1> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#	...........................
#	CREATE USER <direccionN> IDENTIFIED BY 'dir' DEFAULT ROLE 'Rol1';
#*******************************************************************************************

#*******************************************************************************************
#	CREAMOS LOS USUARIOS DEL PROFESORADO CON DEFAULT ROLE
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <profesor1>, <profesor2>, ..., <profesorN>;
#	CREATE USER <profesor1> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#	...........................
#	CREATE USER <profesorN> IDENTIFIED BY 'pro' DEFAULT ROLE 'Rol2';
#*******************************************************************************************

#*******************************************************************************************
#	DAMOS LOS RESPECTIVOS PRIVILEGIOS A LOS GRUPOS DEL ALUMNADO
#-------------------------------------------------------------------------------------------
#	GRANT <permiso> ON <tabla> TO <Rol1>;
#	---------------------
#	GRANT <permiso> ON <tabla> TO <RolN>;
#*******************************************************************************************

#*******************************************************************************************
#	CREAMOS LOS USUARIOS, ASIGNÁNDOLES LOS ROLES CORRESPONDIENTES
#-------------------------------------------------------------------------------------------
#	DROP USER IF EXISTS <usuario1>, <usuario2>, ..., <usuarioN>;
#	CREATE USER <usuario1> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#	...........................
#	CREATE USER <usuarioN> IDENTIFIED BY 'use' DEFAULT ROLE 'Rol3';
#*******************************************************************************************

#*******************************************************************************************
#*******************************************************************************************