-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS distritodo;
USE distritodo;

-- Tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(50),
    descripcion VARCHAR(255)
);

-- Tabla precios
CREATE TABLE precios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio_compra DECIMAL(10,2),
    precio_venta DECIMAL(10,2),
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

-- Tabla clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(255),
    cuit VARCHAR(20) UNIQUE
);

-- Tabla direcciones
CREATE TABLE direcciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    direccion VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Tabla ventas (actualizada con tipo de comprobante, fecha y nro comprobante)
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    precio_venta DECIMAL(10,2),
    precio_compra DECIMAL(10,2),
    cantidades DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    tipo_comprobante VARCHAR(50),
    fecha DATE,
    nro_comprobante VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

-- Tabla proveedores
CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    razon_social VARCHAR(255),
    cuit VARCHAR(20) UNIQUE
);

-- Tabla compras (actualizada con tipo de comprobante, fecha y nro comprobante)
CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedores INT,
    id_producto INT,
    precio_compra DECIMAL(10,2),
    cantidades DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    tipo_comprobante VARCHAR(50),
    fecha DATE,
    nro_comprobante VARCHAR(50),
    FOREIGN KEY (id_proveedores) REFERENCES proveedores(id),
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

-- Tabla stock (se actualiza automáticamente al cargar una venta)
CREATE TABLE movimientos (
id INT AUTO_INCREMENT PRIMARY KEY,
id_producto INT,
stock DECIMAL(10,2),
fecha DATE,
tipo INT,
FOREIGN KEY (id_producto) REFERENCES productos(id)
);
INSERT INTO productos (id, sku, descripcion) VALUES
(1, '01-01*01', 'Coca cola original 1,5L'),
(2, '01-02-01', 'Coca cola zero 1,5L'),
(3, '01-01-02', 'Coca cola original 2L'),
(4, '01-02-02', 'Coca cola zero 2L'),
(5, '02-01-01', 'Sprite original 1,5L'),
(6, '02-02-01', 'Sprite zero 1,5L'),
(7, '02-01-02', 'Sprite original 2L'),
(8, '02-02-02', 'Sprite zero 2L'),
(9, '03-01-01', 'Fanta original 1,5L'),
(10, '03-02-01', 'Fanta zero 1,5L'),
(11, '03-01-02', 'Fanta original 2L'),
(12, '03-02-02', 'Fanta zero 2L'),
(13, '04-01-01', 'Pepsi original 1,5L'),
(14, '04-02-01', 'Pepsi zero 1,5L'),
(15, '04-01-02', 'Pepsi original 2L'),
(16, '04-02-02', 'Pepsi zero 2L'),
(17, '05-01-01', '7up original 1,5L'),
(18, '05-02-01', '7up zero 1,5L'),
(19, '05-01-02', '7up original 2L'),
(20, '05-02-02', '7up zero 2L');

INSERT INTO precios (id, id_producto, precio_compra, precio_venta, fecha) VALUES
(1, 1, 800.00, 1100.00, '2025-06-01'),
(2, 2, 750.00, 1050.00, '2025-06-01'),
(3, 3, 350.00, 500.00, '2025-06-01'),
(4, 4, 400.00, 560.00, '2025-06-01'),
(5, 5, 780.00, 1080.00, '2025-06-01'),
(6, 6, 300.00, 450.00, '2025-06-01'),
(7, 7, 320.00, 480.00, '2025-06-01'),
(8, 8, 600.00, 880.00, '2025-06-01'),
(9, 9, 380.00, 540.00, '2025-06-01'),
(10, 10, 450.00, 700.00, '2025-06-01'),
(11, 11, 470.00, 720.00, '2025-06-01'),
(12, 12, 600.00, 900.00, '2025-06-01'),
(13, 13, 640.00, 950.00, '2025-06-01'),
(14, 14, 200.00, 320.00, '2025-06-01'),
(15, 15, 250.00, 400.00, '2025-06-01'),
(16, 16, 900.00, 1300.00, '2025-06-01'),
(17, 17, 780.00, 1150.00, '2025-06-01'),
(18, 18, 300.00, 480.00, '2025-06-01'),
(19, 19, 270.00, 430.00, '2025-06-01'),
(20, 20, 280.00, 440.00, '2025-06-01'),
(21, 1, 820.00, 1120.00, '2025-07-01'),
(22, 2, 760.00, 1060.00, '2025-07-01'),
(23, 3, 355.00, 510.00, '2025-07-01'),
(24, 4, 405.00, 570.00, '2025-07-01'),
(25, 5, 790.00, 1090.00, '2025-07-01'),
(26, 6, 310.00, 460.00, '2025-07-01'),
(27, 7, 330.00, 490.00, '2025-07-01'),
(28, 8, 610.00, 890.00, '2025-07-01'),
(29, 9, 390.00, 550.00, '2025-07-01'),
(30, 10, 460.00, 710.00, '2025-07-01'),
(31, 11, 480.00, 730.00, '2025-07-01'),
(32, 12, 610.00, 910.00, '2025-07-01'),
(33, 13, 650.00, 960.00, '2025-07-01'),
(34, 14, 210.00, 330.00, '2025-07-01'),
(35, 15, 260.00, 410.00, '2025-07-01'),
(36, 16, 910.00, 1320.00, '2025-07-01'),
(37, 17, 790.00, 1160.00, '2025-07-01'),
(38, 18, 310.00, 490.00, '2025-07-01'),
(39, 19, 280.00, 440.00, '2025-07-01'),
(40, 20, 290.00, 450.00, '2025-07-01'),
(41, 1, 840.00, 1140.00, '2025-08-01');

INSERT INTO clientes (id, razon_social, cuit) VALUES
(1, 'Supermercado El Buen Gusto', '20123456780'),
(2, 'Almacén Don José', '20123456781'),
(3, 'Kiosco Las 24hs', '20123456782'),
(4, 'Restaurante La Parrilla', '20123456783'),
(5, 'Minimercado San Martín', '20123456784'),
(6, 'Verdulería El Verde', '20123456785'),
(7, 'Panadería La Espiga', '20123456786'),
(8, 'Carnicería Los Hermanos', '20123456787'),
(9, 'Despensa El Barrio', '20123456788'),
(10, 'Bebidas y Más', '20123456789');

INSERT INTO direcciones (id, id_cliente, direccion) VALUES
(1, 1, 'Av. Corrientes 1234, Buenos Aires'),
(2, 2, 'Calle Mitre 456, Rosario'),
(3, 3, 'Av. Libertador 789, Córdoba'),
(4, 4, 'Ruta 3 Km 25, La Matanza'),
(5, 5, 'Calle San Martín 101, Mendoza'),
(6, 6, 'Calle Belgrano 550, Salta'),
(7, 7, 'Av. Independencia 900, Mar del Plata'),
(8, 8, 'Calle Colón 223, San Juan'),
(9, 9, 'Calle Rivadavia 12, Tucumán'),
(10, 10, 'Calle Entre Ríos 48, Santa Fe'),
(11, 2, 'Av. Pellegrini 600, Rosario'),
(12, 3, 'Calle Alem 345, Córdoba');

INSERT INTO proveedores (id, razon_social, cuit) VALUES
(1, 'Distribuidora de gaseosas', '20123456780'),
(2, 'Distribuidora Lugano', '20123456783'),
(3, 'Distribuidora Flores', '20123456789');

