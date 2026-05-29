-- 1. Tabla Categorias (No tiene llaves foráneas, se crea primero)
CREATE TABLE Categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- 2. Tabla Productos (Depende de Categorias)
CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

-- 3. Tabla Clientes (No tiene llaves foráneas)
CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

-- 4. Tabla Pedidos (Depende de Clientes)
CREATE TABLE Pedidos (
    id_pedido SERIAL PRIMARY KEY,
    fecha_pedido DATE DEFAULT CURRENT_DATE,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 5. Tabla Detalle_Pedidos (Depende de Pedidos y Productos, rompe la relación N:M)
CREATE TABLE Detalle_Pedidos (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- 1. Insertar 10 Categorías
INSERT INTO Categorias (nombre, descripcion) VALUES
('Pasteles', 'Pasteles enteros para celebraciones'),
('Pan Dulce', 'Panadería tradicional mexicana y francesa'),
('Bebidas Calientes', 'Café, té y chocolate caliente'),
('Bebidas Frías', 'Frappés, sodas y aguas frescas'),
('Postres Individuales', 'Porciones para una persona'),
('Galletas', 'Galletas horneadas del día'),
('Pan Salado', 'Baguettes, cuernitos y pan de masa madre'),
('Tartas', 'Tartas dulces con base de galleta'),
('Gelatinas', 'Gelatinas de agua y leche'),
('Especialidades', 'Postres de temporada y sin gluten');

-- 2. Insertar 10 Productos
INSERT INTO Productos (nombre, precio, id_categoria) VALUES
('Pastel Tres Leches', 350.00, 1),
('Concha de Vainilla', 15.00, 2),
('Café Americano', 35.00, 3),
('Frappé de Mocha', 65.00, 4),
('Brownie con Nuez', 40.00, 5),
('Galleta Chocochip', 20.00, 6),
('Baguette Clásico', 30.00, 7),
('Tarta de Fresa', 280.00, 8),
('Gelatina de Mosaico', 120.00, 9),
('Pastel Vegano de Zanahoria', 400.00, 10);

-- 3. Insertar 10 Clientes
INSERT INTO Clientes (nombre_completo, telefono, correo) VALUES
('Ana García', '555-1001', 'ana.g@email.com'),
('Carlos López', '555-1002', 'carlos.l@email.com'),
('María Fernández', '555-1003', 'maria.f@email.com'),
('Juan Pérez', '555-1004', 'juan.p@email.com'),
('Sofía Ramírez', '555-1005', 'sofia.r@email.com'),
('Luis Martínez', '555-1006', 'luis.m@email.com'),
('Laura Gómez', '555-1007', 'laura.g@email.com'),
('Diego Torres', '555-1008', 'diego.t@email.com'),
('Valeria Díaz', '555-1009', 'valeria.d@email.com'),
('Jorge Ruiz', '555-1010', 'jorge.r@email.com');

-- 4. Insertar 10 Pedidos (Usando fechas recientes)
INSERT INTO Pedidos (fecha_pedido, id_cliente) VALUES
('2026-05-20', 1),
('2026-05-21', 2),
('2026-05-22', 3),
('2026-05-23', 4),
('2026-05-24', 5),
('2026-05-25', 6),
('2026-05-26', 7),
('2026-05-27', 8),
('2026-05-28', 9),
('2026-05-28', 10);

-- 5. Insertar 10 Detalles de Pedidos (Qué compró cada quién)
INSERT INTO Detalle_Pedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 350.00), -- Pedido 1: 1 Pastel Tres Leches
(2, 2, 5, 15.00),  -- Pedido 2: 5 Conchas
(3, 3, 2, 35.00),  -- Pedido 3: 2 Cafés Americanos
(4, 4, 1, 65.00),  -- Pedido 4: 1 Frappé
(5, 5, 3, 40.00),  -- Pedido 5: 3 Brownies
(6, 6, 10, 20.00), -- Pedido 6: 10 Galletas
(7, 7, 2, 30.00),  -- Pedido 7: 2 Baguettes
(8, 8, 1, 280.00), -- Pedido 8: 1 Tarta de Fresa
(9, 9, 1, 120.00), -- Pedido 9: 1 Gelatina
(10, 10, 1, 400.00); -- Pedido 10: 1 Pastel Vegano