#------------------------------------------------------
#	BASE DE DATOS DIAMANTES
#------------------------------------------------------
use diamantes;
#------------------------------------------------------
#	MOSTRAMOS TODAS LAS TABLAS
#------------------------------------------------------
show tables;
#------------------------------------------------------
#	MOSTRAMOS TODOS LOS DATOS ALMADENADOS
#------------------------------------------------------
select * from diamante;
#------------------------------------------------------
#	1. Clasificamos los diamantes por tipo de TALLADO
#------------------------------------------------------
select tallado as 'tipo', count(*) from diamante
group by tallado
order by tallado;

#rename  table vistadiamantesfair   to talladofair;
create view talladoFair as
select Diamanteid, quilates,color,claridad,profundidad,tabla, precio,x,y,z from diamante
	where tallado='Fair';
    
create view talladoGood as
select Diamanteid, quilates,color,claridad,profundidad,tabla, precio,x,y,z from diamante
	where tallado='Good';

create view talladoIdeal as
select Diamanteid, quilates,color,claridad,profundidad,tabla, precio,x,y,z from diamante
	where tallado='Ideal';
    
create view talladoPremium as
select Diamanteid, quilates,color,claridad,profundidad,tabla, precio,x,y,z from diamante
	where tallado='Premium';

create view talladoVeryGood as
select Diamanteid, quilates,color,claridad,profundidad,tabla, precio,x,y,z from diamante
	where tallado='Very Good';

    
select count(*) from talladopremium;

select * from talladopremium inner join talladoverygood on talladopremium.precio=talladoverygood.precio;

select * from talladopremium left outer join talladoverygood on talladopremium.precio=talladoverygood.precio;
select * from talladopremium right outer join talladoverygood on talladopremium.precio=talladoverygood.precio;

select 	(select count(*) from talladofair)as 'fair' , 
		(select count(*) from talladogood) as 'good',
        (select count(*) from talladoideal)as 'ideal' , 
		(select count(*) from talladopremium) as 'premium',
        (select count(*) from talladoverygood)as 'verygood'
        ;

select * from talladoGood
	union
select * from talladofair
	union
select * from talladoideal
	union
select * from talladopremium
	union
select * from talladoverygood;

#------------------------------------------------------
#	2. Clasificamos los diamantes por tipo de COLOR
#------------------------------------------------------
select color, count(*) from diamante
group by color
order by color;
#------------------------------------------------------
#	3. Clasificamos los diamantes por QUILATES
#------------------------------------------------------
 
#------------------------------------------------------
#	4. Clasificamos los diamantes por DINERO
#------------------------------------------------------
set sql_mode ="STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";
select * from(select DiamanteId,quilates,tallado,color,claridad,profundidad,tabla,x,y,z from diamante
	where truncate(precio/10)








