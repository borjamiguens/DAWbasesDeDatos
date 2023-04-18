use concellosGalicia_debilidadxexistencia;
show tables;

select * from concellosgalicia;
select * from poblaciongalicia;

select distinct comarcasgalicia.nombre,superficie from comarcasgalicia, concellosgalicia 
	where comarcasgalicia.comarca=concellosgalicia.comarca and superficie<(select avg(superficie) from concellosgalicia)
    #where superficie<(select avg(superficie) from concellosgalicia)
    order by superficie asc;
    
select distinct comarcasgalicia.nombre,superficie from comarcasgalicia, concellosgalicia
	where comarcasgalicia.comarca=concellosgalicia.comarca and superficie<(select avg(superficie)from concellosgalicia)
    order by superficie desc;
    
#MUESTRA LOS CONCELLOS DE GALICIA CON MENOR DATO DE POBLACIÓN

select concellosgalicia.nombre, (hombres+mujeres) as 'POBLACIÓN' from concellosgalicia,poblaciongalicia
	where poblaciongalicia.concello=concellosgalicia.concello and año =2021 and (hombres + mujeres)#> (select avg(hombres+mujeres) from poblaciongalicia)
    order by hombres+mujeres desc
    limit 0,5;

#---------------------------------------------------------------------------------------------------------------
# NOMBRE DE LAS COMARCAS CUYOS CONCELLOS TIENEN UNA SUPERFICIE INFERIOR A LA MEDIA
#---------------------------------------------------------------------------------------------------------------

# PERTENENCIA A UN CONJUNTO
	select nombre from comarcasgalicia
		where comarca in (select comarca from concellosgalicia
			where superficie < (select avg(superficie) from concellosgalicia))
		order by 1;
# COMPARACIÓN    
	select distinct comarcasgalicia.nombre from comarcasgalicia inner join concellosgalicia
		on comarcasgalicia.comarca = concellosgalicia.comarca
       # and superficie < (select avg(superficie) from concellosgalicia)
       and superficie < ( select sum(superficie)/count(*) from concellosgalicia)
       order by comarcasgalicia.nombre;
        
# CUANTIFICADA (ANY,ALL)
	select distinct comarcasgalicia.nombre from comarcasgalicia, concellosgalicia
		where comarcasgalicia.comarca = concellosgalicia.comarca and 
        superficie < ALL (select avg(concellosgalicia.superficie) from concellosgalicia )
        #superficie < all(select superficie from concellosgalicia where superficie >=  (select avg(concellosgalicia.superficie) from concellosgalicia ))
        order by 1;
        
	select distinct comarcasgalicia.nombre from comarcasgalicia, concellosgalicia
		where comarcasgalicia.comarca = concellosgalicia.comarca and 
        superficie < ANY (select avg(concellosgalicia.superficie) from concellosgalicia )#superficie < que cualquiera de todos los datos dentro de ()
        #superficie = ANY (select avg(concellosgalicia.superficie) from concellosgalicia )
        #superficie in (select superficie from concellosgalicia where superficie < (select avg(concellosgalicia.superficie) from concellosgalicia )
        order by 1;
        
	
#---------------------------------------------------------------------------------------------------------------
# MUESTRA LOS CONCELLOS DE GALICIA CON MENOR DATO DE POBLACIÓN
#---------------------------------------------------------------------------------------------------------------
# PERTENENCIA A UN CONJUNTO
	select * from concellosgalicia 
		where concello in (select concello from poblaciongalicia
							where mujeres+hombres in (select min(mujeres+hombres) from poblaciongalicia));
# COMPARACIÓN    
	select * from concellosgalicia 
		where concello = (select concello from poblaciongalicia
							where mujeres+hombres = (select min(mujeres+hombres) from poblaciongalicia));
	
# CUANTIFICADA
	select * from concellosgalicia 
		where concello = any (select concello from poblaciongalicia
							where mujeres+hombres <= ALL (select min(mujeres+hombres) from poblaciongalicia));#probar con any

#---------------------------------------------------------------------------------------------------------------
# MUESTRA LOS CONCELLOS DE GALICIA CON MAYOR DATO DE POBLACIÓN QUE EL CONCELLO DE VIGO
#---------------------------------------------------------------------------------------------------------------
select * from poblaciongalicia;
select concellosgalicia.nombre from concellosgalicia,poblaciongalicia
	where (hombres+mujeres)<(select (hombres+mujeres) from poblaciongalicia where poblaciongalicia.concello=(select concellosgalicia.concello from concellosgalicia where concellosgalicia.concello='Vigo'));
# PERTENENCIA A UN CONJUNTO
	#select * from concellosgalicia 

# COMPARACIÓN    
	select * from concellosgalicia
		where concello in (select concello from poblaciongalicia
						where mujeres+hombres > (select max(mujeres+hombres) from poblaciongalicia
												where concello=(select concello from concellosgalicia where nombre='vigo'))
                                                );
                                                
#si quisiera los concellos con más mujeres que hombres


# CUANTIFICADA

#---------------------------------------------------------------------------------------------------------------
# MUESTRA LAS COOMARCAS DE GALICIA CON MAYOR DATO DE POBLACIÓN QUE LA DE VIGO
#---------------------------------------------------------------------------------------------------------------
# PERTENENCIA A UN CONJUNTO


# COMPARACIÓN    


# CUANTIFICADA

