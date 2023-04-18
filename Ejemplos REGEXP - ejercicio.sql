#------------------------------------------------------------------------
#	CREAMOS LA BASE DE DATOS 'EJEMPLO'
#------------------------------------------------------------------------
DROP DATABASE IF EXISTS Ejemplo;
CREATE DATABASE Ejemplo;
USE Ejemplo;
#------------------------------------------------------------------------
# 	CREAMOS LA TABLA PERSONA CON UN ÚNICO CAMPO 'Nombre' EN EL QUE VOLCAREMOS DATOS.
#------------------------------------------------------------------------
CREATE TABLE Persona (
	Nombre varchar (20)
);
#------------------------------------------------------------------------
# 	AGREGAMOS DATOS A LA TABLA PERSONA
#------------------------------------------------------------------------
	insert into Persona values ('Engracia'),('Jacinta'), ('Jacinto'),('Jaden'),('Jela'),('Geni'),('Cela'),
		('María'),('Mario'),('Narciso'),('Obdulia'),('Serafin'),('Incógnito'),('Onofrio'),('Enetenguen');

#------------------------------------------------------------------------
#   1. Muestra todos los nombres de las personas.
#------------------------------------------------------------------------
SELECT * FROM Persona;
#------------------------------------------------------------------------
#   2. Muestra todos los nombres que empiecen por la letra 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP '^o';
#------------------------------------------------------------------------
#   3. Muestra todos los nombres que contengan la letra 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'o{1,10}';
#------------------------------------------------------------------------
#   4. Muestra todos los nombres que acaben por la letra 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'o$';

#------------------------------------------------------------------------
#   5. Muestra todos los nombres que empiecen por la letra 'n' o por la 'n'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP '^n|^m';

#------------------------------------------------------------------------
#   6. Muestra todos los nombres que contengan la letra 'n' o la letra 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'n|o';

#------------------------------------------------------------------------
#   7. Muestra todos los nombres que NO contengan las letra 'n' NI la 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
not REGEXP 'n|o';

#------------------------------------------------------------------------
#   8. Muestra todos los nombres que acaben por la letra 'n' o por la 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'n$|o$';

#------------------------------------------------------------------------
#   9. Muestra todos los nombres que NO empiecen por la letra 'n' NI por la 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
not REGEXP '^n|^o';

#------------------------------------------------------------------------
#  10. Muestra todos los nombres que NO acaben por la letra 'n' NI por la 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
not REGEXP 'n$|o$';

#------------------------------------------------------------------------
#  11. Muestra todos los nombres que empiecen por 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP '^en';

#------------------------------------------------------------------------
#  12. Muestra todos los nombres que NO empiecen por 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
not REGEXP '^en';

#------------------------------------------------------------------------
#  13. Muestra todos los nombres que contengan 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'en';

#------------------------------------------------------------------------
#  14. Muestra todos los nombres que no contengan 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
not REGEXP 'en';

#------------------------------------------------------------------------
#  15. Muestra todos los nombres que acaben por 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'en$';

#------------------------------------------------------------------------
#  16. Muestra todos los nombres que NO acaben por 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
not REGEXP 'en$';

#------------------------------------------------------------------------
#  17. Muestra todos los nombres que empiecen, contengan o acaben por 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP '^en|en|en$';

#------------------------------------------------------------------------
#  18. Muestra los nombres que 'Jela' y 'Geni'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'jela|geni';

#------------------------------------------------------------------------
#  19. Muestra todos los nombres que empiecen por 'ja' o por 'ge'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP '^(ja|ge)'
group by 1;

#------------------------------------------------------------------------
#  20. Muestra todos los nombres que contengan 'el' o 'en'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP 'el|en';

#------------------------------------------------------------------------
#  21. Muestra todos los nombres que acaben por 'ia' o por 'in'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
REGEXP '(ia|in)$'
group by 1;

#------------------------------------------------------------------------
#  22. Muestra todos los nombres cuya segunda letra sea 'a' o 'e' y finalicen por 'a' u 'o'.
#------------------------------------------------------------------------
SELECT * FROM Persona
WHERE Nombre
#REGEXP '.(a|e)*o$';
#REGEXP '^(.a|.e).*(a|o)$';
REGEXP '.(a|e).*(a|o)$';
   