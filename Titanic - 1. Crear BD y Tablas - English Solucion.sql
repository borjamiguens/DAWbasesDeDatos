#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'Titanic'
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'pasajerosTitanic'
#--------------------------------------------------------------------------------------------
#		idPasajero			entero, no nulo
#		Sobrevivió			entero, no nulo
#		Clase				entero, no nula
#		Nombre				cadena de texto, no nula
#		Sexo				cadena de texto 10 , no nula
#		Edad				cadena de texto 4, no nula
#		Familiares			entero, no nulo					Siblings / spouses (hermanos o cónyuges)
#		PadresHijos			entero, no nulo					Parents / children (padres o hijo)
#		Ticket				cadena de texto, no nula
#		Tarifa				entero doble, no nulo
#		Cabina				cadena de texto 20, no nula
#		Embarque			cadena de texto 20, no nula
#
#		Clave primaria		Nombre
#--------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------
#	ASEGURA LOS SIGUIENTES VALORES EN LOS SIGUIENTES CAMPOS:
#		Sobrevivió					sólo pueda ser 		0, 1
#		Clase						sólo pueda ser		1, 2, 3
#		Sexo						sólo pueda ser		fame, female
#		Familiares y PadresHijos	NO puedan ser negativos
#		Embarque 					sólo pueda ser S, C, Q
#
#	PUEDES TAMBIÉN AÑADIR LA COMPROBACIÓN DE QUE NINGUNO DE LOS ATRIBUTOS ANTERIORES SEA NULO ('NULL')
#	NO TE OLVIDES DE CAMBIAR LOS CARACTERES DE LA BASE DE DATOS AL ESPAÑOL
#--------------------------------------------------------------------------------------------
