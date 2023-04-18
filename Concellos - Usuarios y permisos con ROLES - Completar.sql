#*******************************************************************************************
#	UTILIZACIÓN DE LA BASE DE DATOS 'datosgalicia'
#*******************************************************************************************
use datosconcello;
select * from datosconcello;
#*******************************************************************************************
#	1. 	BORRAMOS Y CREAMOS LOS ROLES: RolDirector, RolDelegadoCoruna, RolDelegadoLugo, RolDelegadoOurense, RolDelegadoPontevedra
#-------------------------------------------------------------------------------------------
#	CREATE ROLE RoleDirector;
#*******************************************************************************************
	drop role if exists roldirector;			create role roldirector;
	drop role if exists roldelegadocoruna;			create role roldelegadolugo;
	drop role if exists roldelegadolugo;			create role roldelegadocoruna;
	drop role if exists roldelegadoourense;			create role roldelegadoourense;
	drop role if exists roldelegadopontevedra;			create role roldelegadopontevedra;


#*******************************************************************************************
#	CONFIGURAR LAS VISTAS DE CADA USUARIO -> VistaDirector, VDC, VDL, VLO, VLP
#	En cada vista crear _Comarca, _Concello, _Poblacion
#*******************************************************************************************
	select * from datosgalicia ;
    drop view if exists vistadirector_comarcas; 			create view vistadirector_comarcas as select comarca as 'Comarcas de Galicia', sum(superficie) as 'Superficie', sum(hombres) as 'Hombres', sum(mujeres) as 'Mujeres', sum(Mujeres+Hombres)/sum(Superficie) as 'Densidad' from datosgalicia 	group by comarca;
    drop view if exists vistadirector_concellos; 			create view vistadirector_concellos as select concello as 'Concellos de Galicia', superficie,hombres,mujeres,comarca, (Mujeres+Hombres)/(Superficie) as 'Densidad' from datosgalicia 	;
	drop view if exists vistadirector_provincias; 			create view vistadirector_provincias as select provincia, sum(superficie) as 'Superficie', sum(hombres) as 'Hombres', sum(mujeres) as 'Mujeres', sum(Mujeres+Hombres)/sum(Superficie) as 'Densidad' from datosgalicia 	group by provincia;

#*******************************************************************************************
#	ASIGNAMOS PRIVILEGIOS A LOS ROLES
#		RolDirector 			-> Permiso total en todas las vustas creadas
#		RolDelegadoCoruna		-> Permiso total SÓLO en las vistas de Coruña
#		RolDelegadoLugo			-> Permiso total SÓLO en las vistas de Lugo
#		RolDelegadoOurense		-> Permiso total SÓLO en las vistas de Ourense
#		RolDelegadoPontevedra	-> Permiso total SÓLO en las vistas de Pontevedra
#*******************************************************************************************

#*******************************************************************************************
#	CREAMOS 5 USUARIOS: 	Director, DelegadoCoruña, DelegadoLugo, DelegadoOurense, DelegadoPontevedra
#*******************************************************************************************

#*******************************************************************************************
#	ACTUALIZAMOS LOS PRIVILEGIOS OTORGADOS
#*******************************************************************************************

