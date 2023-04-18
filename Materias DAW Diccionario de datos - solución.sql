drop database if exists MateriasDAW;
create database 		MateriasDAW;
use 					MateriasDAW;

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
insert into Materia (ID, Siglas, Codigo, Horas) values (  1, 'LMARC', 'MP0373', 133 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  2,    'SI', 'MP0483', 186 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  3,    'BD', 'MP0484', 187 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  4,  'Prog', 'MP0485', 240 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  5,    'CD', 'MP0487', 107 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  6, 'DWEBC', 'MP0612', 157 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  7, 'DWEBS', 'MP0613', 175 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  8,   'DAW', 'MP0614',  88 );
insert into Materia (ID, Siglas, Codigo, Horas) values (  9,   'DIW', 'MP0615', 157 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 10,  'Prox', 'MP0616',  26 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 11,   'FOL', 'MP0617', 107 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 12,   'EIE', 'MP0618',  53 );
insert into Materia (ID, Siglas, Codigo, Horas) values ( 13,   'FCT', 'MP0619', 384 );

insert into Sigla (siglas, Nombre) values ( 'LMARC', 'Linguaxes de marcas e sistemas de xestión empresarial' );
insert into Sigla (siglas, Nombre) values (    'SI', 'Sistemas Informáticos'                                 );
insert into Sigla (siglas, Nombre) values (    'BD', 'Bases de Datos'                                        );
insert into Sigla (siglas, Nombre) values (  'Prog', 'Programación'                                          );
insert into Sigla (siglas, Nombre) values (    'CD', 'Contornos de Desenvolvemento'                          );
insert into Sigla (siglas, Nombre) values ( 'DWEBC', 'Desenvolvemento Web en Contorno Cliente'               );
insert into Sigla (siglas, Nombre) values ( 'DWEBS', 'Desenvolvemento Web en Contorno Servidor'              );
insert into Sigla (siglas, Nombre) values (   'DAW', 'Despregamento de Aplicacións Web'                      );
insert into Sigla (siglas, Nombre) values (   'DIW', 'Deseño de Interfaces Web'                              );
insert into Sigla (siglas, Nombre) values (  'Prox', 'Proxecto de desenvolvemento de aplicacións web'        );
insert into Sigla (siglas, Nombre) values (   'FOL', 'Formación e orientación laboral'                       );
insert into Sigla (siglas, Nombre) values (   'EIE', 'Empresa e iniciativa emprendedora'                     );
insert into Sigla (siglas, Nombre) values (   'FCT', 'Formación en centros de traballo'                      );

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
