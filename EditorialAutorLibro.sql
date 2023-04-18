#******************************************************
#
#******************************************************
DROP DATABASE  IF EXISTS EditorialLibroAutor;
CREATE DATABASE EditorialLibroAutor;
USE EditorialLibroAutor;

#******************************************************
#
#******************************************************
CREATE TABLE Editorial
( 	CodEditorial int(6) 	PRIMARY KEY,
	Nombre varchar(20) 		NOT NULL,
	Dirección varchar(100) 	NOT NULL,
    Tf int(9) 				NOT NULL,
    País varchar(20) 		NOT NULL
    
);

CREATE TABLE Libro
( 	ISBN int(8),
	Título varchar(20) 		NOT NULL,
	Argumento varchar(100) 	NOT NULL,
    Idioma varchar(20) 		NOT NULL,
    CodEditorial int(6) 	NOT NULL,
    PRIMARY KEY (ISBN),
    FOREIGN KEY (CodEditorial) REFERENCES Editorial(CodEditorial)
    
);

#alter table editorial ADD PRIMARY KEY (CodEditorial)




CREATE TABLE Autor
( 	CodAutor int(6) 			PRIMARY KEY ,
	Nombre varchar(20) 			NOT NULL,
	Nacionalidad varchar(30) 	NOT NULL
    
);


CREATE TABLE Escribe
( 	CodAutor int(7),
	ISBN int(8),
    PRIMARY KEY( CodAutor, ISBN ),
    FOREIGN KEY (CodAutor) REFERENCES Autor(CodAutor),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
);


#INSERT INTO Persona( nombre , apellidos ) VALUES ( "Borja", "Miguéns Suárez" );
#INSERT INTO Persona( nombre , apellidos ) VALUES ( "Sancho", "García Rodríguez" );
#INSERT INTO Persona( nombre , apellidos ) VALUES ( "Iago", "Miguéns Suárez" );
#select * from Persona;

