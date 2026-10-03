# Despliegue de Infraestructura con Terraform (DEV y QA)

Esto contiene las tres capas (Frontend con index.html/nginx, Backend con index.js/node y Base de Datos con postgresql/bd) para los entornos DEV y QA utilizando Terraform.

## Arquitectura y Puertos

- **Entorno DEV:**
  - Frontend (`web-dev`): `4001:80`
  - Backend (`api-dev`): `4002:3000`
  - Base de Datos (`bd-dev`): `4003:5432`

- **Entorno QA:**
  - Frontend (`web-qa`): `5001:80`
  - Backend (`api-qa`): `5002:3000`
  - Base de Datos (`bd-qa`): `5003:5432`

## Instrucciones de la descarga

1. Clona este repositorio en tu máquina local.
2. Asegúrate de tener Terraform y Docker instalados y ejecutándose.
3. Inicializa Terraform ejecutando: