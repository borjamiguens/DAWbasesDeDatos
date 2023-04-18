#--------------------------------------------------------------------------------------------
#	CREACIÓN Y USO DE LA BASE DE DATOS 'Jardineria'
#--------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS Jardineria;
CREATE DATABASE Jardineria;
USE Jardineria;
SHOW COLLATION WHERE CHARSET = "utf32";
#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'oficina'
#--------------------------------------------------------------------------------------------
#		oficinaID			cadena de texto 10, no nulo
#		ciudad				cadena de texto 30, no nulo
#		pais				cadena de texto 50, no nula
#		region				cadena de texto 50, no nula
#		CP					cadena de texto 10, no nula
#		telefono			cadena de texto 20, no nula
#		linea_direccion1	cadena de texto 50, no nulo
#		linea_direccion2	cadena de texto 50, por defecto nulo
#
#		Clave primaria		oficinaID
#--------------------------------------------------------------------------------------------
CREATE TABLE oficina(
	oficinaID 			varchar (10) NOT NULL,
	ciudad 				varchar (30) NOT NULL,
	pais 				varchar (50) NOT NULL,
	region 				varchar (50) NOT NULL,
	CP 					varchar (10) NOT NULL,
	telefono 			varchar (20) NOT NULL,
	linea_direccion1 	varchar (50) NOT NULL,
	linea_direccion2 	varchar (50) NOT NULL,  
    CONSTRAINT PK_OFICINA PRIMARY KEY (oficinaID)


);
#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'empleado'
#--------------------------------------------------------------------------------------------
#		empleadoID		entero
#		nombre			cadena de caracteres 50
#		apellido1		cadena de caracteres 50
#		apellido2		cadena de caracteres 50, puede no existir para algún empleado
#		extension		cadena de caracteres 10
#		email			cadena de caracteres 100
#		oficina			cadena de caracteres 10
#		jefe			entero, nulo por defecto
#		puesto			cadena de caracteres 50
#
#		Clave primaria		empleadoID
#		clave foránea		oficina		enlace con la tabla oficina
#		clave foránea		jefe		enlace con la tabla empleado		
#--------------------------------------------------------------------------------------------
CREATE TABLE empleado(
	empleadoID 			int,
	nombre 				varchar (50) NOT NULL,
	apellido1 			varchar (50) NOT NULL,
	apellido2 			varchar (50) NOT NULL,
	extension 			varchar (10) NOT NULL,
	email 				varchar (100) NOT NULL,
	oficina 			varchar (10) NOT NULL,
	jefe 				int,
    puesto				varchar (50) NOT NULL,
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (empleadoID),
    CONSTRAINT FK_EMPLEADO_OFICINA FOREIGN KEY (oficina) REFERENCES oficina (oficinaID),
    CONSTRAINT FK_EMPLEADO_JEFE FOREIGN KEY (jefe) REFERENCES empleado (empleadoID)
);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'gama_producto'
#--------------------------------------------------------------------------------------------
#		gama				cadena de caracteres 50
#		descripcion_texto	cadena de caracteres
#		descripcion_html	cadena de caracteres
#		imagen				cadena de caracteres 256
#
#		Clave primaria		gama
#--------------------------------------------------------------------------------------------
CREATE TABLE gama_producto(
	gama 				varchar (50) ,
	descripcion_texto	text ,
	extension 			text,
	email 				varchar (256),
    CONSTRAINT PK_GAMA_PRODUCTO PRIMARY KEY (gama)
    
    );

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'cliente'
#--------------------------------------------------------------------------------------------
#		clienteID				entero
#		nombre_cliente			cadena de caracteres 50
#		nombre_contacto			cadena de caracteres 30 -> puede no haber
#		apellido_contacto		cadena de caracteres 50 -> puede no haber
#		telefono				cadena de caracteres 15
#		fax						cadena de caracteres 15
#		linea_direccion1		cadena de caracteres 50
#		linea_direccion2		cadena de caracteres 50 -> puede no haber
#		ciudad					cadena de caracteres 50
#		region					cadena de caracteres 50
#		pais					cadena de caracteres 50
#		CP						cadena de caracteres 10
#		representante_ventas	entero -> puede no haber
#		limite_credito			valor decimal (15,2) -> puede no haber
#
#		Clave primaria		clienteID
#		clave foránea		representante_ventas	enlace con la tabla empleado		
#--------------------------------------------------------------------------------------------
CREATE TABLE cliente(
	clienteID 			int			 NOT NULL,
	nombre_cliente		varchar (50) NOT NULL,
	nombre_contacto		varchar (30) ,
	apellido_contacto	varchar (50) ,
	telefono 			varchar (15) NOT NULL,
	fax 				varchar (15) NOT NULL,
	linea_direccion1	varchar (50) NOT NULL,
	linea_direccion2	varchar (50) ,
	ciudad 				varchar (50) NOT NULL,
    region				varchar (50) ,
    pais				varchar (50) NOT NULL,
	CP 					varchar (10) NOT NULL,
    representante_ventas int NOT NULL,
    limite_credito		decimal(15,2),
    
    CONSTRAINT PK_CLIENTE PRIMARY KEY (clienteID),
    CONSTRAINT FK_CLIENTE FOREIGN KEY (representante_ventas) REFERENCES empleado (empleadoID)



);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'pedido'
#--------------------------------------------------------------------------------------------
#		pedidoID				entero
#		fecha_pedido			fecha
#		fecha_esperada			fecha
#		fecha_entrega			fecha -> puede ser nulo
#		estado					cadena de caracteres 15
#		comentarioa				cadena de caracteres
#		cliente					entero, no nulo
#
#		Clave primaria		pedidoID
#		clave foránea		cliente		enlace con la tabla cliente
#--------------------------------------------------------------------------------------------
CREATE TABLE pedido(
	pedidoID 			int	 NOT NULL,
	fecha_pedido		date NOT NULL,
	fecha_esperada		date NOT NULL ,
	fecha_entrega		date ,
	estado 				varchar (15) NOT NULL,
	comentario 			text NOT NULL,
	cliente				int NOT NULL,
    
    CONSTRAINT PK_PEDIDO 	PRIMARY KEY (pedidoID),
    CONSTRAINT FK_PEDIDO 	FOREIGN KEY (cliente) REFERENCES cliente (clienteID)



);

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'PRODUCTO'
#--------------------------------------------------------------------------------------------
#		productoID				cadena de caracteres 15
#		nombre					cadena de caracteres 70
#		gama					cadena de caracteres 50
#		dimensiones				cadena de caracteres 25 -> puede ser nulo
#		proveedor				cadena de caracteres 50 -> puede ser nulo
#		descripcion				cadena de caracteres	-> puede ser nulo
#		cantidad_en_stock		entero pequeño, no nulo
#		precio_venta			numérico 15 y 2 decimales
#		precio_proveedor		numérico 15 y 2 decimales
#
#		Clave primaria		productoID
#		clave foránea		gama		enlace con la tabla gama_producto
#--------------------------------------------------------------------------------------------
CREATE TABLE producto(
	productoID 			varchar (15) NOT NULL,
	nombre				varchar (70) NOT NULL,
	gama				varchar (50) NOT NULL,
	dimensiones			varchar (25) ,
	proveedor 			varchar (50) ,
	descripcion 		text,
	cantidad_en_stock	smallint NOT NULL,
	precio_venta		decimal (15,2)	NOT NULL ,
	precio_proveedor	decimal (15,2)	NOT NULL ,
    
    CONSTRAINT PK_PRODUCTO PRIMARY KEY (productoID),
    CONSTRAINT FK_PRODUCTO FOREIGN KEY (gama) REFERENCES gama_producto (gama)
    
    );




#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'detalle_pedido'
#--------------------------------------------------------------------------------------------
#		pedidoID				entero
#		productoID				cadena de caracteres 15
#		cantidad				entero
#		precio_unidad			numérico 15 y 2 decimales
#		linea					entero pequeño, no nulo
#
#		Clave primaria		pedidoID, productoID
#		clave foránea		pedidoID		enlace con la tabla pedido
#		clave foránea		productoID		enlace con la tabla producto
#--------------------------------------------------------------------------------------------
CREATE TABLE detalle_pedido(
	pedidoID 			int NOT NULL,
	productoID			varchar (15) NOT NULL,
	cantidad			int NOT NULL,
	precio_unidad		decimal (15,2) 	NOT NULL ,
	linea	 			smallint	NOT NULL ,
    
    CONSTRAINT PK_DETALLE_PEDIDO PRIMARY KEY (pedidoID),
    CONSTRAINT FK_DETALLE_PEDIDO_PEDIDO FOREIGN KEY (pedidoID) REFERENCES pedido (pedidoID),
	CONSTRAINT FK_DETALLE_PEDIDO_PRODUCTO FOREIGN KEY (productoID) REFERENCES producto (productoID)

    );

#--------------------------------------------------------------------------------------------
#	CREACIÓN DE LA TABLA 'pago'
#--------------------------------------------------------------------------------------------
#		clienteID				entero
#		forma_pago				cadena de caracteres 40
#		transaccion				cadena de caracteres 50
#		fecha_pago				fecha -> puede ser nulo
#		total					numérico 15 y 2 decimales
#
#		Clave primaria		clienteID, transaccion
#		clave foránea		clienteID		enlace con la tabla cliente
#--------------------------------------------------------------------------------------------
CREATE TABLE pago(
	clienteID 			int NOT NULL,
	forma_pago			varchar (40) NOT NULL,
	transaccion			varchar (50) NOT NULL,
	fecho_pago			date,
	total	 			decimal (15,2) 	NOT NULL ,
    
    CONSTRAINT PK_PAGO PRIMARY KEY (clienteID, transaccion),
    CONSTRAINT FK_PAGO FOREIGN KEY (clienteID) REFERENCES cliente (clienteID)

    );

#--------------------------------------------------------------------------------------------
#	DICCIONARIO DE DATOS
#--------------------------------------------------------------------------------------------
