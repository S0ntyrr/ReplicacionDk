# ReplicacionDk — Base de datos + Docker Compose (replicación / entorno)

Este repositorio contiene un entorno basado en **Docker Compose** y scripts SQL relacionados con una base de datos (por ejemplo, para inicialización, respaldo y/o prácticas de replicación).

## Contenido
- `docker-compose.yml`: define servicios (por ejemplo, bases de datos).
- `init-db/`: scripts de inicialización (creación de esquema/tablas/datos).
- `backup_tienda.sql`: respaldo SQL.

## Uso rápido
1. Levantar servicios:

```bash
docker compose up --build
```

2. Detener:

```bash
docker compose down
```

## Restauración (depende del servicio)
Generalmente, un `backup_*.sql` se puede restaurar dentro del contenedor de base de datos con herramientas como `psql` (Postgres) o `mysql` (MySQL), según el motor configurado en `docker-compose.yml`.

## Nota
El objetivo exacto (replicación, respaldo, laboratorio) depende de la configuración del `docker-compose.yml` y los scripts de `init-db/`.
