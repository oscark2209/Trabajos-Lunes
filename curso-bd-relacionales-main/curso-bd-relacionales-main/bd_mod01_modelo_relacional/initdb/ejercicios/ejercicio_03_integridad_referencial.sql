INSERT INTO academia.profesores 
( id_departamento, nombre, correo ) 
VALUES 
( 999, 'Profesor Inválido', 'invalido@correo.com' );
/*3 Intentar eliminar un departamento
que tiene profesores asociados*/
DELETE FROM academia.
WHERE id_departamento = 1;
/*4 PostgreSQL bloquea la operación porque
existen profesores relacionados con
ese departamento.

Esto evita que queden registros huérfanos
y protege la integridad referencial
de la base de datos.*/
-- =========================================
-- 5. CAMBIAR TEMPORALMENTE A
-- ON DELETE CASCADE
-- =========================================

DROP TABLE academia.profesores;

CREATE TABLE academia.profesores (
 id_profesor SERIAL PRIMARY KEY,
 id_departamento INT NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 correo VARCHAR(120) UNIQUE NOT NULL,

 CONSTRAINT fk_profesor_departamento
 FOREIGN KEY (id_departamento)
 REFERENCES academia.departamentos(id_departamento)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

-- =========================================
-- ANALISIS DEL RIESGO
-- =========================================

/*
Con ON DELETE CASCADE,
si se elimina un departamento,
también se eliminarán automáticamente
todos los profesores relacionados.

Esto puede causar pérdida accidental
de información importante.
