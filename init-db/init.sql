-- Tabla PERSONA: almacena información de los clientes o empleados
CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

CREATE TABLE PERSONA (
  P_ID INT PRIMARY KEY AUTO_INCREMENT,
  P_NOMBRE VARCHAR(50),
  P_APELLIDO VARCHAR(50),
  P_EMAIL VARCHAR(100),
  P_TELEFONO VARCHAR(20)
);

-- Tabla UBICACION: lista de ciudades o regiones donde hay puntos de venta
CREATE TABLE UBICACION (
  U_ID INT PRIMARY KEY AUTO_INCREMENT,
  U_NOMBRE VARCHAR(100)
);

-- Tabla PUNTO_DE_VENTA: almacena las sucursales de la empresa
CREATE TABLE PUNTO_DE_VENTA (
  PV_ID INT PRIMARY KEY AUTO_INCREMENT,
  PV_NOMBRE VARCHAR(100)
);

-- Tabla PRODUCTO: catálogo de productos disponibles
CREATE TABLE PRODUCTO (
  P_ID INT PRIMARY KEY AUTO_INCREMENT,
  P_NOMBRE VARCHAR(100),
  P_DESCRIPCION TEXT,
  P_PRECIO DECIMAL(10,2),
  P_STOCK INT
);

-- Tabla VENTA: encabezado de cada transacción
CREATE TABLE VENTA (
  V_ID INT PRIMARY KEY AUTO_INCREMENT,
  V_FECHA DATE,
  P_ID INT,        -- Cliente (persona que realiza la compra)
  PV_ID INT,       -- Punto de venta donde se realizó
  FOREIGN KEY (P_ID) REFERENCES PERSONA(P_ID),
  FOREIGN KEY (PV_ID) REFERENCES PUNTO_DE_VENTA(PV_ID)
);

-- Tabla VENTA_DETALLE: detalle de los productos vendidos en cada venta
CREATE TABLE VENTA_DETALLE (
  VD_ID INT PRIMARY KEY AUTO_INCREMENT,
  VD_CANTIDAD INT,
  VD_PRECIO_UNITARIO DECIMAL(10,2),
  VD_SUBTOTAL DECIMAL(10,2),
  V_ID INT,
  P_ID INT,
  FOREIGN KEY (V_ID) REFERENCES VENTA(V_ID),
  FOREIGN KEY (P_ID) REFERENCES PRODUCTO(P_ID)
);

-- Insertar datos de ejemplo
-- 10 personas
INSERT INTO PERSONA (P_NOMBRE, P_APELLIDO, P_EMAIL, P_TELEFONO)
VALUES ('Juan', 'Perez', 'juan@gmail.com', '3001112233'),
('Ana', 'López', 'ana@gmail.com', '3002223344'),
('Luis', 'Torres', 'luis@gmail.com', '3003334455'),
('Carlos', 'Ramos', 'carlos@gmail.com', '3004445566'),
('Laura', 'Gomez', 'laura@gmail.com', '3005556677'),
('Marta', 'Cruz', 'marta@gmail.com', '3006667788'),
('Diego', 'Jimenez', 'diego@gmail.com', '3007778899'),
('Sofia', 'Nieto', 'sofia@gmail.com', '3008889900'),
('Andres', 'Mejia', 'andres@gmail.com', '3009990011'),
('Camila', 'Vega', 'camila@gmail.com', '3001234567');

-- 10 ubicaciones
INSERT INTO UBICACION (U_NOMBRE)
VALUES ('Bogotá'), ('Medellín'), ('Cali'), ('Barranquilla'), ('Cartagena'),
('Bucaramanga'), ('Manizales'), ('Pereira'), ('Santa Marta'), ('Cúcuta');

-- 10 puntos de venta
INSERT INTO PUNTO_DE_VENTA (PV_NOMBRE)
VALUES ('Sucursal Centro'), ('Sucursal Norte'), ('Sucursal Sur'),
('Sucursal Occidente'), ('Sucursal Oriente'),
('Sucursal Mayorista'), ('Sucursal Virtual'), ('Sucursal Costa'),
('Sucursal Andina'), ('Sucursal Llanos');

-- 10 productos
INSERT INTO PRODUCTO (P_NOMBRE, P_DESCRIPCION, P_PRECIO, P_STOCK)
VALUES ('Laptop', 'Laptop HP 15"', 2500.00, 10),
('Mouse', 'Mouse inalámbrico', 50.00, 100),
('Teclado', 'Teclado mecánico', 150.00, 50),
('Monitor', 'Monitor 24"', 800.00, 25),
('Silla', 'Silla ergonómica', 600.00, 30),
('USB', 'Memoria USB 64GB', 80.00, 200),
('Disco Duro', 'HDD 1TB', 300.00, 40),
('SSD', 'Unidad SSD 500GB', 400.00, 35),
('Cámara', 'Webcam Full HD', 220.00, 15),
('Auriculares', 'Headset Gamer', 120.00, 45);
