use concellosgalicia_debilidadxExistencia;
select * from poblacionGalicia;

# Muestra los datos del número de mujeres que acaben en 0
	#where mujeres
	#regexp "(.*0$)";
	#like "%0";
# Muestra los datos del número de hombres cuyo segundo dígito sea un 0.
	#where hombres
	#regexp "^(.0)";
    #like "_0%";
# Muestra los datos en los que el antepenúltimo dígito de las mujeres sea un 3 y el penúltimo de los hombres sea un 8.
	#where hombres regexp "(8.)$" and mujeres regexp "(3..)$";
    #where mujeres like "%3__" and hombres like "%8_";
# Muesta los datos en los que tanto el número de mujeres como el de hombres contenga 13.
	#where hombres regexp "(13)" and mujeres regexp "(13)";
    #where hombres like "%13%" and mujeres like "%13%";
# Muestra los datos en los que el número de mujeres contenga un 10 y el de hombres no.
	#where hombres not regexp "(10)" and mujeres regexp "(10)";
    #where hombres not like "%10%" and mujeres like "%10%";
    
select * from ConcellosGalicia
	where nombre
# Muestra los datos de los Concellos que tengan dos vocales seguidas.
	#where nombre
    #regexp "[aeiou][aeiou]";

# Muestra los datos de los Concellos que empiecen y no acaben por 'a'.
	#where nombre 
    #regexp "^a.*[^a]$";
# Muestra los datos de los Concellos que contengan 'ra', 'es', 'de', 'me'.
	#regexp "(ra|es|de|me)";
    #like "%ra%" or nombre like "%ra%" or nombre like "%de%" or nombre like "%me%";
# Muestra los datos de los Concellos que contengan tres aes.
	#regexp "(a.*){3,3}" and nombre not regexp "(a.*){4,6}";
# Muestra los datos de los Concellos que contengan dos erres.
	#regexp "(r.*){2,2}";
# Muestra los datos de los Concellos que contengan dos aes y tres oes.
	#regexp "(a.*){2,2}" and nombre not regexp "(a.*){3,6}" and nombre regexp "(o.*){3,3}" and nombre not regexp "(o.*){4,6}";