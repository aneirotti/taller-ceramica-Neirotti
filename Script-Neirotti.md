CREATE SCHEMA Taller_ceramica_Neirotti;

USE Taller_Ceramica_Neirotti;



CREATE TABLE artistas (
    id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    mail VARCHAR(100),
    fecha_inicio DATE NOT NULL
);

CREATE TABLE clase (
    id_clase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    nivel_curso VARCHAR(50) NOT NULL,
    horario TIME NOT NULL,
    cupos_disponibles INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
);

CREATE TABLE mensualidad (
    id_mensualidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    id_clase INT NOT NULL,
    estado ENUM('pago', 'no pago') NOT NULL,
    fecha_pago DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista),
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
);

CREATE TABLE proveedores (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100)
);


CREATE TABLE materiales (
    id_material INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    material VARCHAR(100) NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    stock DECIMAL(10,3) NOT NULL
);

CREATE TABLE compras (
    id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_material INT NOT NULL,
    fecha_compra DATE NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    costo_unitario DECIMAL(10, 2) NOT NULL,
    cantidad DECIMAL(10,3) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_material) REFERENCES materiales(id_material)
);
