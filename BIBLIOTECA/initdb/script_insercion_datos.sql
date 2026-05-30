    -- AUTORES
INSERT INTO biblioteca.autores (nombre_autor, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Julio Verne', 'Francesa'),
('J.K. Rowling', 'Británica'),
('Mario Vargas Llosa', 'Peruana'),
('Paulo Coelho', 'Brasileña');

    --USUARIOS
INSERT INTO biblioteca.usuarios
(nombre, apellido, correo, telefono, direccion, estado)
VALUES
('Oscar', 'K', 'oscark98@gmail.com', '3104567890', 'Suba, Bogotá', 'ACTIVO'),
('Laura', 'García', 'lauragarcia15@hotmail.com', '3112345678', 'Engativá, Bogotá', 'ACTIVO'),
('Andrés', 'Martínez', 'andresmartinez99@outlook.com', '3123456789', 'Chapinero, Bogotá', 'ACTIVO'),
('Valentina', 'Rodríguez', 'valen.rodriguez23@gmail.com', '3134567890', 'Usaquén, Bogotá', 'INACTIVO'),
('Daniel', 'López', 'daniel_lopez17@yahoo.com', '3145678901', 'Kennedy, Bogotá', 'ACTIVO');
-- CATEGORÍAS
INSERT INTO biblioteca.categoria (nombre_categoria, descripcion) VALUES
('Novela', 'Obras narrativas de ficción'),
('Ciencia Ficción', 'Historias basadas en avances científicos'),
('Fantasía', 'Historias con elementos mágicos'),
('Literatura Latinoamericana', 'Autores y obras de América Latina'),
('Aventura', 'Relatos de exploración y acción');

-- LIBROS
INSERT INTO biblioteca.libros
(nombre_libro, codigo_ISBN, editorial, id_categoria, id_autores)
VALUES
('Cien años de soledad', '9780307474728', 'Sudamericana', 1, 1),
('Viaje al centro de la Tierra', '9788420674208', 'Planeta', 5, 2),
('Harry Potter y la piedra filosofal', '9788478884452', 'Salamandra', 3, 3),
('La ciudad y los perros', '9788420471838', 'Alfaguara', 4, 4),
('El alquimista', '9780061122415', 'HarperCollins', 1, 5);

-- PRÉSTAMOS
INSERT INTO biblioteca.prestamos
(id_usuario, id_libro, fecha_prestamo, fecha_devolucion, estado)
VALUES
(1, 1, '2026-05-01', '2026-05-15', 'DEVUELTO'),
(2, 3, '2026-05-10', NULL, 'ACTIVO'),
(3, 2, '2026-04-20', '2026-05-05', 'DEVUELTO'),
(4, 5, '2026-05-12', NULL, 'ACTIVO'),
(5, 4, '2026-04-01', '2026-04-20', 'VENCIDO');

-- SANCIONES
INSERT INTO biblioteca.sancion
(id_prestamo, tipo_sancion, descripcion, fecha_sancion)
VALUES
(5, 'Retraso', 'Devolución fuera de la fecha establecida', '2026-04-21'),
(3, 'Daño', 'Libro devuelto con páginas deterioradas', '2026-05-05');