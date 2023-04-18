drop database if exists MateriasASIR;###VIGOVIGOVIGO HACER
create database 		MateriasASIR;
use 					MateriasASIR;

#-----------------------------------------------------------------------------------------------------------------
#	CREA LAS TABLAS NECESARIAS PARA INCORPORAR LOS DATOS SIGUIENTES
#-----------------------------------------------------------------------------------------------------------------
create table Materia (
    ID     int,
    Siglas varchar( 20 ),
    Codigo varchar(  6 ),
    Horas  int
);

create table Sigla (
	Siglas varchar( 20 ),
	Nombre varchar( 60 )
);

#-----------------------------------------------------------------------------------------------------------------
#	AÑADIMOS LOS DATOS A LAS TABLAS RECIÉN CREADAS
#-----------------------------------------------------------------------------------------------------------------
insert into Materia (ID, Siglas, Codigo, Horas) values (  1, 'ISO', 'MP0369', 213 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  2,    'PAR', 'MP0370', 213 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  3,    'FH', 'MP0371', 107 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  4,  'XBD', 'MP0372', 187 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  5,    'LMSXI', 'MP0373', 133 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  6,   'ASO', 'MP0374', 140 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  7,    'SRI', 'MP0375', 140 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  8,   'IAW', 'MP0376',  122 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  9,  'ASXDB', 'MP0377', 70 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 10,  'SAD', 'MP0378',  105 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 11,   'FOL', 'MP0380', 107 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 12,   'EIE', 'MP0381',  53 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 13,   'FCT', '', 384 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 14,   'PROX', '', 26 );


insert into Sigla (siglas, Nombre) values ( 'ISO', 'Implantacion de sistemas operativos' );
insert into Sigla (siglas, Nombre) values (    'PAR', 'Planificacion e administracion de redes'    );                     
insert into Sigla (siglas, Nombre) values (    'FH', 'Fundamentos de hardware'             );
insert into Sigla (siglas, Nombre) values ( 'XBD', 'Xestion de bases de datos' );
insert into Sigla (siglas, Nombre) values ( 'LMSXI', 'Linguaxes de marcas e sistemas de xestion da informacion' );                                
insert into Sigla (siglas, Nombre) values (    'ASO', 'Administracion de sistemas operativos'                          );
insert into Sigla (siglas, Nombre) values (   'SRI', 'Servizos de rede e internet'             			 );
insert into Sigla (siglas, Nombre) values (    'IAW', 'Implantacion de aplicacions web'              							 );
insert into Sigla (siglas, Nombre) values (   'ASXBD', 'Administracion de sistemas xestores de base de datos'                  );
insert into Sigla (siglas, Nombre) values (   'SAD', 'Seguridade e alta disponibilidade'       );
insert into Sigla (siglas, Nombre) values (   'FOL', 'Formación e orientación laboral'                       );
insert into Sigla (siglas, Nombre) values (   'EIE', 'Empresa e iniciativa emprendedora'                     );
insert into Sigla (siglas, Nombre) values (   'FCT', 'Formación en centros de traballo'                      );
insert into Sigla (siglas, Nombre) values (   'PROX', 'Proxecto de administracion de sistemas informaticos en rede'                      );

#------------------------------------------------------------------------------------------------------
# DICCIONARIO DE DATOS
#------------------------------------------------------------------------------------------------------
# digito = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
# digito = [ 0 - 9 ]
# letra = [ mayúscula | minúscula ]
# mayúscula = [ A - Z | Ñ ]
# minúscula = [ a - z | ñ ]
# alfanum = [ letra | digito ]
#------------------------------------------------------------------------------------------------------
#	TABLA Materia
#------------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------
# MATERIA = { materia }				*Información de los módulos del Ciclo Formativo de DAW*
# materia = @ID + Siglas + Codigo + (Horas)	*Información de cada módulo del Ciclo Formativo de DAW*
# ID = 1{digito}2				*Clave numérica propia de la tabla Materia*
# Siglas = 1{letra}5 				*Abreviatura del Módulo*
# Codigo = 2{letra}2 + 4{digito}4		*Valor alfanumérico asociado al módulo*
# Codigo = 6{alfanum}6
# Codigo = "MP" + 4{digito}4
# Horas = 2{digito}3				*Duración del módulo en horas*
#------------------------------------------------------------------------------------------------------
#	TABLA Sigla
#------------------------------------------------------------------------------------------------------
# SIGLAS = { siglas }		*Información descriptiva de los acrónimos de los módulos del Ciclo Formativo de DAW*
# siglas = @Siglas + Nombre	*Información descriptiva del acrónimo de cada módulo del Ciclo Formativo de DAW*
# Siglas = 1{letra}10		*Acrónimo del módulo*
# Nombre = 1{ letra }60		*Cada uno de los módulos del ciclo formativo*

select * from materia;
#truncate table materia;
#select * from materia;
select count(*) from Materia natural Join sigla;
select sum(horas) as 'horas totales' from Materia;
#select sum(horas)/count(*) as 'horas medias' from Materia;
select avg(horas) as 'horas medias' from Materia;




