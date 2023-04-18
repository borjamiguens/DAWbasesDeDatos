#*******************************************************************************************
#	CREACIÓN DE LA BASE DE DATOS ConcellosGalicia_Identificador
#*******************************************************************************************
DROP DATABASE IF EXISTS ConcellosGalicia_Identificador;
CREATE DATABASE ConcellosGalicia_Identificador;
USE ConcellosGalicia_Identificador;
#*******************************************************************************************
#	CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
#*******************************************************************************************
#	CREACIÓN DE LA TABLA ProvinciasGalicia
#		Provincia		entero
#		nombre			cadena de caracteres 20
#
#		Clave primaria		Provincia
#
#		Comprobación de valor NULO y vacío del campo nombre
#*******************************************************************************************
CREATE TABLE ProvinciasGalicia(
	Provincia 	int NOT NULL 	PRIMARY KEY ,
    Nombre 		varchar(20)	,
	CONSTRAINT	VALOR_NULO_PROVINCIA CHECK (nombre IS NOT NULL),
    CONSTRAINT  VALOR_VACIO_PROVINCIA CHECK (nombre != "")


);

-- ALTER TABLE ProvinciasGalicia 
-- 	ADD CONSTRAINT	VALOR_NULO_PROVINCIA CHECK (nombre IS NOT NULL),
--     ADD CONSTRAINT  VALOR_VACIO_PROVINCIA CHECK (nombre != "");

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ComarcasGalicia
#		Comarca		entero		
#		nombre			cadena de caracteres 30
#		Provincia	entero
#
#		Clave primaria		Provincia, Comarca
#		Clave foránea		Provincia	->	ProvinciasGalicia( Provincia )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo Provincia
#*******************************************************************************************
CREATE TABLE ComarcasGalicia(
	Comarca 	int  ,
    Nombre 		varchar(30),
	Provincia	int	,

	CONSTRAINT PK_COMARCAS PRIMARY KEY (Comarca, Provincia) ,
	CONSTRAINT FK_COMARCAS FOREIGN KEY (Provincia) REFERENCES ProvinciasGalicia(Provincia),
	CONSTRAINT	VALOR_NULO_COMARCA CHECK (nombre IS NOT NULL),
	CONSTRAINT  VALOR_VACIO_COMARCA CHECK (nombre != "")
);

/*ALTER TABLE ComarcasGalicia ADD CONSTRAINT PK_COMARCAS PRIMARY KEY (Provincia, Comarca) ;
ALTER TABLE ComarcasGalicia ADD CONSTRAINT FK_COMARCAS FOREIGN KEY (Provincia) REFERENCES ProvinciasGalicia(Provincia);

ALTER TABLE ComarcasGalicia 
	ADD CONSTRAINT	VALOR_NULO_COMARCA CHECK (nombre IS NOT NULL),
 ADD CONSTRAINT  VALOR_VACIO_COMARCA CHECK (nombre != "");*/

#*******************************************************************************************
#	CREACIÓN DE LA TABLA ConcellosGalicia
#		Concello		entero		
#		nombre			cadena de caracteres 30
#		superficie		número decimal
#		comarca			entero
#		Provincia		entero
#
#		Clave primaria		Provincia, Comarca, Concello
#		Clave foránea		Provincia, Comarca	->	ComarcasGalicia( Provincia, Comarca )
#
#		Comprobación de valor NULO y vacío de los campos nombre
#		Comprobación de valor NULO del campo superficie, Comarca
#*******************************************************************************************
CREATE TABLE ConcellosGalicia(
	Concello 	int	,    
    Nombre 		varchar(30),
    Superficie	double,
	Provincia 	int		,
    Comarca		int		,

    CONSTRAINT PK_CONCELLO PRIMARY KEY (Comarca, Provincia, Concello ) ,
	CONSTRAINT FK_CONCELLO FOREIGN KEY (Comarca, Provincia) REFERENCES ComarcasGalicia(Comarca, Provincia),
	CONSTRAINT	VALOR_NULO_CONCELLO CHECK (nombre IS NOT NULL),
	CONSTRAINT  VALOR_VACIO_CONCELLO CHECK (nombre != "")

);

-- ALTER TABLE ConcellosGalicia ADD CONSTRAINT PK_CONCELLO PRIMARY KEY (Provincia, Comarca, Concello);
-- ALTER TABLE ConcellosGalicia ADD CONSTRAINT FK_CONCELLO FOREIGN KEY (Provincia, Comarca) REFERENCES ComarcasGalicia(Provincia, Comarca);

-- ALTER TABLE ConcellosGalicia 
-- 	ADD CONSTRAINT	VALOR_NULO_CONCELLO CHECK (nombre IS NOT NULL),
--     ADD CONSTRAINT  VALOR_VACIO_CONCELLO CHECK (nombre != "");

#*******************************************************************************************
#	CREACIÓN DE LA TABLA PoblacionGalicia
#		Poblacion		entero		autoincrementable
#		Año			entero
#		Concello		entero
#		mujeres			entero
#		hombres			entero
#		Provincia		entero
#		Comarca			entero		
#
#		Clave primaria		Poblacion
#		Clave foránea		Provincia, Comarca, Concello	->	ConcellosGalicia( Provicia, Comarca, Concello )
#
#		Comprobación de valor NULO y vacío de los campos mujeres, hombres
#		Comprobación de valor NULO del campo Concello
#*******************************************************************************************
CREATE TABLE PoblacionGalicia(
	Poblacion 	int PRIMARY KEY AUTO_INCREMENT,
    Año 		int,
	Provincia 	int,
    Comarca		int,
    Concello	int,
    Mujeres		int,
    Hombres		int,
    CONSTRAINT FK_POBLACION FOREIGN KEY (Comarca, Provincia, Concello) REFERENCES ConcellosGalicia(Comarca, Provincia, Concello),
	CONSTRAINT VALOR_NULO_MUJERES CHECK (mujeres IS NOT NULL),
	CONSTRAINT	VALOR_NULO_HOMBRES CHECK (hombres IS NOT NULL),
    CONSTRAINT  VALOR_VACIO_MUJERES CHECK (mujeres != ""),
	CONSTRAINT  VALOR_VACIO_HOMBRES CHECK (hombres != ""),
	#ADD CONSTRAINT  VALOR_VACIO_CONCELLO CHECK (nombre IS NOT NULL);
    CONSTRAINT mujeres_NUMERO_ERRONEO CHECK (mujeres > 0)

);



#*******************************************************************************************
#	DATOS DE LAS PROVINCIAS - AGREGAR POR IDENTIFICADOR
#*******************************************************************************************
    INSERT INTO ProvinciasGalicia 
		VALUES	( 10, 'A Coruña' ),
				( 11, 'Lugo' ),
				( 12, 'Ourense' ),
				( 13, 'Pontevedra' );    
#*******************************************************************************************
#	DATOS DE LAS ComarcasGalicia
#*******************************************************************************************
	INSERT INTO	ComarcasGalicia
		VALUES 	( 100, 'Arzúa', 10 ),
				( 101, 'Barbanza', 10 ),
				( 102, 'A Barcala', 10 ),
                ( 103, 'Bergantiños', 10 ),
                ( 104, 'Betanzos', 10 ),
                ( 105, 'A Coruña', 10 ),
                ( 106, 'Eume', 10 ),
                ( 107, 'Ferrol', 10 ),
                ( 108, 'Fisterra', 10 ),
                ( 109, 'Muros', 10 ),
                ( 110, 'Noia', 10 ),
                ( 111, 'Ordes', 10 ),
                ( 112, 'Ortegal', 10 ),
                ( 113, 'Santiago', 10 ),
                ( 114, 'O Sar', 10 ),
                ( 115, 'Terra de Melide', 10 ),
                ( 116, 'Terra de Soneira', 10 ),
                ( 117, 'Xallas', 10 ),
                ( 100, 'Os Ancares', 11 ),
                ( 101, 'Chantada', 11 ),
                ( 102, 'A Fonsagrada', 11 ),
                ( 103, 'Lugo', 11 ),
                ( 104, 'A Mariña Central', 11 ),
                ( 105, 'A Mariña Occidental', 11 ),
                ( 106, 'A Mariña Oriental', 11 ),
                ( 107, 'Meira', 11 ),
                ( 108, 'Quiroga', 11 ),
                ( 109, 'Sarria', 11 ),
                ( 110, 'Terra Chá', 11 ),
                ( 111, 'Terra de Lemos', 11 ),
                ( 112, 'A Ulloa', 11 ),
                ( 100, 'Allariz-Maceda', 12 ),
                ( 101, 'Baixa Limia', 12 ),
                ( 102, 'O Carballiño', 12 ),
                ( 103, 'A Limia', 12 ),
                ( 104, 'Ourense', 12 ),
                ( 105, 'O Ribadeo', 12 ),
                ( 106, 'Terra de Caldelas', 12 ),
                ( 107, 'Terra de Celanova', 12 ),
                ( 108, 'Terra de Trives', 12 ),
                ( 109, 'Valdeorras', 12 ),
                ( 110, 'Verín', 12 ),
                ( 111, 'Viana', 12 ),
                ( 100, 'O Baixo Miño', 13 ),
                ( 101, 'Caldas', 13 ),
                ( 102, 'O Condado', 13 ),
                ( 103, 'Deza', 13 ),
                ( 104, 'O Morrazo', 13 ),
                ( 105, 'A Paradanta', 13 ),
                ( 106, 'Pontevedra', 13 ),
                ( 107, 'O Salnés', 13 ),
                ( 108, 'Tabeirós-Terra de Montes', 13 ),
                ( 109, 'Vigo', 13 );
#*******************************************************************************************
#	DATOS DE LOS CONCELLOS
#*******************************************************************************************
	ALTER TABLE ConcellosGalicia	AUTO_INCREMENT = 1000;
    INSERT INTO	ConcellosGalicia
		VALUES 	( 1000, 'Arzúa'							, 155.48	, 10,	 100 ),	# Arzúa
				( 1001, 'Boimorto'						,  82.34	, 10,	 100 ),
                ( 1002, 'O Pino'						, 132.15	, 10,	 100 ),
                ( 1003, 'Touro'							, 115.34	, 10,	 100 ),
                ( 1004, 'Boiro'							,  86.58	, 10,	 101 ),	# Barbanza
                ( 1005, 'A Pobra do Caramiñal'			,  32.51	, 10,	 101 ),
                ( 1006, 'Rizanxo'						,  58.79	, 10,	 101 ),
                ( 1007, 'Ribeira'						,  68.83	, 10,	 101 ),
                ( 1008, 'A Baña'						,  98.19	, 10,	 102 ),	# A Barcala
                ( 1009, 'Negreira'						, 115.1		, 10,	 102 ),
                ( 1010, 'Cabana de Bergantiños'			, 100.23	, 10,	 103 ),	# Bergantiños
                ( 1011, 'Carballo'						, 186.09	, 10,	 103 ),
                ( 1012, 'Coristanco'					, 141.28	, 10,	 103 ),
                ( 1013, 'A Laracha'						, 125.95	, 10,	 103 ),
                ( 1014, 'Laxe'							,  36.78	, 10,	 103 ),
                ( 1015, 'Malpica de Bergantiños'		,  61.22	, 10,	 103 ),
                ( 1016, 'Ponteceso'						,  91.97	, 10,	 103 ),
                ( 1017, 'Aranga'						, 119.59	, 10,	 104 ),	# Betanzos
                ( 1018, 'Betanzos'						,  24.21	, 10,	 104 ),
                ( 1019, 'Coirós'						,  33.6		, 10,	 104 ),
                ( 1020, 'Curtis'						, 116.7		, 10,	 104 ),
                ( 1021, 'Irixoa'						,  68.59	, 10,	 104 ),
                ( 1022, 'Miño'							,  32.97	, 10,	 104 ),
                ( 1023, 'Oza-Cesuras'					, 151.62	, 10,	 104 ),
                ( 1024, 'Paderne'						,  39.83	, 10,	 104 ),
                ( 1025, 'Vilarmaior'					,  30.35	, 10,	 104 ),
                ( 1026, 'Vilasantar'					,  59.17	, 10,	 104 ),
                ( 1027, 'Abegondo'						,  83.9		, 10,	 105 ),	# A Coruña
                ( 1028, 'Arteixo'						,  93.68	, 10,	 105 ),
                ( 1029, 'Bergondo'						,  32.72	, 10,	 105 ),
                ( 1030, 'Cambre'						,  40.74	, 10,	 105 ),
                ( 1031, 'Carral'						,  48.03	, 10,	 105 ),
                ( 1032, 'A Coruña'						,  37.83	, 10,	 105 ),
                ( 1033, 'Culleredo'						,  61.73	, 10,	 105 ),
                ( 1034, 'Oleiros'						,  43.66	, 10,	 105 ),
                ( 1035, 'Sada'							,  27.49	, 10,	 105 ),
                ( 1036, 'Cabanas'						,  30.3		, 10,	 106 ),	# EUME
                ( 1037, 'A Capela'						,  58		, 10,	 106 ),
                ( 1038, 'Monfero'						, 171.67	, 10,	 106 ),
                ( 1039, 'Pontedueme'					,  29.26	, 10,	 106 ),
                ( 1040, 'Pontes de García Rodríguez'	, 249.37	, 10,	 106 ),
                ( 1041, 'Ares'							,  18.31	, 10,	 107 ),	# FERROL
                ( 1042, 'Cedeira'						,  85.42	, 10,	 107 ),
                ( 1043, 'Fene'							,  26.31	, 10,	 107 ),
                ( 1044, 'Ferrol'						,  82.65	, 10,	 107 ),
                ( 1045, 'Moeche'						,  48.5		, 10,	 107 ),
                ( 1046, 'Mugardos'						,  12.77	, 10,	 107 ),
                ( 1047, 'Narón'							,  66.91	, 10,	 107 ),
                ( 1048, 'Neda'							,  24.46	, 10,	 107 ),
                ( 1049, 'San Sadurniño'					,  98.98	, 10,	 107 ),
                ( 1050, 'As Somozas'					,  70.91	, 10,	 107 ),
                ( 1051, 'Valdomiño'						,  88.22	, 10,	 107 ),
                ( 1052, 'Cee'							,  57.45	, 10,	 108 ),	# FISTERRA
                ( 1053, 'Corcubión'						,   6.52	, 10,	 108 ),
                ( 1054, 'Dumbría'						, 125.19	, 10,	 108 ),
                ( 1055, 'Fisterra'						,  29.43	, 10,	 108 ),
                ( 1056, 'Muxía'							, 121.19	, 10,	 108 ),
                ( 1057, 'Carnota'						,  70.9		, 10,	 109 ),	# MUROS
                ( 1058, 'Muros'							,  72.91	, 10,	 109 ),
                ( 1059, 'Lousame'						,  93.65	, 10,	 110 ),	# NOIA
                ( 1060, 'Noia'							,  37.21	, 10,	 110 ),
                ( 1061, 'Outes'							,  99.74	, 10,	 110 ),
                ( 1062, 'Porto do Son'					,  94.58	, 10,	 110 ),
                ( 1063, 'Cerceda'						, 111.27	, 10,	 111 ),	# ORDES
                ( 1064, 'Frades'						,  81.56	, 10,	 111 ),
                ( 1065, 'Mesía'							, 107.21	, 10,	 111 ),
                ( 1066, 'Ordes'							, 157.23	, 10,	 111 ),
                ( 1067, 'Oroso'							,  72.59	, 10,	 111 ),
                ( 1068, 'Tordoia'						, 124.55	, 10,	 111 ),
                ( 1069, 'Trazo'							, 101.3		, 10,	 111 ),
                ( 1070, 'Cariño'						,  47.19	, 10,	 112 ),	# ORTEGAL
                ( 1071, 'Cerdido'						,  52.72	, 10,	 112 ),
                ( 1072, 'Mañon'							,  82.21	, 10,	 112 ),
                ( 1073, 'Ortiguiera'					, 209.6 	, 10,	 112 ),
                ( 1074, 'Ames'							,  80.1 	, 10,	 113 ),	# SANTIAGO
                ( 1075, 'Boqueixón'						,  73.18	, 10,	 113 ),
                ( 1076, 'Brión'							,  74.73	, 10,	 113 ),
                ( 1077, 'Santiago de Compostela'		, 220.01	, 10,	 113 ),
                ( 1078, 'Teo'							,  79.25	, 10,	 113 ),
                ( 1079, 'Val do Dubra'					, 108.64	, 10,	 113 ),
                ( 1080, 'Vedra'							,  52.78	, 10,	 113 ),
                ( 1081, 'Dodro'							,  36.12	, 10,	 114 ),	# O SAR
                ( 1082, 'Padrón'						,  48.37	, 10,	 114 ),
                ( 1083, 'Rois'							,  92.93	, 10,	 114 ),
                ( 1084, 'Melide'						, 101.3		, 10,	 115 ),	# TERRA DE MELIDE
                ( 1085, 'Santiso'						,  67.39	, 10,	 115 ),
                ( 1086, 'Sobrado'						, 120.57	, 10,	 115 ),
                ( 1087, 'Toques'						,  77.93	, 10,	 115 ),
                ( 1088, 'Camariñas'						,  51.6 	, 10,	 116 ),	# TERRA DE SONEIRA
                ( 1089, 'Vimianzo'						, 187.27	, 10,	 116 ),
                ( 1090, 'Zas'							, 133.29	, 10,	 116 ),
                ( 1091, 'Mazaricos'						, 187.3 	, 10,	 117 ),	# XALLAS
                ( 1092, 'Santa Comba'					, 203.7 	, 10,	 117 ),
                
                ( 1000, 'Baralla'						, 141.16	, 11,	 100 ),	# OS ANCARES
                ( 1001, 'Becerreá'						, 172.05	, 11,	 100 ),
                ( 1002, 'Cervantes'						, 277.63	, 11,	 100 ),
                ( 1003, 'Navia de Suarna'				, 243.85	, 11,	 100 ),
                ( 1004, 'As Nogais'						, 110.34	, 11,	 100 ),
                ( 1005, 'Pedrafita do Cebreiro'			, 104.91	, 11,	 100 ),
                ( 1006, 'Carballedo'					, 138.85	, 11,	 101 ),	# CHANTADA
                ( 1007, 'Chantada'						, 176.73	, 11,	 101 ),
                ( 1008, 'Taboada'						, 146.67	, 11,	 101 ),
                ( 1009, 'Baleira'						, 168.82	, 11,	 102 ),	# A FONSAGRADA
                ( 1010, 'A Fonsagrada'					, 438.42	, 11,	 102 ),
                ( 1011, 'Negueira de Muñiz'				,  72.27	, 11,	 102 ),
                ( 1012, 'Castroverde'					, 174.15	, 11,	 103 ),	# LUGO
                ( 1013, 'O Corgo'						, 157.39	, 11,	 103 ),
                ( 1014, 'Friol'							, 292.29	, 11,	 103 ),
                ( 1015, 'Guntín'						, 154.78	, 11,	 103 ),
                ( 1016, 'Lugo'							, 329.78	, 11,	 103 ),
                ( 1017, 'Outiero de Rei'				, 134.2 	, 11,	 103 ),
                ( 1018, 'Portomarín'					, 115.1 	, 11,	 103 ),
                ( 1019, 'Rábade'						,   5.17	, 11,	 103 ),
                ( 1020, 'Alfoz'							,  77.5 	, 11,	 104 ),	# A MARIÑA CENTRAL
                ( 1021, 'Burela'						,   7.78	, 11,	 104 ),
                ( 1022, 'Foz'							, 100.29	, 11,	 104 ),
                ( 1023, 'Lourenzá'						,  62.64	, 11,	 104 ),
                ( 1024, 'Mondoñedo'						, 142.69	, 11,	 104 ),
                ( 1025, 'O Valadouro'					, 110.45	, 11,	 104 ),
                ( 1026, 'Cervo'							,  77.86	, 11,	 105 ),	# A MARIÑA OCCIDENTAL
                ( 1027, 'Ourol'							, 142.07	, 11,	 105 ),
                ( 1028, 'O Vicedo'						,  75.96	, 11,	 105 ),
                ( 1029, 'Viveiro'						, 109.34	, 11,	 105 ),
                ( 1030, 'Xove'							,  89.12	, 11,	 105 ),
                ( 1031, 'Barreiros'						,  72.42	, 11,	 106 ),	# A MARIÑA ORIENTAL
                ( 1032, 'A Pontenova'					, 135.8 	, 11,	 106 ),
                ( 1033, 'Ribadeo'						, 109.14	, 11,	 106 ),
                ( 1034, 'Trabada'						,  82.59	, 11,	 106 ),
                ( 1035, 'Meira'							,  46.55	, 11,	 107 ),	# MEIRA
                ( 1036, 'Pol'							, 125.9 	, 11,	 107 ),
                ( 1037, 'Ribeira de Piquín'				,  72.99	, 11,	 107 ),
                ( 1038, 'Riotorto'						,  66.33	, 11,	 107 ),
                ( 1039, 'Folgoso do courel'				, 193.32	, 11,	 108 ),	# QUIROGA
                ( 1040, 'Quiroga'						, 317.38	, 11,	 108 ),
                ( 1041, 'Ribas do Sil'					,  67.78	, 11,	 108 ),
                ( 1042, 'O Incio'						, 146.09	, 11,	 109 ),	# SARRIA
                ( 1043, 'Láncara'						, 121.61	, 11,	 109 ),
                ( 1044, 'Paradela'						, 121.12	, 11,	 109 ),
                ( 1045, 'O Páramo'						,  74.8 	, 11,	 109 ),
                ( 1046, 'Samos'							, 136.77	, 11,	 109 ),
                ( 1047, 'Sarria'						, 184.62	, 11,	 109 ),
                ( 1048, 'Triacastela'					,  51.18	, 11,	 109 ),
                ( 1049, 'Abadín'						, 196.04	, 11,	 110 ),	# TERRA CHÁ
                ( 1050, 'Begonte'						, 126.8 	, 11,	 110 ),
                ( 1051, 'Castro de Rei'					, 176.97	, 11,	 110 ),
                ( 1052, 'Cospeito'						, 144.79	, 11,	 110 ),
                ( 1053, 'Guitiriz'						, 293.97	, 11,	 110 ),
                ( 1054, 'Muras'							, 163.82	, 11,	 110 ),
                ( 1055, 'A Pastoriza'					, 174.99	, 11,	 110 ),
                ( 1056, 'Vilalba'						, 379.36	, 11,	 110 ),
                ( 1057, 'Xermade'						, 166.27	, 11,	 110 ),
                ( 1058, 'Bóveda'						,  91.11	, 11,	 111 ),	# TERRA DE LEMOS
                ( 1059, 'Monforte de Lemos'				, 199.52	, 11,	 111 ),
                ( 1060, 'Pantón'						, 143.24	, 11,	 111 ),
                ( 1061, 'A Pobra do Brollón'			, 176.71	, 11,	 111 ),
                ( 1062, 'O Saviñao'						, 196.55	, 11,	 111 ),
                ( 1063, 'Sober'							, 133.35	, 11,	 111 ),
                ( 1064, 'Antas de Ulla'					, 103.6 	, 11,	 112 ),	# A ULLOA
                ( 1065, 'Monterroso'					, 114.59	, 11,	 112 ),
                ( 1066, 'Palas de Rei'					, 199.68	, 11,	 112 ),
                
                ( 1000, 'Allariz'						,  86   	, 12,	 100 ),	# ALLARIZ-MACEDA
                ( 1001, 'Baños de Molgas'				,  67.64	, 12,	 100 ),
                ( 1002, 'Maceda'						, 101.93	, 12,	 100 ),
                ( 1003, 'Paderne de Allariz'			,  38.76	, 12,	 100 ),
                ( 1004, 'Xunqueira de Ambía'			,  60.21	, 12,	 100 ),
                ( 1005, 'Xunqueira de Espadanedo'		,  27.65	, 12,	 100 ),
                ( 1006, 'Bande'							,  98.96	, 12,	 101 ),	# BAIXA LIMIA
                ( 1007, 'Entrimo'						,  84.52	, 12,	 101 ),
                ( 1008, 'Lobeira'						,  68.88	, 12,	 101 ),
                ( 1009, 'Lobios'						, 168.38	, 12,	 101 ),
                ( 1010, 'Muíños'						, 109.56	, 12,	 101 ),
                ( 1011, 'Beariz'						,  55.97	, 12,	 102 ),	# O CARBALLIÑO
                ( 1012, 'Boborás'						,  87.82	, 12,	 102 ),
                ( 1013, 'O Carballiño'					,  54.33	, 12,	 102 ),
                ( 1014, 'O Irixo'						, 121.05	, 12,	 102 ),
                ( 1015, 'Maside'						,  40.04	, 12,	 102 ),
                ( 1016, 'Piñor'							,  52.69	, 12,	 102 ),
                ( 1017, 'Punxín'						,  17.08	, 12,	 102 ),
                ( 1018, 'San Amaro'						,  29.03	, 12,	 102 ),
                ( 1019, 'San Cristovo de Cea'			,  94.44	, 12,	 102 ),
                ( 1020, 'Baltar'						,  94.71	, 12,	 103 ),	# A LIMIA
                ( 1021, 'Os Blancos'					,  47.56	, 12,	 103 ),
                ( 1022, 'Calvos de Randín'				,  97.87	, 12,	 103 ),
                ( 1023, 'Porqueira'						,  43.4 	, 12,	 103 ),
                ( 1024, 'Rairiz de Veiga'				,  72.11	, 12,	 103 ),
                ( 1025, 'Sandiás'						,  52.84	, 12,	 103 ),
                ( 1026, 'Sarreaus'						,  77.29	, 12,	 103 ),
                ( 1027, 'Trasmiras'						,  56.74	, 12,	 103 ),
                ( 1028, 'Vilar de Barrio'				, 106.74	, 12,	 103 ),
                ( 1029, 'Vilar de Santos'				,  20.7 	, 12,	 103 ),
                ( 1030, 'Xinzo de Limia'				, 132.67	, 12,	 103 ),
                ( 1031, 'Amoeiro'						,  39.68	, 12,	 104 ),	# OURENSE
                ( 1032, 'Barbadás'						,  30.24	, 12,	 104 ),
                ( 1033, 'Coles'							,  38.11	, 12,	 104 ),
                ( 1034, 'Esgos'							,  37.79	, 12,	 104 ),
                ( 1035, 'Nogueira de Ramuín'			,  98.31	, 12,	 104 ),
                ( 1036, 'Ourense'						,  84.55	, 12,	 104 ),
                ( 1037, 'Pereiro de Aguiar'				,  60.89	, 12,	 104 ),
                ( 1038, 'A Peroxa'						,  54.52	, 12,	 104 ),
                ( 1039, 'San Cibrao das Viñas'			,  39.48	, 12,	 104 ),
                ( 1040, 'Taboadela'						,  25.19	, 12,	 104 ),
                ( 1041, 'Toén'							,  58.29	, 12,	 104 ),
                ( 1042, 'Vilamarín'						,  56.09	, 12,	 104 ),
                ( 1043, 'A Arnoia'						,  20.69	, 12,	 105 ),	# O RIBEIRO
                ( 1044, 'Avión'							, 121.13	, 12,	 105 ),
                ( 1045, 'Beade'							,   6.4 	, 12,	 105 ),
                ( 1046, 'Carballeda de Avia'			,  46.37	, 12,	 105 ),
                ( 1047, 'Castrelo de Miño'				,  39.74	, 12,	 105 ),
                ( 1048, 'Cenlle'						,  29.03	, 12,	 105 ),
                ( 1049, 'Cortegada'						,  26.89	, 12,	 105 ),
                ( 1050, 'Leiro'							,  38.25	, 12,	 105 ),
                ( 1051, 'Melón'							,  53.25	, 12,	 105 ),
                ( 1052, 'Ribadavia'						,  25.16	, 12,	 105 ),
                ( 1053, 'Castro Caldelas'				,  87.61	, 12,	 106 ),	# TERRA DE CALDELAS
                ( 1054, 'Montederramo'					, 135.57	, 12,	 106 ),
                ( 1055, 'Parada de Sil'					,  62.43	, 12,	 106 ),
                ( 1056, 'A Teixeira'					,  27.64	, 12,	 106 ),
                ( 1057, 'A Bola'						,  34.9 	, 12,	 107 ),	# TERRA DE CELANOVA
                ( 1058, 'Cartelle'						,  94.29	, 12,	 107 ),
                ( 1059, 'Celanova'						,  66.31	, 12,	 107 ),
                ( 1060, 'Gomesende'						,  28.31	, 12,	 107 ),
                ( 1061, 'A Merca'						,  50.99	, 12,	 107 ),
                ( 1062, 'Padrenda'						,  57.04	, 12,	 107 ),
                ( 1063, 'Pontedeva'						,   9.86	, 12,	 107 ),
                ( 1064, 'Quintela de Leirado'			,  31.26	, 12,	 107 ),
                ( 1065, 'Ramirás'						,  40.66	, 12,	 107 ),
                ( 1066, 'Verea'							,  94.23	, 12,	 107 ),
                ( 1067, 'Chandrexa de Queixa'			, 171.81	, 12,	 108 ),	# TERRA DE TRIVES
                ( 1068, 'Manzaneda'						, 114.57	, 12,	 108 ),
                ( 1069, 'A Pobra de Trives'				,  84.2 	, 12,	 108 ),
                ( 1070, 'San Xoán de Río'				,  61.14	, 12,	 108 ),
                ( 1071, 'O Barco de Valdeorras'			,  85.43	, 12,	 109 ),	# VALDEORRAS
                ( 1072, 'O Bolo'						,  91.17	, 12,	 109 ),
                ( 1073, 'Carballeda de Valdeorras'		, 222.69	, 12,	 109 ),
                ( 1074, 'Larouco'						,  23.69	, 12,	 109 ),
                ( 1075, 'Petín'							,  30.48	, 12,	 109 ),
                ( 1076, 'A Rúa'							,  35.91	, 12,	 109 ),
                ( 1077, 'Rubiá'							, 100.79	, 12,	 109 ),
                ( 1078, 'A Veiga'						, 290.49	, 12,	 109 ),
                ( 1079, 'Vilamartín de Valdeorras'		,  88.26	, 12,	 109 ),
                ( 1080, 'Castrelo do Val'				, 122.05	, 12,	 110 ),	# VERÍN
                ( 1081, 'Cualedro'						, 117.77	, 12,	 110 ),
                ( 1082, 'Laza'							, 215.91	, 12,	 110 ),
                ( 1083, 'Monterrei'						, 119.14	, 12,	 110 ),
                ( 1084, 'Oímbra'						,  71.48	, 12,	 110 ),
                ( 1085, 'Riós'							, 114.27	, 12,	 110 ),
                ( 1086, 'Verín'							,  94.11	, 12,	 110 ),
                ( 1087, 'Vilardevós'					, 152.55	, 12,	 110 ),
                ( 1088, 'A Gudiña'						, 171.42	, 12,	 111 ),	# VIANA
                ( 1089, 'A Mezquita'					, 104.27	, 12,	 111 ),
                ( 1090, 'Viana do Bolo'					, 270.41	, 12,	 111 ),
                ( 1091, 'Vilariño de Conso'				, 200.23	, 12,	 111 ),
                
                ( 1000, 'A Guarda'						,  20.5 	, 13,	 100 ),	# O BIAXO MIÑO
                ( 1001, 'Oia'							,  83.3 	, 13,	 100 ),
                ( 1002, 'O Rosal'						,  44.13	, 13,	 100 ),
                ( 1003, 'Tomiño'						, 106.61	, 13,	 100 ),
                ( 1004, 'Tui'							,  68.32	, 13,	 100 ),
                ( 1005, 'Caldas de Reis'				,  68.25	, 13,	 101 ),	# CALDAS
                ( 1006, 'Catoira'						,  29.44	, 13,	 101 ),
                ( 1007, 'Cuntis'						,  79.88	, 13,	 101 ),
                ( 1008, 'Moraña'						,  41.24	, 13,	 101 ),
                ( 1009, 'Pontecesures'					,   6.69	, 13,	 101 ),
                ( 1010, 'Portas'						,  22.71	, 13,	 101 ),
                ( 1011, 'Valga'							,  40.64	, 13,	 101 ),
                ( 1012, 'Mondariz'						,  82.33	, 13,	 102 ),	# O CONDADO
                ( 1013, 'Mondariz-Balneario'			,   2.31	, 13,	 102 ),
                ( 1014, 'As Neves'						,  65.84	, 13,	 102 ),
                ( 1015, 'Ponteareas'					, 125.53	, 13,	 102 ),
                ( 1016, 'Salvaterra do Miño'			,  62.54	, 13,	 102 ),
                ( 1017, 'Agolada'						, 147.85	, 13,	 103 ),	# DEZA
                ( 1018, 'Dozón'							,  74.1 	, 13,	 103 ),
                ( 1019, 'Lalín'							, 326.96	, 13,	 103 ),
                ( 1020, 'Rodeiro'						, 154.91	, 13,	 103 ),
                ( 1021, 'Silleda'						, 167.96	, 13,	 103 ),
                ( 1022, 'Vila de Cruces'				, 154.96	, 13,	 103 ),
                ( 1023, 'Bueu'							,  30.84	, 13,	 104 ),	# O MORRAZO
                ( 1024, 'Cangas'						,  38.08	, 13,	 104 ),
                ( 1025, 'Marín'							,  36.66	, 13,	 104 ),
                ( 1026, 'Moaña'							,  35.06	, 13,	 104 ),
                ( 1027, 'Arbo'							,  42.66	, 13,	 105 ),	# A PARADANTA
                ( 1028, 'A Cañiza'						, 105.04	, 13,	 105 ),
                ( 1029, 'Covelo'						, 134.7 	, 13,	 105 ),
                ( 1030, 'Crecente'						,  57.46	, 13,	 105 ),
                ( 1031, 'Barro'							,  37.55	, 13,	 106 ),	# PONTEVEDRA
                ( 1032, 'Campo Lameiro'					,  63.77	, 13,	 106 ),
                ( 1033, 'Cerdedo-Cotobade'				, 213.27	, 13,	 106 ),
                ( 1034, 'A Lama'						, 111.76	, 13,	 106 ),
                ( 1035, 'Poio'							,  33.93	, 13,	 106 ),
                ( 1036, 'Ponte Caldelas'				,  87   	, 13,	 106 ),
                ( 1037, 'Pontevedra'					, 118.47	, 13,	 106 ),
                ( 1038, 'Vilaboa'						,  36.9 	, 13,	 106 ),
                ( 1039, 'Cambados'						,  23.44	, 13,	 107 ),	# O SALNÉS
                ( 1040, 'O Grove'						,  21.89	, 13,	 107 ),
                ( 1041, 'A Illa de Arousa'				,   6.91	, 13,	 107 ),
                ( 1042, 'Meaño'							,  27.77	, 13,	 107 ),
                ( 1043, 'Meis'							,  52.39	, 13,	 107 ),
                ( 1044, 'Ribadumia'						,  19.71	, 13,	 107 ),
                ( 1045, 'Sanxenxo'						,  45.08	, 13,	 107 ),
                ( 1046, 'Vilagarcía de Arousa'			,  44.24	, 13,	 107 ),
                ( 1047, 'Vilanova de Arousa'			,  33.65	, 13,	 107 ),
                ( 1048, 'A Estrada'						, 280.74	, 13,	 108 ),	# TABEIRÓS-TERRA DE MONTES
                ( 1049, 'Forcarei'						, 169.66	, 13,	 108 ),
                ( 1050, 'Baiona'						,  34.47	, 13,	 109 ),	# VIGO
                ( 1051, 'Fornelo de Montes'				,  79.01	, 13,	 109 ),
                ( 1052, 'Gondomar'						,  74.51	, 13,	 109 ),
                ( 1053, 'Mos'							,  53.29	, 13,	 109 ),
                ( 1054, 'Nigrán'						,  34.77	, 13,	 109 ),
                ( 1055, 'Pazos de Borbén'				,  49.99	, 13,	 109 ),
                ( 1056, 'O Porriño'						,  61.17	, 13,	 109 ),
                ( 1057, 'Redondela'						,  52.08	, 13,	 109 ),
                ( 1058, 'Salceda de Caselas'			,  35.92	, 13,	 109 ),
                ( 1059, 'Soutomaior'					,  24.99	, 13,	 109 ),
                ( 1060, 'Vigo'							, 109.06	, 13,	 109 );	

#*******************************************************************************************
#	DATOS DE LA POBLACION
#*******************************************************************************************
    INSERT INTO PoblacionGalicia( año, Concello, mujeres, hombres, Provincia, Comarca )	
		VALUES 	( 2020, 1000,     3015,     2996, 10, 100 ), # Arzúa
				( 2020, 1001,      971,      988, 10, 100 ), # 
                ( 2020, 1002,     2304,     2348, 10, 100 ), # 
                ( 2020, 1003,     1768,     1748, 10, 100 ), # 
                ( 2020, 1004,     9708,     9176, 10, 101 ), # Barbanza
                ( 2020, 1005,     4774,     4544, 10, 101 ), # 
                ( 2020, 1006,     5645,     5368, 10, 101 ), # 
                ( 2020, 1007,    13609,    13239, 10, 101 ), # 
                ( 2020, 1008,     2007,     1804, 10, 102 ), # A Barcala
                ( 2020, 1009,     3506,     3282, 10, 102 ), # 
                ( 2020, 1010,     2183,     2033, 10, 103 ), # Bergantiños
                ( 2020, 1011,    16052,    15377, 10, 103 ), # 
                ( 2020, 1012,     3099,     2851, 10, 103 ), # 
                ( 2020, 1013,     5787,     5619, 10, 103 ), #
                ( 2020, 1014,     1489,     1501, 10, 103 ), #
                ( 2020, 1015,     2732,     2620, 10, 103 ), # 
                ( 2020, 1016,     2742,     2755, 10, 103 ), # 
                ( 2020, 1017,      886,      948, 10, 104 ), # Betanzaos
                ( 2020, 1018,     6864,     6189, 10, 104 ), # 
                ( 2020, 1019,      933,      920, 10, 104 ), # 
                ( 2020, 1020,     2011,     2042, 10, 104 ), # 
                ( 2020, 1021,      666,      674, 10, 104 ), # 
                ( 2020, 1022,     3133,     3144, 10, 104 ), # 
                ( 2020, 1023,     2523,     2573, 10, 104 ), # 
                ( 2020, 1024,     1208,     1175, 10, 104 ), # 
                ( 2020, 1025,      591,      618, 10, 104 ), # 
                ( 2020, 1026,      578,      633, 10, 104 ), # 
                ( 2020, 1027,     2733,     2665, 10, 105 ), # A Coruña
                ( 2020, 1028,    16487,    16251, 10, 105 ), # 
                ( 2020, 1029,     3419,     3242, 10, 105 ), # 
                ( 2020, 1030,    12641,    11953, 10, 105 ), # 
                ( 2020, 1031,     3297,     3176, 10, 105 ), # 
                ( 2020, 1032,   132828,   114776, 10, 105 ), # 
                ( 2020, 1033,    15881,    14804, 10, 105 ), # 
                ( 2020, 1034,    18880,    17654, 10, 105 ), # 
                ( 2020, 1035,     8267,     7919, 10, 105 ), # 
                ( 2020, 1036,     1676,     1598, 10, 106 ), # Eume
                ( 2020, 1037,      616,      605, 10, 106 ), # 
                ( 2020, 1038,      923,      984, 10, 106 ), # 
                ( 2020, 1039,     4054,     3699, 10, 106 ), # 
                ( 2020, 1040,     5166,     4902, 10, 106 ), # 
                ( 2020, 1041,     2970,     2859, 10, 107 ), # Ferrol
                ( 2020, 1042,     3350,     3326, 10, 107 ), # 
                ( 2020, 1043,     6718,     6150, 10, 107 ), # 
                ( 2020, 1044,    34675,    30885, 10, 107 ), # 
                ( 2020, 1045,      617,      569, 10, 107 ), # 
                ( 2020, 1046,     2681,     2534, 10, 107 ), # 
                ( 2020, 1047,    20177,    18879, 10, 107 ), # 
                ( 2020, 1048,     2575,     2448, 10, 107 ), # 
                ( 2020, 1049,     1406,     1378, 10, 107 ), # 
                ( 2020, 1050,      540,      543, 10, 107 ), # 
                ( 2020, 1051,     3667,     3175, 10, 107 ), # 
                ( 2020, 1052,     3944,     3606, 10, 108 ), # Fisterra
                ( 2020, 1053,      807,      783, 10, 108 ), # 
                ( 2020, 1054,     1525,     1410, 10, 108 ), # 
                ( 2020, 1055,     2316,     2381, 10, 108 ), # 
                ( 2020, 1056,     2372,     2224, 10, 108 ), # 
                ( 2020, 1057,     2055,     1844, 10, 109 ), # Muros
                ( 2020, 1058,     4357,     4070, 10, 109 ), # 
                ( 2020, 1059,     1644,     1624, 10, 110 ), # Noia
                ( 2020, 1060,     7434,     6840, 10, 110 ), # 
                ( 2020, 1061,     3190,     2965, 10, 110 ), # 
                ( 2020, 1062,     4594,     4548, 10, 110 ), # 
                ( 2020, 1063,     2534,     2474, 10, 111 ), # Ordes
                ( 2020, 1064,     1156,     1146, 10, 111 ), # 
                ( 2020, 1065,     1261,     1236, 10, 111 ), # 
                ( 2020, 1066,     6467,     6158, 10, 111 ), # 
                ( 2020, 1067,     3810,     3723, 10, 111 ), # 
                ( 2020, 1068,     1704,     1555, 10, 111 ), # 
                ( 2020, 1069,     1528,     1485, 10, 111 ), # 
                ( 2020, 1070,     1903,     1872, 10, 112 ), # Ortegal
                ( 2020, 1071,      555,      532, 10, 112 ), # 
                ( 2020, 1072,      668,      651, 10, 112 ), # 
                ( 2020, 1073,     2598,     2675, 10, 112 ), # 
                ( 2020, 1074,    16660,    15444, 10, 113 ), # Santiago
                ( 2020, 1075,     2131,     2075, 10, 113 ), # 
                ( 2020, 1076,     4118,     3805, 10, 113 ), # 
                ( 2020, 1077,    52376,    45472, 10, 113 ), # 
                ( 2020, 1078,     9497,     9135, 10, 113 ), # 
                ( 2020, 1079,     2005,     1846, 10, 113 ), # 
                ( 2020, 1080,     2544,     2462, 10, 113 ), # 
                ( 2020, 1081,     1426,     1324, 10, 114 ), # O Sar
                ( 2020, 1082,     4331,     4035, 10, 114 ), # 
                ( 2020, 1083,     2368,     2137, 10, 114 ), # 
                ( 2020, 1084,     3754,     3665, 10, 115 ), # Terra de Melide
                ( 2020, 1085,      742,      802, 10, 115 ), # 
                ( 2020, 1086,      830,      900, 10, 115 ), # 
                ( 2020, 1087,      533,      574, 10, 115 ), # 
                ( 2020, 1088,     2669,     2540, 10, 116 ), # Terra de Soneira
                ( 2020, 1089,     3615,     3348, 10, 116 ), # 
                ( 2020, 1090,     2281,     2112, 10, 116 ), # 
                ( 2020, 1091,     2020,     1821, 10, 117 ), # Xallas
                ( 2020, 1092,     4826,     4536, 10, 117 ), #                
                ( 2020, 1000,     1179,     1303, 11, 100 ), # Os Ancares
                ( 2020, 1001,     1404,     1403, 11, 100 ), # 
                ( 2020, 1002,      550,      744, 11, 100 ), # 
                ( 2020, 1003,      474,      588, 11, 100 ), # 
                ( 2020, 1004,      492,      555, 11, 100 ), # 
                ( 2020, 1005,      442,      527, 11, 100 ), # 
                ( 2020, 1006,     1066,     1073, 11, 101 ), # Chantada
                ( 2020, 1007,     4229,     3928, 11, 101 ), # 
                ( 2020, 1008,     1420,     1296, 11, 101 ), # 
                ( 2020, 1009,      570,      656, 11, 102 ), # A Fonsagrada
                ( 2020, 1010,     1616,     1773, 11, 102 ), # 
                ( 2020, 1011,       99,      116, 11, 102 ), # 
                ( 2020, 1012,     1253,     1342, 11, 103 ), # Lugo
                ( 2020, 1013,     1674,     1748, 11, 103 ), # 
                ( 2020, 1014,     1802,     1862, 11, 103 ), # 
                ( 2020, 1015,     1275,     1353, 11, 103 ), # 
                ( 2020, 1016,    52951,    45568, 11, 103 ), # 
                ( 2020, 1017,     2534,     2676, 11, 103 ), # 
                ( 2020, 1018,      678,      734, 11, 103 ), # 
                ( 2020, 1019,      758,      747, 11, 103 ), # 
                ( 2020, 1020,      856,      803, 11, 104 ), # A mariña central
                ( 2020, 1021,     4776,     4722, 11, 104 ), # 
                ( 2020, 1022,     5140,     4876, 11, 104 ), # 
                ( 2020, 1023,     1100,     1039, 11, 104 ), # 
                ( 2020, 1024,     1870,     1669, 11, 104 ), # 
                ( 2020, 1025,     1039,      939, 11, 104 ), # 
                ( 2020, 1026,     2144,     2074, 11, 105 ), # A mariña occidental
                ( 2020, 1027,      487,      508, 11, 105 ), # 
                ( 2020, 1028,      840,      816, 11, 105 ), # 
                ( 2020, 1029,     7852,     7539, 11, 105 ), # 
                ( 2020, 1030,     1646,     1631, 11, 105 ), # 
                ( 2020, 1031,     1513,     1412, 11, 106 ), # A mariña oriental
                ( 2020, 1032,     1148,     1053, 11, 106 ), # 
                ( 2020, 1033,     5169,     4691, 11, 106 ), # 
                ( 2020, 1034,      586,      541, 11, 106 ), #
                ( 2020, 1035,      865,      883, 11, 107 ), # Meira
                ( 2020, 1036,      814,      809, 11, 107 ), # 
                ( 2020, 1037,      245,      268, 11, 107 ), # 
                ( 2020, 1038,      618,      617, 11, 107 ), # 
                ( 2020, 1039,      487,      520, 11, 108 ), # Quiroga
                ( 2020, 1040,     1674,     1495, 11, 108 ), # 
                ( 2020, 1041,      461,      470, 11, 108 ), # 
                ( 2020, 1042,      736,      684, 11, 109 ), # Sarria
                ( 2020, 1043,     1257,     1327, 11, 109 ), # 
                ( 2020, 1044,      873,      866, 11, 109 ), # 
                ( 2020, 1045,      677,      667, 11, 109 ), # 
                ( 2020, 1046,      584,      662, 11, 109 ), # 
                ( 2020, 1047,     6862,     6476, 11, 109 ), # 
                ( 2020, 1048,      317,      320, 11, 109 ), # 
                ( 2020, 1049,     1178,     1144, 11, 110 ), # Terra Chá
                ( 2020, 1050,     1480,     1498, 11, 110 ), # 
                ( 2020, 1051,     2565,     2508, 11, 110 ), # 
                ( 2020, 1052,     2248,     2147, 11, 110 ), # 
                ( 2020, 1053,     2759,     2731, 11, 110 ), # 
                ( 2020, 1054,      312,      307, 11, 110 ), # 
                ( 2020, 1055,     1469,     1494, 11, 110 ), # 
                ( 2020, 1056,     7274,     6805, 11, 110 ), # 
                ( 2020, 1057,      908,      875, 11, 110 ), # 
                ( 2020, 1058,      708,      742, 11, 111 ), # Terra de Lemos
                ( 2020, 1059,     9635,     8712, 11, 111 ), # 
                ( 2020, 1060,     1238,     1219, 11, 111 ), # 
                ( 2020, 1061,      831,      801, 11, 111 ), # 
                ( 2020, 1062,     1787,     1847, 11, 111 ), # 
                ( 2020, 1063,     1134,     1126, 11, 111 ), # 
                ( 2020, 1064,      983,      957, 11, 112 ), # Ulloa
                ( 2020, 1065,     1820,     1279, 11, 112 ), # 
                ( 2020, 1066,     1646,     1680, 11, 112 ), #
                ( 2020, 1000,     3133,     3112, 12, 100 ), # Allariz-Maceda
                ( 2020, 1001,      750,      743, 12, 100 ), # 
                ( 2020, 1002,     1425,     1414, 12, 100 ), # 
                ( 2020, 1003,      693,      679, 12, 100 ), # 
                ( 2020, 1004,      679,      695, 12, 100 ), # 
                ( 2020, 1005,      378,      373, 12, 100 ), # 
                ( 2020, 1006,      749,      749, 12, 101 ), # Baixa Limia
                ( 2020, 1007,      580,      529, 12, 101 ), # 
                ( 2020, 1008,      391,      377, 12, 101 ), # 
                ( 2020, 1009,      839,      839, 12, 101 ), # 
                ( 2020, 1010,      725,      741, 12, 101 ), #
                ( 2020, 1011,      534,      436, 12, 102 ), # O Carballiño
                ( 2020, 1012,     1160,     1063, 12, 102 ), # 
                ( 2020, 1013,     7562,     6527, 12, 102 ), # 
                ( 2020, 1014,      746,      684, 12, 102 ), # 
                ( 2020, 1015,     1362,     1347, 12, 102 ), # 
                ( 2020, 1016,      577,      606, 12, 102 ), # 
                ( 2020, 1017,      359,      349, 12, 102 ), # 
                ( 2020, 1018,      541,      511, 12, 102 ), # 
                ( 2020, 1019,     1065,     1024, 12, 102 ), #
                ( 2020, 1020,      430,      512, 12, 103 ), # A Limia
                ( 2020, 1021,      350,      405, 12, 103 ), # 
                ( 2020, 1022,      360,      375, 12, 103 ), # 
                ( 2020, 1023,      438,      385, 12, 103 ), # 
                ( 2020, 1024,      601,      627, 12, 103 ), # 
                ( 2020, 1025,      635,      563, 12, 103 ), # 
                ( 2020, 1026,      575,      570, 12, 103 ), # 
                ( 2020, 1027,      632,      631, 12, 103 ), # 
                ( 2020, 1028,      629,      654, 12, 103 ), # 
                ( 2020, 1029,      410,      384, 12, 103 ), # 
                ( 2020, 1030,     4942,     4695, 12, 103 ), # 
                ( 2020, 1031,     1141,     1155, 12, 104 ), # Ourense
                ( 2020, 1032,     5708,     5450, 12, 104 ), # 
                ( 2020, 1033,     1516,     1559, 12, 104 ), # 
                ( 2020, 1034,      535,      568, 12, 104 ), # 
                ( 2020, 1035,      978,     1010, 12, 104 ), # 
                ( 2020, 1036,    57752,    47891, 12, 104 ), # 
                ( 2020, 1037,     3091,     3259, 12, 104 ), # 
                ( 2020, 1038,      920,      890, 12, 104 ), # 
                ( 2020, 1039,     2667,     2728, 12, 104 ), # 
                ( 2020, 1040,      698,      815, 12, 104 ), # 
                ( 2020, 1041,     1144,     1209, 12, 104 ), # 
                ( 2020, 1042,      897,      955, 12, 104 ), # 
                ( 2020, 1043,      488,      489, 12, 105 ), # O Ribeiro
                ( 2020, 1044,      938,      798, 12, 105 ), # 
                ( 2020, 1045,      186,      198, 12, 105 ), # 
                ( 2020, 1046,      652,      619, 12, 105 ), # 
                ( 2020, 1047,      665,      675, 12, 105 ), # 
                ( 2020, 1048,      557,      543, 12, 105 ), # 
                ( 2020, 1049,      539,      531, 12, 105 ), # 
                ( 2020, 1050,      781,      744, 12, 105 ), # 
                ( 2020, 1051,      600,      556, 12, 105 ), # 
                ( 2020, 1052,     2544,     2468, 12, 105 ), # 
                ( 2020, 1053,      590,      614, 12, 106 ), # Terra de Caldelas
                ( 2020, 1054,      327,      372, 12, 106 ), # 
                ( 2020, 1055,      254,      292, 12, 106 ), # 
                ( 2020, 1056,      157,      158, 12, 106 ), # 
                ( 2020, 1057,      595,      518, 12, 107 ), # Terra de Celanova
                ( 2020, 1058,     1319,     1270, 12, 107 ), # 
                ( 2020, 1059,     2993,     2651, 12, 107 ), # 
                ( 2020, 1060,      367,      347, 12, 107 ), # 
                ( 2020, 1061,      971,      941, 12, 107 ), # 
                ( 2020, 1062,      851,      820, 12, 107 ), # 
                ( 2020, 1063,      256,      238, 12, 107 ), # 
                ( 2020, 1064,      348,      282, 12, 107 ), # 
                ( 2020, 1065,      827,      724, 12, 107 ), # 
                ( 2020, 1066,      477,      435, 12, 107 ), # 
                ( 2020, 1067,      203,      269, 12, 108 ), # Terra de Tribes
                ( 2020, 1068,      433,      410, 12, 108 ), # 
                ( 2020, 1069,     1014,     1000, 12, 108 ), # 
                ( 2020, 1070,      247,      259, 12, 108 ), # 
                ( 2020, 1071,     6898,     6533, 12, 109 ), # Valdeorras
                ( 2020, 1072,      421,      429, 12, 109 ), # 
                ( 2020, 1073,      716,      783, 12, 109 ), # 
                ( 2020, 1074,      213,      204, 12, 109 ), # 
                ( 2020, 1075,      428,      421, 12, 109 ), # 
                ( 2020, 1076,     2163,     2120, 12, 109 ), # 
                ( 2020, 1077,      711,      672, 12, 109 ), # 
                ( 2020, 1078,      419,      438, 12, 109 ), # 
                ( 2020, 1079,      884,      928, 12, 109 ), # 
                ( 2020, 1080,      477,      481, 12, 110 ), # Verín
                ( 2020, 1081,      802,      866, 12, 110 ), # 
                ( 2020, 1082,      579,      644, 12, 110 ), # 
                ( 2020, 1083,     1241,     1451, 12, 110 ), # 
                ( 2020, 1084,      783,      937, 12, 110 ), # 
                ( 2020, 1085,      711,      750, 12, 110 ), # 
                ( 2020, 1086,     7089,     6558, 12, 110 ), # 
                ( 2020, 1087,      862,      940, 12, 110 ), # 
                ( 2020, 1088,      610,      626, 12, 111 ), # Viana
                ( 2020, 1089,      484,      529, 12, 111 ), # 
                ( 2020, 1090,     1395,     1423, 12, 111 ), # 
                ( 2020, 1091,      220,      304, 12, 111 ), #
                ( 2020, 1000,     5124,     4901, 13, 100 ), # O baixo miño
                ( 2020, 1001,     1539,     1510, 13, 100 ), # 
                ( 2020, 1002,     3197,     3092, 13, 100 ), # 
                ( 2020, 1003,     6739,     6827, 13, 100 ), # 
                ( 2020, 1004,     8914,     8409, 13, 100 ), # 
                ( 2020, 1005,     5076,     4699, 13, 101 ), # Caldas
                ( 2020, 1006,     1716,     1615, 13, 101 ), # 
                ( 2020, 1007,     2450,     2215, 13, 101 ), # 
                ( 2020, 1008,     2135,     2012, 13, 101 ), # 
                ( 2020, 1009,     1549,     1504, 13, 101 ), # 
                ( 2020, 1010,     1496,     1410, 13, 101 ), # 
                ( 2020, 1011,     2958,     2866, 13, 101 ), # 
                ( 2020, 1012,     2225,     2185, 13, 102 ), # O Condado
                ( 2020, 1013,      313,      324, 13, 102 ), # 
                ( 2020, 1014,     1965,     1838, 13, 102 ), # 
                ( 2020, 1015,    11819,    11121, 13, 102 ), # 
                ( 2020, 1016,     4991,     4999, 13, 102 ), # 
                ( 2020, 1017,     1151,     1153, 13, 103 ), # Deza
                ( 2020, 1018,      513,      560, 13, 103 ), # 
                ( 2020, 1019,    10343,     9864, 13, 103 ), # 
                ( 2020, 1020,     1179,     1214, 13, 103 ), # 
                ( 2020, 1021,     4565,     4296, 13, 103 ), # 
                ( 2020, 1022,     2630,     2578, 13, 103 ), # 
                ( 2020, 1023,     6072,     5878, 13, 104 ), # O Morrazo
                ( 2020, 1024,    13387,    13195, 13, 104 ), # 
                ( 2020, 1025,    12182,    12060, 13, 104 ), # 
                ( 2020, 1026,     9997,     9455, 13, 104 ), # 
                ( 2020, 1027,     1241,     1335, 13, 105 ), # A parandata
                ( 2020, 1028,     2612,     2510, 13, 105 ), # 
                ( 2020, 1029,     1170,     1198, 13, 105 ), # 
                ( 2020, 1030,     1021,      973, 13, 105 ), # 
                ( 2020, 1031,     1839,     1784, 13, 106 ), # Pontevedra
                ( 2020, 1032,      937,      841, 13, 106 ), # 
                ( 2020, 1033,     2926,     2771, 13, 106 ), # 
                ( 2020, 1034,     1205,     1192, 13, 106 ), # 
                ( 2020, 1035,     8611,     8462, 13, 106 ), # 
                ( 2020, 1036,     2863,     2670, 13, 106 ), # 
                ( 2020, 1037,    43916,    39344, 13, 106 ), # 
                ( 2020, 1038,     3027,     2892, 13, 106 ), # 
                ( 2020, 1039,     7091,     6630, 13, 107 ), # O Salnés
                ( 2020, 1040,     5340,     5178, 13, 107 ), # 
                ( 2020, 1041,     2483,     2449, 13, 107 ), # 
                ( 2020, 1042,     2729,     2593, 13, 107 ), # 
                ( 2020, 1043,     2485,     2270, 13, 107 ), # 
                ( 2020, 1044,     2621,     2484, 13, 107 ), # 
                ( 2020, 1045,     8806,     8608, 13, 107 ), # 
                ( 2020, 1046,    19576,    17989, 13, 107 ), # 
                ( 2020, 1047,     5279,     4960, 13, 107 ), # 
                ( 2020, 1048,    10580,     9771, 13, 108 ), # Taberiós-Terra de montes
                ( 2020, 1049,     1739,     1569, 13, 108 ), # 
                ( 2020, 1050,     6152,     5977, 13, 109 ), # Vigo
                ( 2020, 1051,      830,      768, 13, 109 ), # 
                ( 2020, 1052,     7399,     7303, 13, 109 ), # 
                ( 2020, 1053,     7635,     7428, 13, 109 ), # 
                ( 2020, 1054,     9035,     8710, 13, 109 ), # 
                ( 2020, 1055,     1510,     1455, 13, 109 ), # 
                ( 2020, 1056,    10190,     9910, 13, 109 ), # 
                ( 2020, 1057,    15039,    14202, 13, 109 ), # 
                ( 2020, 1058,     4593,     4580, 13, 109 ), # 
                ( 2020, 1059,     3724,     3702, 13, 109 ), # 
                ( 2020, 1060,   156528,   140164, 13, 109 ); #

	INSERT INTO PoblacionGalicia( año, Concello, mujeres, hombres, Provincia, Comarca )
		VALUES 	( 2021, 1000,     2983,     2981, 10, 100 ), # Arzúa
				( 2021, 1001,      971,      972, 10, 100 ),
				( 2021, 1002,     2290,     2349, 10, 100 ),
				( 2021, 1003,     1765,     1730, 10, 100 ),
				( 2021, 1004,     9749,     9206, 10, 101 ), # Barbanza
                ( 2021, 1005,     4748,     4543, 10, 101 ),
				( 2021, 1006,     5622,     5382, 10, 101 ),
				( 2021, 1007,    13605,    13234, 10, 101 ),
				( 2021, 1008,     1792,     1597, 10, 102 ), # A Barcala
                ( 2021, 1009,     3507,     3268, 10, 102 ),
				( 2021, 1010,     2163,     2022, 10, 103 ), # Bergantiños
                ( 2021, 1011,    16067,    15347, 10, 103 ),
				( 2021, 1012,     3054,     2824, 10, 103 ),
				( 2021, 1013,     5852,     5669, 10, 103 ),
                ( 2021, 1014,     1493,     1511, 10, 103 ),
                ( 2021, 1015,     2727,     2605, 10, 103 ),
                ( 2021, 1016,     2727,     2730, 10, 103 ),
				( 2021, 1017,      892,      941, 10, 104 ), # Betanzos
                ( 2021, 1018,     6843,     6187, 10, 104 ),
				( 2021, 1019,      944,      929, 10, 104 ),
				( 2021, 1020,     2033,     2048, 10, 104 ),
				( 2021, 1021,      663,      677, 10, 104 ),
				( 2021, 1022,     3209,     3214, 10, 104 ),
				( 2021, 1023,     2559,     2611, 10, 104 ),
				( 2021, 1024,     1208,     1185, 10, 104 ),
				( 2021, 1025,      593,      626, 10, 104 ),
				( 2021, 1026,      576,      643, 10, 104 ),
				( 2021, 1027,     2793,     2701, 10, 105 ), # A Coruña
                ( 2021, 1028,    16622,    16272, 10, 105 ),
				( 2021, 1029,     3486,     3331, 10, 105 ),
				( 2021, 1030,    12630,    11986, 10, 105 ),
				( 2021, 1031,     3342,     3232, 10, 105 ),
				( 2021, 1032,   131662,   113806, 10, 105 ),
				( 2021, 1033,    15938,    14820, 10, 105 ),
				( 2021, 1034,    19091,    17831, 10, 105 ),
				( 2021, 1035,     8376,     8006, 10, 105 ),
				( 2021, 1036,     1714,     1645, 10, 106 ), # Eume
                ( 2021, 1037,      625,      617, 10, 106 ),
				( 2021, 1038,      931,      977, 10, 106 ),
				( 2021, 1039,     4004,     3683, 10, 106 ),
				( 2021, 1040,     5132,     4900, 10, 106 ),
				( 2021, 1041,     3046,     2951, 10, 107 ), # Ferrol
                ( 2021, 1042,     3326,     3324, 10, 107 ),
				( 2021, 1043,     6718,     6114, 10, 107 ),
				( 2021, 1044,    34312,    30473, 10, 107 ),
                ( 2021, 1045,      627,      573, 10, 107 ),
				( 2021, 1046,     2684,     2542, 10, 107 ),
				( 2021, 1047,    20062,    18851, 10, 107 ),
				( 2021, 1048,     2581,     2451, 10, 107 ),
				( 2021, 1049,     1417,     1395, 10, 107 ),
				( 2021, 1050,      529,      547, 10, 107 ),
				( 2021, 1051,     3515,     3357, 10, 107 ),
				( 2021, 1052,     3951,     3617, 10, 108 ), # Fisterra
                ( 2021, 1053,      811,      795, 10, 108 ),
                ( 2021, 1054,     1522,     1405, 10, 108 ),
                ( 2021, 1055,     2321,     2393, 10, 108 ),
                ( 2021, 1056,     2371,     2193, 10, 108 ),
                ( 2021, 1057,     2033,     1821, 10, 109 ), # Muros
                ( 2021, 1058,     4351,     4048, 10, 109 ),
                ( 2021, 1059,     1617,     1618, 10, 110 ), # Noia
                ( 2021, 1060,     7430,     6810, 10, 110 ),
                ( 2021, 1061,     3193,     2957, 10, 110 ),
                ( 2021, 1062,     4598,     4557, 10, 110 ),
                ( 2021, 1063,     2530,     2466, 10, 111 ), # Ordes
				( 2021, 1064,     1171,     1135, 10, 111 ),
				( 2021, 1065,     1246,     1233, 10, 111 ),
				( 2021, 1066,     6445,     6160, 10, 111 ),
				( 2021, 1067,     3812,     3718, 10, 111 ),
				( 2021, 1068,     1694,     1534, 10, 111 ),
				( 2021, 1069,     1556,     1503, 10, 111 ),
				( 2021, 1070,     1908,     1855, 10, 112 ), # Ortegal
                ( 2021, 1071,      547,      528, 10, 112 ),
                ( 2021, 1072,      663,      646, 10, 112 ),
                ( 2021, 1073,     2891,     2594, 10, 112 ),
                ( 2021, 1074,    16614,    15379, 10, 113 ), # Santiago
                ( 2021, 1075,     2136,     2050, 10, 113 ),
                ( 2021, 1076,     4130,     3817, 10, 113 ),
                ( 2021, 1077,    52353,    45505, 10, 113 ),
                ( 2021, 1078,     9591,     9187, 10, 113 ),
                ( 2021, 1079,     1987,     1829, 10, 113 ),
                ( 2021, 1080,     2554,     2478, 10, 113 ),
                ( 2021, 1081,     1406,     1304, 10, 114 ), # O Sar
                ( 2021, 1082,     4306,     4011, 10, 114 ),
                ( 2021, 1083,     2348,     2145, 10, 114 ),
                ( 2021, 1084,     3766,     3661, 10, 115 ), # Terra de Melide
                ( 2021, 1085,      735,      794, 10, 115 ),
                ( 2021, 1086,      855,      923, 10, 115 ),
                ( 2021, 1087,      537,      564, 10, 115 ),
                ( 2021, 1088,     2672,     2552, 10, 116 ), # Terra de Soneira
                ( 2021, 1089,     3577,     3348, 10, 116 ),
                ( 2021, 1090,     2276,     2108, 10, 116 ),
                ( 2021, 1091,     1997,     1809, 10, 117 ), # Xallas
                ( 2021, 1092,     4821,     4538, 10, 117 ),
                ( 2021, 1000,     1166,     1279, 11, 100 ), # Os Ancares
                ( 2021, 1001,     1412,     1414, 11, 100 ),
                ( 2021, 1002,      546,      742, 11, 100 ),
                ( 2021, 1003,      457,      584, 11, 100 ),
                ( 2021, 1004,      477,      541, 11, 100 ),
                ( 2021, 1005,      431,      512, 11, 100 ),
                ( 2021, 1006,     1058,     1065, 11, 101 ), # Chantada
                ( 2021, 1007,     4203,     3931, 11, 101 ),
                ( 2021, 1008,     1400,     1289, 11, 101 ),
                ( 2021, 1009,      549,      641, 11, 102 ), # A Fonsagrada
                ( 2021, 1010,     1577,     1751, 11, 102 ),
                ( 2021, 1011,      103,      120, 11, 102 ),
                ( 2021, 1012,     1266,     1343, 11, 103 ), # Lugo
                ( 2021, 1013,     1674,     1766, 11, 103 ),
                ( 2021, 1014,     1808,     1874, 11, 103 ),
                ( 2021, 1015,     1284,     1354, 11, 103 ),
                ( 2021, 1016,    52574,    45039, 11, 103 ),
                ( 2021, 1017,     2531,     2685, 11, 103 ),
                ( 2021, 1018,      665,      717, 11, 103 ),
                ( 2021, 1019,      770,      754, 11, 103 ),
                ( 2021, 1020,      829,      781, 11, 104 ), # A mariña central
                ( 2021, 1021,     4711,     4717, 11, 104 ),
                ( 2021, 1022,     5198,     4880, 11, 104 ),
                ( 2021, 1023,     1097,     1032, 11, 104 ),
                ( 2021, 1024,     1851,     1629, 11, 104 ),
                ( 2021, 1025,     1025,      935, 11, 104 ),
                ( 2021, 1026,     2121,     2071, 11, 105 ), # A mariña occidental
                ( 2021, 1027,      478,      506, 11, 105 ),
                ( 2021, 1028,      845,      812, 11, 105 ),
                ( 2021, 1029,     7827,     7485, 11, 105 ),
                ( 2021, 1030,     1636,     1724, 11, 105 ),
                ( 2021, 1031,     1543,     1458, 11, 106 ), # A mariña oriental
                ( 2021, 1032,     1149,     1058, 11, 106 ),
                ( 2021, 1033,     5194,     4677, 11, 106 ),
                ( 2021, 1034,      576,      538, 11, 106 ),
                ( 2021, 1035,      855,      876, 11, 107 ), # Meira
                ( 2021, 1036,      818,      816, 11, 107 ),
                ( 2021, 1037,      243,      270, 11, 107 ),
                ( 2021, 1038,      606,      607, 11, 107 ),
                ( 2021, 1039,      477,      512, 11, 108 ), # Quiroga
                ( 2021, 1040,     1670,     1481, 11, 108 ),
                ( 2021, 1041,      465,      481, 11, 108 ),
                ( 2021, 1042,      750,      771, 11, 109 ), # Sarria
                ( 2021, 1043,     1246,     1305, 11, 109 ),
                ( 2021, 1044,      862,      861, 11, 109 ),
                ( 2021, 1045,      672,      675, 11, 109 ),
                ( 2021, 1046,      574,      648, 11, 109 ),
                ( 2021, 1047,     6811,     6446, 11, 109 ),
                ( 2021, 1048,      314,      313, 11, 109 ),
                ( 2021, 1049,     1153,     1144, 11, 110 ), # Terra Chá
                ( 2021, 1050,     1484,     1492, 11, 110 ),
                ( 2021, 1051,     2577,     2533, 11, 110 ),
                ( 2021, 1052,     2232,     2142, 11, 110 ),
                ( 2021, 1053,     2720,     2735, 11, 110 ),
                ( 2021, 1054,      301,      310, 11, 110 ),
                ( 2021, 1055,     1444,     1474, 11, 110 ),
                ( 2021, 1056,     7278,     6728, 11, 110 ),
                ( 2021, 1057,      901,      867, 11, 110 ),
                ( 2021, 1058,      689,      718, 11, 111 ), # Terra de Lemos
                ( 2021, 1059,     9567,     8675, 11, 111 ),
                ( 2021, 1060,     1224,     1205, 11, 111 ),
                ( 2021, 1061,      821,      794, 11, 111 ),
                ( 2021, 1062,     1784,     1805, 11, 111 ),
                ( 2021, 1063,     1143,     1100, 11, 111 ),
                ( 2021, 1064,      981,      954, 11, 112 ), # Ulloa
                ( 2021, 1065,     1791,     1771, 11, 112 ),
                ( 2021, 1066,     1637,     1679, 11, 112 ),
                ( 2021, 1000,     3180,     3134, 12, 100 ), # Allariz-Maceda
                ( 2021, 1001,      740,      743, 12, 100 ),
                ( 2021, 1002,     1433,     1416, 12, 100 ),
                ( 2021, 1003,      699,      674, 12, 100 ),
                ( 2021, 1004,      677,      689, 12, 100 ),
                ( 2021, 1005,      373,      365, 12, 100 ),
                ( 2021, 1006,      735,      755, 12, 101 ), # Baixa Limia
                ( 2021, 1007,      589,      539, 12, 101 ),
                ( 2021, 1008,      386,      383, 12, 101 ),
                ( 2021, 1009,      834,      838, 12, 101 ),
                ( 2021, 1010,      715,      732, 12, 101 ),
                ( 2021, 1011,      531,      440, 12, 102 ), # O Carballiño
                ( 2021, 1012,     1154,     1052, 12, 102 ),
                ( 2021, 1013,     7449,     6462, 12, 102 ),
                ( 2021, 1014,      727,      674, 12, 102 ),
                ( 2021, 1015,     1368,     1350, 12, 102 ),
                ( 2021, 1016,      565,      597, 12, 102 ),
                ( 2021, 1017,      364,      340, 12, 102 ),
                ( 2021, 1018,      546,      502, 12, 102 ),
                ( 2021, 1019,     1056,     1016, 12, 102 ),
                ( 2021, 1020,      423,      496, 12, 103 ), # A Limia
                ( 2021, 1021,      341,      404, 12, 103 ),
                ( 2021, 1022,      350,      367, 12, 103 ),
                ( 2021, 1023,      446,      381, 12, 103 ),
                ( 2021, 1024,      598,      625, 12, 103 ),
                ( 2021, 1025,      616,      565, 12, 103 ),
                ( 2021, 1026,      567,      547, 12, 103 ),
                ( 2021, 1027,      629,      632, 12, 103 ),
                ( 2021, 1028,      622,      636, 12, 103 ),
                ( 2021, 1029,      407,      384, 12, 103 ),
                ( 2021, 1030,     4939,     4682, 12, 103 ),
                ( 2021, 1031,     1154,     1179, 12, 104 ), # Ourense
                ( 2021, 1032,     5627,     5395, 12, 104 ),
                ( 2021, 1033,     1531,     1594, 12, 104 ),
                ( 2021, 1034,      545,      564, 12, 104 ),
                ( 2021, 1035,     1014,     1053, 12, 104 ),
                ( 2021, 1036,    57188,    47408, 12, 104 ),
                ( 2021, 1037,     3117,     3353, 12, 104 ),
                ( 2021, 1038,      920,      906, 12, 104 ),
                ( 2021, 1039,     2728,     2781, 12, 104 ),
                ( 2021, 1040,      714,      738, 12, 104 ),
                ( 2021, 1041,     1156,     1218, 12, 104 ),
                ( 2021, 1042,      904,      978, 12, 104 ),
                ( 2021, 1043,      479,      473, 12, 105 ), # O Ribeiro
                ( 2021, 1044,      948,      790, 12, 105 ),
                ( 2021, 1045,      181,      198, 12, 105 ),
                ( 2021, 1046,      639,      610, 12, 105 ),
                ( 2021, 1047,      653,      668, 12, 105 ),
                ( 2021, 1048,      552,      542, 12, 105 ),
                ( 2021, 1049,      538,      523, 12, 105 ),
                ( 2021, 1050,      767,      743, 12, 105 ),
                ( 2021, 1051,      587,      548, 12, 105 ),
                ( 2021, 1052,     2554,     2451, 12, 105 ),
                ( 2021, 1053,      583,      599, 12, 106 ), # Terra de Caldelas
                ( 2021, 1054,      327,      378, 12, 106 ),
                ( 2021, 1055,      256,      288, 12, 106 ),
                ( 2021, 1056,      164,      172, 12, 106 ),
                ( 2021, 1057,      567,      508, 12, 107 ), # Terra de Celanova
                ( 2021, 1058,     1305,     1265, 12, 107 ),
                ( 2021, 1059,     2999,     2653, 12, 107 ),
                ( 2021, 1060,      351,      342, 12, 107 ),
                ( 2021, 1061,      971,      968, 12, 107 ),
                ( 2021, 1062,      854,      799, 12, 107 ),
                ( 2021, 1063,      250,      241, 12, 107 ),
                ( 2021, 1064,      342,      272, 12, 107 ),
                ( 2021, 1065,      802,      705, 12, 107 ),
                ( 2021, 1066,      473,      441, 12, 107 ),
                ( 2021, 1067,      219,      263, 12, 108 ), # Terra de Tribes
                ( 2021, 1068,      431,      415, 12, 108 ),
                ( 2021, 1069,     1015,     1000, 12, 108 ),
                ( 2021, 1070,      243,      262, 12, 108 ),
                ( 2021, 1071,     6888,     6496, 12, 109 ), # Valdeorras
                ( 2021, 1072,      408,      420, 12, 109 ),
                ( 2021, 1073,      701,      759, 12, 109 ),
                ( 2021, 1074,      219,      208, 12, 109 ),
                ( 2021, 1075,      443,      436, 12, 109 ),
                ( 2021, 1076,     2136,     2109, 12, 109 ),
                ( 2021, 1077,      708,      682, 12, 109 ),
                ( 2021, 1078,      434,      452, 12, 109 ),
                ( 2021, 1079,      897,      940, 12, 109 ),
                ( 2021, 1080,      490,      489, 12, 110 ), # Verín
                ( 2021, 1081,      779,      860, 12, 110 ),
                ( 2021, 1082,      590,      632, 12, 110 ),
                ( 2021, 1083,     1221,     1280, 12, 110 ),
                ( 2021, 1084,      777,      936, 12, 110 ),
                ( 2021, 1085,      710,      749, 12, 110 ),
                ( 2021, 1086,     7100,     6544, 12, 110 ),
                ( 2021, 1087,      843,      938, 12, 110 ),
                ( 2021, 1088,      607,      625, 12, 111 ), # Viana
                ( 2021, 1089,      478,      528, 12, 111 ),
                ( 2021, 1090,     1372,     1415, 12, 111 ),
                ( 2021, 1091,      220,      293, 12, 111 ),
                ( 2021, 1000,     5095,     4896, 13, 100 ), # O baixo miño
                ( 2021, 1001,     1567,     1537, 13, 100 ),
                ( 2021, 1002,     3237,     3139, 13, 100 ),
                ( 2021, 1003,     6838,     6892, 13, 100 ),
                ( 2021, 1004,     8952,     8446, 13, 100 ),
                ( 2021, 1005,     5060,     4728, 13, 101 ), # Caldas
                ( 2021, 1006,     1712,     1604, 13, 101 ),
                ( 2021, 1007,     2429,     2214, 13, 101 ),
                ( 2021, 1008,     2123,     1998, 13, 101 ),
                ( 2021, 1009,     1570,     1511, 13, 101 ),
                ( 2021, 1010,     1475,     1385, 13, 101 ),
                ( 2021, 1011,     2933,     2835, 13, 101 ),
                ( 2021, 1012,     2217,     2177, 13, 102 ), # O Condado
                ( 2021, 1013,      332,      343, 13, 102 ),
                ( 2021, 1014,     1920,     1850, 13, 102 ),
                ( 2021, 1015,    11821,    11121, 13, 102 ),
                ( 2021, 1016,     5021,     5027, 13, 102 ),
                ( 2021, 1017,     1113,     1115, 13, 103 ), # Deza
                ( 2021, 1018,      507,      550, 13, 103 ),
                ( 2021, 1019,    10344,     9855, 13, 103 ),
                ( 2021, 1020,     1169,     1192, 13, 103 ),
                ( 2021, 1021,     4549,     4296, 13, 103 ),
                ( 2021, 1022,     2566,     2531, 13, 103 ),
                ( 2021, 1023,     6098,     5889, 13, 104 ), # O Morrazo
                ( 2021, 1024,    13443,    13265, 13, 104 ),
                ( 2021, 1025,    12153,    12095, 13, 104 ),
                ( 2021, 1026,    10027,     9469, 13, 104 ),
                ( 2021, 1027,     1249,     1350, 13, 105 ), # A parandata
                ( 2021, 1028,     2603,     2512, 13, 105 ),
                ( 2021, 1029,     1191,     1264, 13, 105 ),
                ( 2021, 1030,     1009,      952, 13, 105 ),
                ( 2021, 1031,     1844,     1778, 13, 106 ), # Pontevedra
                ( 2021, 1032,      938,      831, 13, 106 ),
                ( 2021, 1033,     2939,     2780, 13, 106 ),
                ( 2021, 1034,     1215,     1195, 13, 106 ),
                ( 2021, 1035,     8684,     8546, 13, 106 ),
                ( 2021, 1036,     2863,     2685, 13, 106 ),
                ( 2021, 1037,    43800,    39314, 13, 106 ),
                ( 2021, 1038,     3040,     2915, 13, 106 ),
                ( 2021, 1039,     7073,     6600, 13, 107 ), # O Salnés
                ( 2021, 1040,     5450,     5249, 13, 107 ),
                ( 2021, 1041,     2516,     2435, 13, 107 ),
                ( 2021, 1042,     2723,     2591, 13, 107 ),
                ( 2021, 1043,     2485,     2311, 13, 107 ),
                ( 2021, 1044,     2641,     2516, 13, 107 ),
                ( 2021, 1045,     8924,     8711, 13, 107 ),
                ( 2021, 1046,    19546,    17999, 13, 107 ),
                ( 2021, 1047,     5310,     4996, 13, 107 ),
                ( 2021, 1048,    10525,     9736, 13, 108 ), # Taberiós-Terra de montes
                ( 2021, 1049,     1711,     1557, 13, 108 ),
                ( 2021, 1050,     6243,     6043, 13, 109 ), # Vigo
                ( 2021, 1051,      828,      766, 13, 109 ),
                ( 2021, 1052,     7483,     7437, 13, 109 ),
                ( 2021, 1053,     7692,     7498, 13, 109 ),
                ( 2021, 1054,     9148,     8857, 13, 109 ),
                ( 2021, 1055,     1516,     1459, 13, 109 ),
                ( 2021, 1056,    10297,     9915, 13, 109 ),
                ( 2021, 1057,    15042,    14150, 13, 109 ),
                ( 2021, 1058,     4614,     4635, 13, 109 ),
                ( 2021, 1059,     3749,     3733, 13, 109 ),
                ( 2021, 1060,   155203,   138634, 13, 109 );



#SHOW CREATE TABLE	ProvinciasGalicia;
#SHOW CREATE TABLE	ComarcasGalicia;
#SHOW CREATE TABLE	ConcellosGalicia;
#SHOW CREATE TABLE	PoblacionGalicia;

SELECT * FROM	ProvinciasGalicia;
SELECT * FROM	ComarcasGalicia;
SELECT * FROM	ConcellosGalicia;
SELECT * FROM	PoblacionGalicia;

    
    