#Realización de consultas resumen - Agrupaciones Group By
set sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SELECT quilates, count(*) AS cantidad FROM diamantes.diamante
GROUP BY quilates
ORDER BY quilates;

#tallado y color y número
SELECT tallado, color , count(*) AS cantidad FROM diamantes.diamante
GROUP BY tallado, color
ORDER BY tallado;

#color y número
SELECT color , count(*) AS cantidad FROM diamantes.diamante
GROUP BY color
ORDER BY color;

#quilates, tallado....
SELECT quilates, tallado, color, claridad, profundidad, tabla , count(*) AS cantidad FROM diamantes.diamante
GROUP BY quilates, tallado, color, claridad, profundidad, tabla
ORDER BY quilates;

#Muestra el número de recetas que hay por cada categoría.
SELECT categoria, count(*) AS cantidad FROM recetas.recetas
GROUP BY categoria
ORDER BY categoria;

#Muestra el número recetas que hay por comensal en cada categoría.
SELECT categoria, comensales, count(*) AS cantidad FROM recetas.recetas
GROUP BY categoria, comensales
ORDER BY categoria;

#Muestra la dificultad de las recetas, el número de comensales y la cantidad de recetas asociadas
SELECT dificultad, comensales, count(*) AS cantidad FROM recetas.recetas
GROUP BY dificultad, comensales
ORDER BY dificultad;

#Muestra las recetas agrupadas por valoración y tiempo.
SELECT * FROM recetas.recetas
GROUP BY valoracion,tiempo
ORDER BY valoracion;

#Muestra el número de pasajeros que sobrevivió o no, en función de la clase de su billete.
SELECT clase, Sobrevivió,  count(*) AS 'personas' FROM titanic.pasajerostitanic
GROUP BY sobrevivió, clase
ORDER BY clase;

#Muestra el número de pasajeros según la clase y el sexo
SELECT clase,sexo, count(*) AS 'personas' FROM titanic.pasajerostitanic
GROUP BY clase,sexo
ORDER BY clase;

#Muestra el número de pasajeros según su edad y el puerto de embarque.
set sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SELECT edad, embarque, count(*) AS personas FROM titanic.pasajerostitanic
GROUP BY edad, embarque
ORDER BY edad;

#Agrupa por sexo y si sobrevivieron o no y muestra las edades mínima, máxima, número de pasajeros, sexo y si sobrevivió.
set sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SELECT edad, embarque, count(*) AS personas FROM titanic.pasajerostitanic
GROUP BY edad, embarque
ORDER BY edad;
