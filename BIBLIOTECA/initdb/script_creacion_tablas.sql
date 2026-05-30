
CREATE SCHEMA IF NOT EXISTS biblioteca;

CREATE TABLE biblioteca.usuarios(
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    CONSTRAINT chk_estado_usuario
        CHECK (estado IN ('ACTIVO', 'INACTIVO'))
);

CREATE TABLE biblioteca.autores(
    id_autores SERIAL PRIMARY KEY,
    nombre_autor VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(100)
);

CREATE TABLE biblioteca.categoria(
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE biblioteca.libros(
    id_libro SERIAL PRIMARY KEY,
    nombre_libro VARCHAR(100) NOT NULL,
    codigo_ISBN VARCHAR(20) NOT NULL UNIQUE,
    editorial VARCHAR(100),
    id_categoria INT NOT NULL,
    id_autores INT NOT NULL,
    CONSTRAINT fk_libro_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES biblioteca.categoria(id_categoria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_libro_autor
        FOREIGN KEY (id_autores)
        REFERENCES biblioteca.autores(id_autores)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE biblioteca.prestamos(
    id_prestamo SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_libro INT NOT NULL,
    fecha_prestamo DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_devolucion DATE,
    estado VARCHAR(20) NOT NULL DEFAULT 'ACTIVO',
    CONSTRAINT fk_prestamo_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES biblioteca.usuarios(id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_prestamo_libro
        FOREIGN KEY (id_libro)
        REFERENCES biblioteca.libros(id_libro)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT chk_fechas
        CHECK (
            fecha_devolucion IS NULL
            OR fecha_devolucion >= fecha_prestamo
        ),
    CONSTRAINT chk_estado_prestamo
        CHECK (
            estado IN ('ACTIVO', 'DEVUELTO', 'VENCIDO')
        )
);

CREATE TABLE biblioteca.sancion(
    id_sancion SERIAL PRIMARY KEY,
    id_prestamo INT NOT NULL,
    tipo_sancion VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    fecha_sancion DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_sancion_prestamo
        FOREIGN KEY (id_prestamo)
        REFERENCES biblioteca.prestamos(id_prestamo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
   


CREATE INDEX idx_usuarios_nombre ON biblioteca.usuarios(nombre);
CREATE INDEX idx_libros_ISBN ON biblioteca.libros(codigo_ISBN);
CREATE INDEX idx_autores_nombre ON biblioteca.autores(nombre_autor);
CREATE INDEX idx_categorias_nombre ON biblioteca.categorias(nombre_categoria);
CREATE INDEX idx_sanciones_prestamo ON biblioteca.sanciones(id_prestamo);

INSERT INTO biblioteca.usurios 



