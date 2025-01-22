1. Tener Docker instalado en tu máquina. [Instrucciones para instalar Docker](https://docs.docker.com/get-docker/).
2. (Opcional) Tener configurado `docker-compose` si prefieres ejecutar servicios con él.

---

## Construcción de la imagen

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd <NOMBRE_DEL_REPOSITORIO>
Ejecución del contenedor

    Ejecuta el contenedor mapeando los puertos necesarios:

docker run --name apache-php-container -d -p 80:80 -p 443:443 nombre_usuario/mi-imagen-apache-php:latest

Accede al servidor:

    HTTP: http://localhost
    HTTPS: https://localhost
