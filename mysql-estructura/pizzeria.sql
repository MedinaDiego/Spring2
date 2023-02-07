#creamos la BBDD Optica
CREATE DATABASE IF NOT EXISTS pizzeria;

#selecionar la BBDD
USE pizzeria;

CREATE TABLE IF NOT EXISTS cliente(
	id_cliente INT(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    codigo_postal INT(5) NOT NULL,
    localidad VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefono INT(10) NOT NULL,
    pedido_id INT(10) NOT NULL,
    PRIMARY KEY (id_cliente),
    FOREIGN KEY(pedido_id) REFERENCES pedido(id_pedido)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS pedido(
	id_pedido INT(10) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    tipo_pedido ENUM('recoger','domicilio'),
    precio_total FLOAT(10) NOT NULL, 
    tienda_id INT(10) NOT NULL,
    empleado_id INT(10) NOT NULL,
    fechaHora_entrega DATETIME NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY(tienda_id) REFERENCES tienda(id_tienda),
    FOREIGN KEY(empleado_id) REFERENCES empleado(id_empleado)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS contiene(
	pedido_id INT(10) NOT NULL,
    producto_id INT(10) NOT NULL,
    cantidad_productos INT(5) NOT NULL,
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido),
    FOREIGN KEY (producto_id) REFERENCES producto(id_producto)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS producto(
	id_producto INT(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    imagen BLOB,
    tipo ENUM('hamburguesa','pizza','bebida'),
    categoria_id INT(10),
    PRIMARY KEY (id_producto),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id_categoria)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS categoria(
	id_categoria INT(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_categoria)
)ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tienda(
	id_tienda INT(10) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    codigo_postal INT(10) NOT NULL,
    localidad VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    empleado_id INT(10) NOT NULL,
    PRIMARY KEY(id_tienda),
    FOREIGN KEY (empleado_id) REFERENCES empleado(id_empleado)
)ENGINE= INNODB;

CREATE TABLE IF NOT EXISTS empleado(
	id_empleado INT(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    nif VARCHAR(50) NOT NULL,
    telefono INT(10) NOT NULL,
    tipo ENUM('cocinero', 'repartidor') NOT NULL,
    PRIMARY KEY(id_empleado)
)ENGINE= INNODB;
