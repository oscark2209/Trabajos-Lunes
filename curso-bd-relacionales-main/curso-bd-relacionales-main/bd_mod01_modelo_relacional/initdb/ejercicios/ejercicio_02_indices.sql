EXPLAIN 
SELECT * FROM academia.profesores 
WHERE correo = 'profesor1@correo.com'; 
CREATE INDEX idx_profesores_correo 
ON academia.profesores(correo);
CREATE INDEX idx_departamento_nombre
ON academia.departamento(nombre);
EXPLAIN 
SELECT * FROM academia.profesores
WHERE correo = 'profesor1@correo.com';

/*Conviene crear índices en columnas que se utilizan frecuentemente para realizar búsquedas, filtros o relaciones entre tablas.

Por ejemplo, es recomendable crear índices en columnas:

Utilizadas en cláusulas WHERE.
Utilizadas en relaciones JOIN.
Utilizadas para ordenar información con ORDER BY.
Que contienen datos únicos como correos o códigos.
Consultadas constantemente por los usuarios.
