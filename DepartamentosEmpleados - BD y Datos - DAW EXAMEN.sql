#------------------------------------------------------------------------------------------------
#  1. CREACIÓN DE LA BASE DE DATOS Y USO
#------------------------------------------------------------------------------------------------
drop database if exists empleadoDepartamentoExamen;
create database empleadoDepartamentoExamen;
use empleadoDepartamentoExamen;

#------------------------------------------------------------------------------------------------
#  CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#------------------------------------------------------------------------------------------------
#  2. CREACIÓN DE LA TABLA 'depto' CON LOS SIGUIENTES CAMPOS:
#------------------------------------------------------------------------------------------------
#	dpto		- CÓDIGO DE DEPARTAMENTO
#	codigo		- VALOR ASOCIADO DENTRO DE LA EMPRESA
#	nom			- NOMBRE DEL DEPARTAMENTO
#	ciudad		- CIUDAD EN LA QUE ESTÁ EL DEPARTAMENTO
#	pais		- PAÍS EN EL QUE ESTÁ EL DEPARTAMENTO
#	tlf			- TELÉFONO DEL DEPARTAMENTO
#	jefe		- DIRECTOR DEL DEPARTAMENTO
#------------------------------------------------------------------------------------------------
create table depto(
	dpto 		int,
    codigo		varchar(10),
    nom 		varchar(50),
    ciudad		varchar(20),
    pais		varchar(20),
    tlf			varchar(15),
    jefe		int
);

#------------------------------------------------------------------------------------------------
#  3. CREACIÓN DE LA TABLA 'emple' CON LOS SIGUIENTES CAMPOS:
#------------------------------------------------------------------------------------------------
#	emp		- CÓDIGO DE EMPLEADO
#	nom		- NOMBRE DEL EMPLEADO
#	pApel	- PRIMER APELLIDO DEL EMPLEADO
#	sApel	- SEGUNDO APELLIDO DEL EMPLEADO
#	sal		- SUELDO DEL EMPLEADO
#	inc		- FECHA DE INCORPORACIÓN A LA EMPRESA
#------------------------------------------------------------------------------------------------
create table emple(
	emp		int,
    nom 	varchar(50),
    pApel	varchar(50),
    sApel	varchar(50),
    sal		int,
    inc		date
);

#------------------------------------------------------------------------------------------------
#  4. CREACIÓN DE LA TABLA 'asign' CON LOS SIGUIENTES CAMPOS:
#------------------------------------------------------------------------------------------------
#   	cod		- CÓDIGO DE ASIGNACIÓN
#   	emp		- NÚMERO DE EMPLEADO
#   	dpto	- NÚMERO DE DEPARTAMENTO
#   	fec		- FECHA DE ASIGNACIÓN
#		can		- FECHA DE FINALIZACIÓN DE LA ASIGNACIÓN O DE DESPIDO
#------------------------------------------------------------------------------------------------
create table asign (
	cod		int,
    emp		int,
    dpto	int,
    fec		date,
    can		date
);

#------------------------------------------------------------------------------------------------
#  5. CREA LLAVES PRIMARIAS
#------------------------------------------------------------------------------------------------
#	En la tabla depto    ->		dpto
#	En la tabla emple    ->		emp
#	En la tabla asign    -> 	cod
#------------------------------------------------------------------------------------------------
alter table depto add constraint primary_Key_Depto primary key (dpto);
alter table emple add constraint primary_Key_Emple primary key (emp);
alter table asign add constraint primary_Key_Asign primary key (cod);

#------------------------------------------------------------------------------------------------
#  6. CREA LLAVES FORÁNEAS
#------------------------------------------------------------------------------------------------
#	En la tabla depto    ->		jefe 	  ->  TABLA depto
#	En la tabla asign    -> 	emp       ->  TABLA emple
#								dpto	  ->  TABLA depto
#------------------------------------------------------------------------------------------------
alter table depto add constraint foreign_Key_Depto_Depto foreign key (jefe) references depto(dpto) ;
alter table asign add constraint foreign_Key_Asign_Emple foreign key (emp) references emple(emp);
alter table asign add constraint foreign_Key_Asign_Depto foreign key (dpto) references depto(dpto);


#------------------------------------------------------------------------------------------------
#  7. CREA RESTRICCIONES DE VALORES NO NULOS
#------------------------------------------------------------------------------------------------
#	En la tabla depto    ->		codigo, nom, pais
#	En la tabla emple    ->		nom, pApel, inc
#	En la tabla asign    -> 	emp, dpto, fec
#------------------------------------------------------------------------------------------------
alter table depto 
	modify codigo varchar(10) not null ,
    modify nom varchar(50) not null,
	modify pais varchar(50) not null;
    
alter table emple 
	modify nom varchar(50) not null ,
    modify pApel varchar(50) not null,
	modify inc date not null;

alter table asign 
	modify emp int not null ,
    modify dpto int not null,
	modify fec date not null;


#------------------------------------------------------------------------------------------------
#  8. CREA RESTRICCIONES DE COMPARACIÓN
#------------------------------------------------------------------------------------------------
#	En la tabla depto    ->		codigo, nom, ciudad, pais		NO PUEDEN QUEDAR VACÍOS
#	En la tabla emple    ->		nom, pApel, sal					NO PUEDEN QUEDAR VACÍOS
#								sal								NO PUEDE SER NEGATIVO
#------------------------------------------------------------------------------------------------
alter table depto 
	add constraint codigo_Is_Not_Null check (codigo != ''),
    add constraint nomDepto_Is_Not_Null check (nom != ''),
	add constraint ciudad_Is_Not_Null check (ciudad != ''),
    add constraint pais_Is_Not_Null check (pais != '');
    
alter table emple 
	add constraint nomEmple_Is_Not_Null check (nom != ''),
    add constraint pApel_Is_Not_Null check (pApel != ''),
	add constraint sal_Is_Not_Null check (sal != ''),
    add constraint sal_Is_Not_Negative check (sal  >= 0);




#------------------------------------------------------------------------------------------------
#  9. CREA RESTRICCIONES DE ACCESO RÁPIDO
#------------------------------------------------------------------------------------------------
#	En la tabla depto    ->		codigo	(valor o código interno en la empresa)
#	En la tabla emple    ->		nom	(nombre de empleado)
#	En la tabla asign    -> 	fec	(fecha de asignación del empleado a un departamento)
#------------------------------------------------------------------------------------------------
alter table depto 	add index Index_Depto(codigo);
alter table emple 	add index Index_Emple(nom);
alter table asign 	add index Index_Asign(fec);
    
    

#------------------------------------------------------------------------------------------------
# 10. CAMBIO DE NOMBRES (tras hacer esto, puedes MODIFICAR el NOMBRE DE LAS TABLAS en la AGREGACIÓN DE DATOS)
#	Nombres de las tablas hacia más significativos.
#------------------------------------------------------------------------------------------------
alter table depto rename departamento;
alter table emple rename empleado;
alter table asign rename asignacion;




#------------------------------------------------------------------------------------------------
# AGREGACIÓN DE DATOS
#------------------------------------------------------------------------------------------------
# AGREGAR DEPARTAMENTOS
#------------------------------------------------------------------------------------------------
INSERT INTO departamento VALUES 
	( 1000,  'DIR',     'Dirección',         'Vigo', 'España', '400100100',     NULL ),
	( 1100,  'GER',      'Gerencia',         'Vigo', 'España', '400100110',	    1000 ),
	( 1105,  'GER',      'Gerencia',         'Lugo', 'España', '400100112',	    1000 ),
	( 1200,  'PRO',    'Producción',   'Pontevedra', 'España', '400100400',     1100 ),
	( 1300,  'VEN',        'Ventas',     'Santiago', 'España', '400100500',     1100 ),
	( 1302,  'VEN',        'Ventas',   'Pontevedra', 'España', '400100504',     1100 ),
	( 1310,  'VEN',        'Ventas',     'A Coruña', 'España', '400100580',     1100 ),
	( 1400,  'INV', 'Investigación',     'Santiago', 'España', '400100525',     1000 ),
	( 1500,  'MER',      'Mercadeo',         'Lugo', 'España', '400100800',     1100 ),
	( 9000,  'MAN', 'Mantenimiento',     'A Coruña', 'España', '400100996',     1000 ),
	( 9010,  'MAN', 'Mantenimiento',         'Lugo', 'España', '400100998',     1000 ),
	( 9020,  'MAN', 'Mantenimiento',      'Ourense', 'España', '400101099',     1000 ),
	( 9030,  'MAN', 'Mantenimiento',   'Pontevedra', 'España', '400102096',     1000 );

#------------------------------------------------------------------------------------------------
# AGREGAR EMPLEADOS
#------------------------------------------------------------------------------------------------
INSERT INTO empleado VALUES
	(  1,'Fulgencio'	,'Abade'		,'Valdes'		,2000	,'2021/01/01' ),
	(  2,'Fulgencia'	,'Gómez'		,'Sazón'		,2030	,'2021/01/02' ),
	(  3,'Guillermino' 	,'Gil'			,'Enamorado'	,1970	,'2021/01/02' ),
	(  4,'Guillermina'  ,'Zuzunaga' 	,'Cacharro'		,1800	,'2021/01/22' ),
	(  5,'Pancracio'	,'Sorní'		,'Nuero'		,1650	,'2021/10/02' ),
	(  6,'Pancracia'	,'Pregonas' 	,'Vívora'		,1400	,'2021/12/01' ),
	(  7,'Filomeno'	 	,'Zuzunaga' 	,'Valdes'		,1400	,'2021/01/02' ),
	(  8,'Filomena'	 	,'Abade'		,'Cacharro'		,1300	,'2021/08/02' ),
	(  9,'Anaximandro' 	,'Abade'		,'Pieldelobo'	,1550	,'2021/09/01' ),
	( 10,'Anaximandra'	,'Sorní'		,'Vívora'		,1550	,'2021/03/02' ),
	( 11,'Romino'	 	,'Abade'		,'Tenedor'		,1550	,'2021/05/02' ),
	( 12,'Romina'	 	,'Bonachera'    ,'Pieldelobo'	,2000	,'2021/03/07' ),
	( 13,'Agapito'	 	,'Garza'		,'Feo'			,2000	,'2021/07/02' ),
	( 14,'Agapita'	 	,'Bonachera'    ,'Valdes'		,1550	,'2021/08/02' ),
	( 15,'Apolonio'	 	,'Garza'		,'Feo'			,1550	,'2021/03/01' ),
	( 16,'Apolonia'	 	,'Pregonas'     ,'Nuero'		,1550	,'2021/09/02' ),
	( 17,'Maximiano'	,'Pieldelobo'	,'Rajado'		,1300	,'2021/07/02' ),
	( 18,'Maximiana'	,'Fea'			,'Guapa'		,1750	,'2021/01/02' ),
	( 19,'Oristilo'		,'Anacleto'		,'Gandula'		,1850	,'2021/02/01' ),
	( 20,'Oristila'		,'Pelchilengue'	,'Verdugo'		,1900	,'2021/03/01' ),
	( 21,'Tesifonte'	,'Seisdedos'	,'Alcoholado'	,1800	,'2021/04/02' ),
	( 22,'Tesifonta'	,'Garza'		,'Sorní'		,1850	,'2021/04/02' ),
	( 23,'Lisandro'		,'Piernavieja'	,'Valdes'		,2300	,'2021/05/03' ),
	( 24,'Lisandra'		,'Fina'			,'Púlpito'		,2350	,'2021/01/03' ),
	( 25,'Acracio'		,'Braga'		,'Alegre'		,2250	,'2021/01/03' ),
	( 26,'Acracia'		,'Triste'		,'Alegre'		,1950	,'2021/02/03' ),
	( 27,'Procopio'		,'Bronca'		,'Segura'		,2400	,'2021/02/03' ),
	( 28,'Procopia'		,'Fina'			,'Segura'		,2300	,'2021/08/03' ),
	( 29,'Frumencio'	,'Ladrón'		,'Segura'		,2200	,'2021/09/05' ),
	( 30,'Frumencia'	,'Honrado'		,'Ladrón'		,2150	,'2021/02/05' ),
	( 31,'Edelvino'		,'Dios'			,'Salvador'		,2150	,'2021/03/05' ),
	( 32,'Edelvina'		,'Ladrón'		,'Salvador'		,1900	,'2021/03/05' ),
	( 33,'Agapito'		,'Triste'		,'Vital'		,2250	,'2021/03/05' ),
	( 34,'Agapita'		,'Alegre'		,'Vital'		,1900	,'2021/02/05' ),
	( 35,'Ruperto'		,'Bonachera'	,'Seisdedos'	,1950	,'2021/01/05' ),
	( 36,'Ruperta'		,'Cacharro'		,'Alegre'		,2250	,'2021/09/05' ),
	( 37,'Tesifonte'	,'Triste'		,'Alegre'		,2050	,'2021/04/05' ),
	( 38,'Tesifonta'	,'Cidoncha'		,'Parraverde'	,1950	,'2021/05/05' ),
	( 39,'Tiburcio'		,'Barato'		,'Fermonsel'	,1850	,'2021/05/05' ),
	( 40,'Tiburcia'		,'Caro'			,'Fermonsel'	,2000	,'2021/04/05' );

#------------------------------------------------------------------------------------------------
# AGREGAR ASIGNACIONES
#------------------------------------------------------------------------------------------------
#   	cod		- CÓDIGO DE ASIGNACIÓN
#   	emp		- NÚMERO DE EMPLEADO
#   	dpto	- NÚMERO DE DEPARTAMENTO
#   	fec		- FECHA DE ASIGNACIÓN
#		can		- FECHA DE FINALIZACIÓN DE LA ASIGNACIÓN O DE DESPIDO
#------------------------------------------------------------------------------------------------
INSERT INTO asignacion VALUES 
	(  1,  1, 1000, '2021/01/01', NULL ),
    (  2,  2, 1000, '2021/01/02', NULL ),
    (  3,  3, 1100, '2021/01/02', '2021/12/31' ),
    (  4, 18, 1200, '2021/01/02', NULL ),
    (  5, 24, 9000, '2021/01/03', NULL ),
    (  6, 25, 9000, '2021/01/03', NULL ),
    (  7, 35, 9030, '2021/01/05', NULL ),
    (  8, 26, 9010, '2021/02/03', NULL ),
    (  9,  4, 1300, '2021/01/22', NULL ),
    ( 10, 27, 9020, '2021/02/03', NULL ),
    ( 11, 34, 9020, '2021/02/05', NULL ),
    ( 12, 10, 1302, '2021/03/02', NULL ),
    ( 13, 31, 9030, '2021/03/05', NULL ),
    ( 14, 32, 9030, '2021/03/05', NULL ),
    ( 15, 21, 1500, '2021/04/02', NULL ),
    ( 16, 22, 1500, '2021/04/02', NULL ),
    ( 17, 37, 1302, '2021/04/05', NULL ),
    ( 18, 40, 1105, '2021/04/05', NULL ),
    ( 19, 38, 1500, '2021/05/05', NULL ),
    ( 20, 23, 1400, '2021/05/03', NULL ),
    ( 21, 13, 1310, '2021/07/02', NULL ),
    ( 22, 17, 1200, '2021/07/02', NULL ),
    ( 23, 28, 9030, '2021/08/03', NULL ),
    ( 24,  9, 1300, '2021/09/01', NULL ),
    ( 25, 16, 1105, '2021/09/02', NULL ),
    ( 26, 36, 1302, '2021/09/05', NULL ),
    ( 27,  5, 9000, '2021/12/01', '2021/12/31' ),
    ( 28,  6, 9000, '2021/12/01', '2021/12/31' ),
    ( 29, 11, 9010, '2021/12/01', '2021/12/31' ),
    ( 30, 12, 9010, '2021/12/01', '2021/12/31' ),
    ( 31, 18, 9020, '2021/12/01', '2021/12/31' ),
    ( 32, 19, 9020, '2021/12/01', '2021/12/31' ),
    ( 33, 20, 9030, '2021/12/01', '2021/12/31' ),
    ( 34, 30, 9030, '2021/12/01', '2021/12/31' ),
    ( 35,  3, 9000, '2022/01/01', '2022/01/31' ),
    ( 36, 12, 9010, '2022/01/01', NULL ),
    ( 37, 20, 9030, '2022/01/01', NULL ),
    ( 38,  3, 9010, '2022/02/01', '2022/02/28' ),
    ( 39,  6, 9010, '2022/02/01', '2022/02/28' ),
    ( 40, 30, 9000, '2022/02/01', '2022/02/28' ),
    ( 41,  3, 9010, '2022/03/01', '2022/03/15' ),
    ( 42,  6, 9010, '2022/03/01', '2022/03/19' ),
    ( 43, 30, 9000, '2022/03/01', '2022/03/31' ),
    ( 44,  3, 9030, '2022/05/01', '2022/05/31' ),
    ( 45,  6, 9000, '2022/05/01', '2022/07/31' ),
    ( 46, 30, 9020, '2022/05/01', '2022/08/31' );


select * from departamento;
select * from empleado;
select * from asignacion;
#------------------------------------------------------------------------------------------------
#  1. Une las tablas y muestra los datos ordenados según la fecha de contratación de los empleados
#------------------------------------------------------------------------------------------------
select * from departamento, empleado, asignacion
where (asignacion.emp=empleado.emp and asignacion.dpto=departamento.dpto)
order by empleado.inc;

#------------------------------------------------------------------------------------------------
#  2. De la lista anterior muestra los contratos que no tienen fecha de cancelación
#------------------------------------------------------------------------------------------------
select * from departamento, empleado, asignacion
where (asignacion.emp=empleado.emp and asignacion.dpto=departamento.dpto and (asignacion.can is null))
order by empleado.inc;

#------------------------------------------------------------------------------------------------
#  3. ¿Qué empleados han tenido contratos con fecha de terminación posterior a la actual? 	fecha actual -> curdate()
#		Ordena por los apellidos.
#------------------------------------------------------------------------------------------------
select * from empleado, asignacion 
	where (can<curdate())
    order by pApel, sApel;

#------------------------------------------------------------------------------------------------
#  4. ¿Qué departamento (nombre) es el más numeroso? y muestra sus teléfonos
#------------------------------------------------------------------------------------------------
select * from departamento;
	#where( select * from empleado 

#------------------------------------------------------------------------------------------------
#  5. Empleados de la base de datos que NO hayan trabajado en la empresa desde su incorporación a las listas
#------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------
#  6. Lista el nombre completo de los empleados cuyo nombre empiece por vocal
#------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------
#  7. ¿Qué empleado (código y nombre completo) es el que tiene el mayor número de contrataciones?
#------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------
#  8. Lista los jefes de los departamentos
#------------------------------------------------------------------------------------------------


#------------------------------------------------------------------------------------------------
#  9. ¿Qué empleado (código y nombre completo) es el que tiene el mayor número de contrataciones?
#------------------------------------------------------------------------------------------------
 
 
#------------------------------------------------------------------------------------------------
# 10. Lista los códigos de departamento, sus nombres y el salario medio de los trabajadores de cada departamento
#------------------------------------------------------------------------------------------------


   