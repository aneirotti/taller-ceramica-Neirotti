DROP SCHEMA Taller_ceramica_Neirotti;

CREATE SCHEMA Taller_ceramica_Neirotti;
USE Taller_Ceramica_Neirotti;

CREATE TABLE grupo (
    id_grupo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nivel VARCHAR(15) NOT NULL,
    horario VARCHAR(15) NOT NULL,
    cupo_disponible INT NOT NULL
   );

CREATE TABLE artista (
    id_artista INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    mail VARCHAR(100),
    fecha_inicio DATE NOT NULL,
    Id_grupo INT NOT NULL,
    FOREIGN KEY (Id_grupo) REFERENCES grupo(Id_grupo)
);

CREATE TABLE mensualidad (
    id_mensualidad INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_artista INT NOT NULL,
    id_grupo INT NOT NULL,
    estado ENUM('pago', 'no pago') NOT NULL,
    fecha_pago DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE proveedor (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE material (
    id_material INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    material VARCHAR(100) NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    stock DECIMAL(10,3) NOT NULL
);

CREATE TABLE material_faltante (
    id_faltante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_material INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_material) REFERENCES material(id_material),
    FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE compra (
    id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    id_material INT NOT NULL,
	id_faltante INT NOT NULL,
    fecha_compra DATE NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    costo_unitario DECIMAL(10, 2) NOT NULL,
    cantidad DECIMAL(10,3) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    FOREIGN KEY (id_material) REFERENCES material(id_material),
    FOREIGN KEY (id_faltante) REFERENCES material_faltante(id_faltante)
);

-- Insercion de datos --

INSERT INTO grupo (id_grupo, nivel, horario, cupo_disponible)
VALUES
    (1, 'Principiante', 'Martes Mañana', 1),
    (2, 'Principiante', 'Jueves Tarde', 2),
    (3, 'Intermedio', 'Martes Tarde', 3),
    (4, 'Intermedio', 'Jueves Mañana', 2),
    (5, 'Avanzado', 'Lunes Mañana', 1); 

INSERT INTO artista (id_artista, nombre, telefono, mail, fecha_inicio, Id_grupo)
VALUES
    (1, 'Martín Perez', '99467082', 'martin.perez@hotmail.com', '2024-08-13', 1),
    (2, 'Mateo Gomez', '96406732', 'mateo.gomez@gmail.com', '2024-04-28', 2),
    (3, 'Valentina Díaz', '99494794', 'valentina.diaz@gmail.com', '2024-07-06', 3),
    (4, 'Valentina Navarro', '96544259', 'valentina.navarro@gmail.com', '2024-12-18', 5),
    (5, 'Lucía Bermúdez', '98181684', 'lucia.bermudez@hotmail.com', '2024-05-25', 4),
    (6, 'Laura Vega', '96347951', 'laura.vega@hotmail.com', '2024-10-15', 4);

INSERT INTO mensualidad (id_mensualidad, id_artista, id_grupo, estado, fecha_pago, monto)
VALUES
    (1, 3, 2, 'pago', '2024-03-10', 4000),
    (2, 5, 1, 'pago', '2024-03-12', 4000),
    (3, 2, 2, 'pago', '2024-07-25', 4000),
    (4, 4, 1, 'pago', '2024-08-07', 4000),
    (5, 6, 3, 'no pago', '2024-07-25', 2000),
    (6, 1, 1, 'no pago', NULL, NULL);

INSERT INTO proveedor (id_proveedor, nombre, telefono, email)
VALUES
    (1, 'Barro y Arte', '1234567890', 'barroyarte@gmail.com'),
    (2, 'Cerámica Creativa', '2345678901', 'ceramicacreativa@hotmail.com'),
    (3, 'Esmalte Perfecto', '3456789012', 'esmalteperfecto@gmail.com'),
    (4, 'Ladrillos de Fuego', '4567890123', 'ladrillosdefuego@hotmail.com'),
    (5, 'Arcilla Pura', '5678901234', 'arcillapura@gmail.com'),
    (6, 'Terracota Pura', '7890123456', 'terracotapura@gmail.com');

INSERT INTO material (id_material, material, unidad_medida, stock)
VALUES
    (1, 'Barro', 'kg', 50),
    (2, 'Esmalte', 'L', 30.5),
    (3, 'Arcilla', 'kg', 50),
    (4, 'Pinceles', 'unidad', 100),
    (5, 'Utensilios de modelado', 'unidad', 75),
    (6, 'Lijas', 'unidad', 30);

INSERT INTO material_faltante (id_faltante, id_material, id_grupo, fecha)
VALUES
    (1, 1, 1, '2024-03-01'),
    (2, 2, 1, '2024-03-05'),
    (3, 3, 2, '2024-03-10'),
    (4, 4, 2, '2024-03-15'),
    (5, 5, 3, '2024-03-20'),
    (6, 6, 3, '2024-03-25');

INSERT INTO compra (id_compra, id_proveedor, id_material, id_faltante, fecha_compra, unidad_medida, costo_unitario, cantidad)
VALUES
    (1, 1, 1, 1, '2024-03-01', 'kg', 120.5, 10),
    (2, 2, 2, 2, '2024-03-05', 'L', 50.75, 5),
    (3, 3, 3, 3, '2024-03-10', 'kg', 200, 7),
    (4, 4, 4, 4, '2024-03-15', 'unidades', 15, 20),
    (5, 5, 5, 5, '2024-03-20', 'L', 70, 6),
    (6, 6, 6, 6, '2024-03-25', 'unidades', 45, 15);


-- Creacion de vistas --

CREATE OR REPLACE VIEW vista_artista_grupo_mensualidad AS
SELECT
a.id_artista,
a.nombre AS artista_nombre,
g.nivel AS grupo_nivel,
g.horario AS grupo_horario,
m.estado AS mensualidad_estado,
m.fecha_pago,
m.monto
FROM artista AS a
LEFT JOIN grupo AS g ON a.Id_grupo = g.id_grupo
LEFT JOIN mensualidad AS m ON a.id_artista = m.id_artista;


CREATE OR REPLACE VIEW vista_proveedores_materiales_compras AS
SELECT 
p.nombre AS proveedor_nombre,
m.material AS material_nombre,
mf.fecha AS fecha_faltante,
c.fecha_compra,
c.unidad_medida,
c.costo_unitario,
c.cantidad
FROM proveedor AS p
LEFT JOIN compra AS c ON p.id_proveedor = c.id_proveedor
LEFT JOIN material AS m ON c.id_material = m.id_material
LEFT JOIN material_faltante AS mf ON c.id_faltante = mf.id_faltante;


CREATE VIEW Vista_Historial_Compras AS
SELECT 
c.id_compra,
c.fecha_compra,
p.nombre AS proveedor,
m.material,
c.cantidad,
c.unidad_medida,
c.costo_unitario,
(c.cantidad * c.costo_unitario) AS costo_total
FROM compra c
LEFT JOIN proveedor AS p ON c.id_proveedor = p.id_proveedor
LEFT JOIN material AS m ON c.id_material = m.id_material;


-- Funciones personalizadas --

DELIMITER //
CREATE FUNCTION fn_compras_mes(año INT, mes INT) 
RETURNS DECIMAL(10,2) 
READS SQL DATA
BEGIN
DECLARE total_costo DECIMAL(10,2);
	SELECT SUM(costo_unitario * cantidad) 
	INTO total_costo
	FROM compra
	WHERE YEAR(fecha_compra) = año AND MONTH(fecha_compra) = mes;
RETURN total_costo;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION fn_cantidad_alumnos(id_grupo INT) 
RETURNS INT 
READS SQL DATA
BEGIN
DECLARE tamaño_grupo INT;
    SELECT COUNT(*) INTO tamaño_grupo 
    FROM artista 
    WHERE artista.Id_grupo = id_grupo;
RETURN tamaño_grupo;
END //
DELIMITER ;


-- Store procedures--

DELIMITER //
CREATE PROCEDURE sp_registrar_pago(
    IN id_artista INT,
    IN id_grupo INT,
    IN fecha_pago DATE,
    IN monto DECIMAL(10,2)
)
BEGIN
	INSERT INTO mensualidad (id_artista, id_grupo, estado, fecha_pago, monto) 
	VALUES (id_artista, id_grupo, 'pago', fecha_pago, monto);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_inscribir_artista(
    IN nombre VARCHAR(100),
    IN telefono VARCHAR(15),
    IN mail VARCHAR(100),
    IN fecha_inicio DATE,
    IN id_grupo INT
)
BEGIN
DECLARE cupo_actual INT;
    SELECT cupo_disponible INTO cupo_actual 
    FROM grupo 
    WHERE grupo.id_grupo = id_grupo;   
IF cupo_actual > 0 THEN
	INSERT INTO artista (nombre, telefono, mail, fecha_inicio, id_grupo) 
	VALUES (nombre, telefono, mail, fecha_inicio, id_grupo);       
UPDATE grupo 
SET cupo_disponible = cupo_disponible - 1 
WHERE grupo.id_grupo = id_grupo;
ELSE
	SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'No hay cupos disponibles en este grupo';
END IF;
END //
DELIMITER ;

-- Triggers --

DELIMITER //
CREATE TRIGGER verificar_pago_mensualidad
BEFORE INSERT ON mensualidad
FOR EACH ROW
BEGIN
DECLARE pago_existente INT;

SELECT COUNT(*) INTO pago_existente
FROM mensualidad
WHERE mensualidad.id_artista = id_artista
AND month(fecha_pago) = month(fecha_pago)
AND year(fecha_pago) = year(fecha_pago);

IF pago_existente > 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Este artista tiene un pago registrado para este mes';
END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER actualizar_stock
AFTER INSERT ON compra
FOR EACH ROW
BEGIN
    -- Aumentamos el stock del material en base a la cantidad comprada
    UPDATE material
    SET stock = stock + new.cantidad
    WHERE material.id_material = new.id_material;
END //
DELIMITER ;

