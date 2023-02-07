#creamos la BBDD Optica
CREATE DATABASE IF NOT EXISTS optica;

#selecionar la BBDD
USE optica;

#creamos las tablas : 
CREATE TABLE IF NOT EXISTS clientes(
	id_cliente INT(10) NOT NULL,
    cp INT(10),
    telefono INT(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    recomendacion INT(10),
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(recomendacion) REFERENCES clientes(id_cliente)
)ENGINE=INNODB;

#creamos tabla direccion
CREATE TABLE IF NOT EXISTS direccion(
	id_direccion INT(10) NOT NULL,
	calle VARCHAR(50) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    codigo_postal INT(5) NOT NULL,
    puerta VARCHAR(20) NOT NULL, 
    ciudad VARCHAR(20) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_direccion)
)ENGINE=INNODB;

#creamos las tablas : tabla proveedores.
CREATE TABLE IF NOT EXISTS proveedor(
	id_proveedor INT NOT NULL,
    nif INT(15) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    telefono INT(15) NOT NULL,
    fax INT(15), 
    direccion_id INT(10) NOT NULL,
    gafas_id INT(10) NOT NULL,
    PRIMARY KEY(id_proveedor),
    FOREIGN KEY(direccion_id) REFERENCES direccion(id_direccion),
    FOREIGN KEY(gafas_id) REFERENCES gafas(id_gafas)
)ENGINE=INNODB;

#creamos la tabla gafas: entindad que almacena el objecto con los siguientes atribustos: caracteristicas de los lentes.
CREATE TABLE IF NOT EXISTS gafas(
	id_gafas INT(10) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    graduacion_izq INT(10) NOT NULL,
    graduacion_der INT(10) NOT NULL,
    montura ENUM('flotant', 'pasta', 'metalica') NOT NULL,
    color_montura VARCHAR(50) NOT NULL,
    colorVidrio_izq VARCHAR(50) NOT NULL,
    colorVidrio_der VARCHAR(50) NOT NULL,
    precio FLOAT(10) NOT NULL,
    vendedor_id INT(10) NOT NULL,
    cliente_id INT(10) NOT NULL,
    PRIMARY KEY(id_gafas),
    FOREIGN KEY(vendedor_id) REFERENCES ventas(id_vendedor),
    FOREIGN KEY(cliente_id) REFERENCES clientes(id_cliente)
)ENGINE=INNODB;

#Periodo de tiempo de ventas, lo entiendo como la fecho u hora que el vendedor toma contacto con el cliente hasta que finaliza la venta.
CREATE TABLE IF NOT EXISTS ventas(
	id_vendedor INT(10) NOT NULL,
    inicio_periodo TIME NOT NULL,
    fin_peridod TIME NOT NULL,
    PRIMARY KEY(id_vendedor)
)ENGINE=INNODB;




