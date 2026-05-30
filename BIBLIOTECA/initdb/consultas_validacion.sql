-- 1. Listar todos los libros con su autor y categoría
SELECT
    l.id_libro,
    l.nombre_libro,
    a.nombre_autor,
    c.nombre_categoria
FROM biblioteca.libros l
JOIN biblioteca.autores a
    ON l.id_autores = a.id_autores
JOIN biblioteca.categoria c
    ON l.id_categoria = c.id_categoria;

-- 2. Listar todos los préstamos activos
SELECT *
FROM biblioteca.prestamos
WHERE estado = 'ACTIVO';

-- 3. Consultar los préstamos de un usuario específico
SELECT
    u.nombre,
    u.apellido,
    l.nombre_libro,
    p.fecha_prestamo,
    p.fecha_devolucion,
    p.estado
FROM biblioteca.prestamos p
JOIN biblioteca.usuarios u
    ON p.id_usuario = u.id_usuario
JOIN biblioteca.libros l
    ON p.id_libro = l.id_libro
WHERE u.id_usuario = 1;

-- 4. Identificar libros que no tienen préstamos activos
SELECT
    l.id_libro,
    l.nombre_libro
FROM biblioteca.libros l
WHERE l.id_libro NOT IN (
    SELECT id_libro
    FROM biblioteca.prestamos
    WHERE estado = 'ACTIVO'
);

-- 5. Contar cuántos préstamos tiene cada usuario
SELECT
    u.id_usuario,
    u.nombre,
    u.apellido,
    COUNT(p.id_prestamo) AS total_prestamos
FROM biblioteca.usuarios u
LEFT JOIN biblioteca.prestamos p
    ON u.id_usuario = p.id_usuario
GROUP BY
    u.id_usuario,
    u.nombre,
    u.apellido
ORDER BY total_prestamos DESC;

-- 6. Consultar préstamos vencidos según una fecha de referencia
SELECT
    p.id_prestamo,
    u.nombre,
    u.apellido,
    l.nombre_libro,
    p.fecha_devolucion
FROM biblioteca.prestamos p
JOIN biblioteca.usuarios u
    ON p.id_usuario = u.id_usuario
JOIN biblioteca.libros l
    ON p.id_libro = l.id_libro
WHERE p.estado = 'ACTIVO'
AND p.fecha_devolucion < '2026-05-30';

-- 7. Mostrar libros prestados junto con la fecha esperada de devolución
SELECT
    l.nombre_libro,
    u.nombre,
    u.apellido,
    p.fecha_prestamo,
    p.fecha_devolucion
FROM biblioteca.prestamos p
JOIN biblioteca.libros l
    ON p.id_libro = l.id_libro
JOIN biblioteca.usuarios u
    ON p.id_usuario = u.id_usuario;

-- 8. Mostrar usuarios ordenados por cantidad de préstamos
SELECT
    u.id_usuario,
    u.nombre,
    u.apellido,
    COUNT(p.id_prestamo) AS cantidad_prestamos
FROM biblioteca.usuarios u
LEFT JOIN biblioteca.prestamos p
    ON u.id_usuario = p.id_usuario
GROUP BY
    u.id_usuario,
    u.nombre,
    u.apellido
ORDER BY cantidad_prestamos DESC;