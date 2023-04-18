#-----------------------------------------------------------------------------------------------------------------
#	CREA LA BASE DE DATOS LLAMADA 'MateriasDAW'
#-----------------------------------------------------------------------------------------------------------------
drop database if exists MateriasDAW;
create database MateriasDAW;
use MateriasDAW;

#-----------------------------------------------------------------------------------------------------------------
#	CREA LAS TABLAS NECESARIAS PARA INCORPORAR LOS DATOS SIGUIENTES
#-----------------------------------------------------------------------------------------------------------------
create table Materia(
	ID int,
    Siglas varchar (10),
    Codigo varchar (10),
    Horas int
);

create table Sigla(
	Siglas varchar (10),
    Nombre varchar (100)
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
insert into Materia (ID, Siglas, Codigo, Horas) values (  9,   'DIM', 'MP0615', 157 );
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

#-----------------------------------------------------------------------------------------------------------------
#	MOSTRAMOS AHORA LOS DATOS DE AMBAS TABLAS UNIDOS
#-----------------------------------------------------------------------------------------------------------------
select * from Materia natural join Sigla;
select sum(Horas) as "Horas totales" from Materia;

#-----------------------------------------------------------------------------------------------------------------
#                     AÑADIR
#-----------------------------------------------------------------------------------------------------------------
# - Añadir columna CicloFormativo en la tabla Materia:

alter table Materia add column CicloFormativo Varchar(100); #por defecto lo hace al final
# alter table Materia add column 'Ciclo Formativo' Varchar(100); #por defecto lo hace al final

# - Añadir columna CicloFormativo en la tabla Materia al principio:

alter table Materia modify column CicloFormativo varchar(100) first;

# - Añadir columna CicloFormativo en la tabla Materia tras Código:

# alter table Materia add column CicloFormativo varchar(100) after Codigo;

# - Añadir columna CicloFormativo en la tabla Materia antes de Código:

# alter table Materia add column CicloFormativo varchar(100) after Siglas;

# - Añadir columna índice en el atributo 'nombre' de la tabla Sigla:

alter table Sigla add index indice(nombre);

# - Crear clave llamada nombreClave sobre el atributo 'nombre':

# alter table Sigla add key nombreClave(nombre);

# - Crear clave primaria ID en Materia y Siglas en sigla:

alter table Materia add primary key (ID) ;
alter table Sigla add primary key (Siglas) ;

# - Modificar los valores de Código de la tabla Materia para que sean únicos:

alter table Materia add unique (Codigo);
show index from Materia;

# - Añadir una clave foránea entre las tablas Materia y Sigla:

alter table Materia add foreign key (Siglas) references Sigla(Siglas);
# alter table Sigla add foreign key (Siglas) references Materia(siglas);

# - Añadir una comprobación en el campo horas de la tabla Materia:

alter table Materia add check (horas > 0);

# - Añadir una comprobación de que las siglas pertenecen a un conjunto de valores de la tabla Materia:

#alter table Materia add check ( siglas IN ('LMARC','SI', etc)

# - Borrar columna CicloFormativo de la tabla Materia:

alter table Materia drop column CicloFormativo;

# - Borrar clave primaria de la tabla Materia:

alter table Materia drop primary key;
