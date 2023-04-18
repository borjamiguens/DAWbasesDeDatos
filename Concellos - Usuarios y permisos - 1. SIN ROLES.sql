#*******************************************************************************************
#	UTILIZACIÓN DE LA BASE DE DATOS 'ConcellosGalicia'
#*******************************************************************************************
	USE DatosConcello;
#*******************************************************************************************
#	1.	CONFIGURAMOS LAS VISTAS DE CADA USUARIO
#*******************************************************************************************
        DROP VIEW IF EXISTS ComarcasCoruña;		CREATE VIEW ComarcasCoruña 	AS Select Comarca AS 'Comarcas da Coruña', sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 				from DatosConcello 	where Provincia = 'A Coruña' GROUP BY Comarca;
		DROP VIEW IF EXISTS ConcellosCoruña;	CREATE VIEW ConcellosCoruña	AS Select Nombre  AS 'Concellos da Coruña', Superficie, Mujeres, Hombres, Comarca, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 														from DatosConcello 	where Provincia = 'A Coruña' GROUP BY Concello;
        DROP VIEW IF EXISTS PoblacionCoruña;	CREATE VIEW PoblacionCoruña	AS Select Provincia, sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres) AS Total, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad		from DatosConcello 	where Provincia = 'A Coruña';

        DROP VIEW IF EXISTS ComarcasLugo;		CREATE VIEW ComarcasLugo 	AS Select Comarca AS 'Comarcas de Lugo', sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad					from DatosConcello 	where Provincia = 'Lugo' GROUP BY Comarca;
		DROP VIEW IF EXISTS ConcellosLugo;		CREATE VIEW ConcellosLugo	AS Select Nombre  AS 'Concellos de Lugo', Superficie, Mujeres, Hombres, Comarca, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 															from DatosConcello 	where Provincia = 'Lugo' GROUP BY Concello;
        DROP VIEW IF EXISTS PoblacionLugo;		CREATE VIEW PoblacionLugo	AS Select Provincia, sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres) AS Total, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad		from DatosConcello 	where Provincia = 'Lugo';

        DROP VIEW IF EXISTS ComarcasOurense;	CREATE VIEW ComarcasOurense 	AS Select Comarca AS 'Comarcas de Ourense', sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 				from DatosConcello 	where Provincia = 'Ourense' GROUP BY Comarca;
		DROP VIEW IF EXISTS ConcellosOurense;	CREATE VIEW ConcellosOurense	AS Select Nombre  AS 'Concellos de Ourense', Superficie, Mujeres, Hombres, Comarca, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 														from DatosConcello 	where Provincia = 'Ourense'	GROUP BY Concello;
        DROP VIEW IF EXISTS PoblacionOurense;	CREATE VIEW PoblacionOurense	AS Select Provincia, sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres) AS Total, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad		from DatosConcello 	where Provincia = 'Ourense';

        DROP VIEW IF EXISTS ComarcasPontevedra;		CREATE VIEW ComarcasPontevedra 	AS Select Comarca AS 'Comarcas de Pontevedra', sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 			from DatosConcello 	where Provincia = 'Pontevedra' GROUP BY Comarca;
		DROP VIEW IF EXISTS ConcellosPontevedra;	CREATE VIEW ConcellosPontevedra	AS Select Nombre  AS 'Concellos de Pontevedra', Superficie, Mujeres, Hombres, Comarca, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 													from DatosConcello 	where Provincia = 'Pontevedra' GROUP BY Concello;
        DROP VIEW IF EXISTS PoblacionPontevedra;	CREATE VIEW PoblacionPontevedra	AS Select Provincia, sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres) AS Total, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad		from DatosConcello 	where Provincia = 'Pontevedra';

		DROP VIEW IF EXISTS ComarcasGalicia;	CREATE VIEW ComarcasGalicia		AS Select Comarca AS 'Comarcas de Galicia', sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 				from DatosConcello 	GROUP BY Comarca;
		DROP VIEW IF EXISTS ConcellosGalicia;	CREATE VIEW ConcellosGalicia	AS Select Nombre  AS 'Concellos de Galicia', Superficie, Mujeres, Hombres, Comarca, Provincia, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad 											from DatosConcello 	GROUP BY Concello;
        DROP VIEW IF EXISTS PoblacionGalicia;	CREATE VIEW PoblacionGalicia	AS Select Provincia, sum(Superficie) AS Superficie, sum(Mujeres) AS Mujeres, sum(Hombres) AS Hombres, sum(Mujeres+Hombres) AS Total, sum(Mujeres+Hombres)/sum(Superficie) AS Densidad		from DatosConcello 	GROUP BY Provincia;
#*******************************************************************************************
#	2.	CREAMOS 5 USUARIOS: 	Director, DelegadoCoruña, DelegadoLugo, DelegadoOurense, DelegadoPontevedra
#*******************************************************************************************
		DROP USER IF EXISTS Director;				CREATE USER Director			IDENTIFIED BY 'abc';
		DROP USER IF EXISTS DelegadoCoruña;			CREATE USER DelegadoCoruña		IDENTIFIED BY 'abc';
		DROP USER IF EXISTS SubDelegadoCoruña;		CREATE USER SubDelegadoCoruña	IDENTIFIED BY 'abc';
		DROP USER IF EXISTS DelegadoLugo;			CREATE USER DelegadoLugo		IDENTIFIED BY 'abc';
		DROP USER IF EXISTS DelegadoOurense;		CREATE USER DelegadoOurense		IDENTIFIED BY 'abc';
		DROP USER IF EXISTS DelegadoPontevedra;		CREATE USER DelegadoPontevedra	IDENTIFIED BY 'abc';
#*******************************************************************************************
#	3.	ASIGNAMOS PRIVILEGIOS A LOS USUARIOS
#*******************************************************************************************
		GRANT ALL ON DatosConcello		TO Director;
        GRANT ALL ON ComarcasGalicia	TO Director;
        GRANT ALL ON ConcellosGalicia	TO Director;
        GRANT ALL ON PoblacionGalicia	TO Director;

        GRANT ALL ON ComarcasCoruña		TO	Director, DelegadoCoruña, SubDelegadoCoruña;
        GRANT ALL ON ConcellosCoruña	TO	Director, DelegadoCoruña, SubDelegadoCoruña;
        GRANT ALL ON PoblacionCoruña	TO	Director, DelegadoCoruña, SubDelegadoCoruña;

        GRANT ALL ON ComarcasLugo		TO	Director, DelegadoLugo;
        GRANT ALL ON ConcellosLugo		TO	Director, DelegadoLugo;
        GRANT ALL ON PoblacionLugo		TO	Director, DelegadoLugo;

        GRANT ALL ON ComarcasOurense	TO	Director, DelegadoOurense;
        GRANT ALL ON ConcellosOurense	TO	Director, DelegadoOurense;
        GRANT ALL ON PoblacionOurense	TO	Director, DelegadoOurense;

        GRANT ALL ON ComarcasPontevedra		TO	Director, DelegadoPontevedra;
        GRANT ALL ON ConcellosPontevedra	TO	Director, DelegadoPontevedra;
        GRANT ALL ON PoblacionPontevedra	TO	Director, DelegadoPontevedra;
#*******************************************************************************************
#	4.	ACTUALIZAMOS LOS PRIVILEGIOS OTORGADOS
#*******************************************************************************************
		FLUSH PRIVILEGES;
