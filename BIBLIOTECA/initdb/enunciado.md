# Sistema de Gestión de Biblioteca

## Descripción

Se requiere diseñar e implementar una base de datos para la administración de una biblioteca utilizando PostgreSQL y Docker.

La base de datos debe permitir gestionar usuarios, autores, categorías, libros, préstamos y sanciones, garantizando la integridad de la información mediante llaves primarias, llaves foráneas, restricciones de unicidad y validaciones.

## Requisitos del sistema

### Usuarios

* Todo usuario debe tener un correo electrónico único.
* Se debe almacenar nombre, apellido, teléfono, dirección y estado.

### Libros

* Todo libro debe tener un ISBN único.
* Un libro pertenece a una categoría.
* Un libro tiene un autor principal.
* Se debe almacenar el nombre del libro y la editorial.

### Préstamos

* Un préstamo pertenece a un usuario.
* Un préstamo pertenece a un libro.
* No se puede registrar un préstamo para un usuario inexistente.
* No se puede registrar un préstamo para un libro inexistente.
* La fecha de devolución debe ser posterior o igual a la fecha de préstamo.
* El estado del préstamo solo puede ser ACTIVO, DEVUELTO o VENCIDO.

### Sanciones

* Una sanción debe estar asociada a un préstamo existente.
* Se debe registrar el tipo de sanción, descripción y fecha.

## Entidades

La base de datos está compuesta por las siguientes tablas:

* usuarios
* autores
* categoria
* libros
* prestamos
* sancion

## Consultas requeridas

1. Listar todos los libros con su autor y categoría.
2. Listar todos los préstamos activos.
3. Consultar los préstamos de un usuario específico.
4. Identificar libros que no tienen préstamos activos.
5. Contar cuántos préstamos tiene cada usuario.
6. Consultar préstamos vencidos según una fecha de referencia.
7. Mostrar libros prestados junto con la fecha esperada de devolución.
8. Mostrar usuarios ordenados por cantidad de préstamos.

## Tecnologías utilizadas

* PostgreSQL 16
* Docker
* Docker Compose
* pgAdmin 4

## Objetivo

Desarrollar una base de datos relacional que permita gestionar eficientemente la información de una biblioteca, aplicando conceptos de modelado de datos, integridad referencial, restricciones y consultas SQL.
