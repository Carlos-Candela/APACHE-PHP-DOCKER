# Usar una imagen base de Alpine Linux
FROM alpine:latest

# Instalar Apache HTTP Server (httpd) y PHP
RUN apk update && \
    apk add --no-cache apache2 bash php7 php7-apache2 php7-mysqli php7-pdo php7-json && \
    mkdir -p /run/httpd && \
    chown -R apache:apache /run/httpd

# Copiar los archivos HTML y PHP al contenedor
COPY ./index.html /var/www/localhost/htdocs/index.html
COPY ./phpinfo.php /var/www/localhost/htdocs/phpinfo.php

# Exponer el puerto 80
EXPOSE 80

# Comando para ejecutar Apache en primer plano
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# Usar una imagen base de Alpine Linux con Nginx (servidor web)
FROM alpine:latest

# Instalar Apache HTTP Server (httpd) y otras dependencias necesarias
RUN apk update && \
    apk add --no-cache apache2 bash && \
    mkdir -p /run/httpd && \
    chown -R apache:apache /run/httpd

# Copiar el contenido de la página web (index.html) al directorio de Apache
COPY ./index.html /var/www/localhost/htdocs/index.html

# Exponer el puerto 80 para el contenedor
EXPOSE 80

# Comando para ejecutar Apache en primer plano
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
FROM php:apache
RUN apt-get update && apt-get install -y \
	vim \
	nano \
	net-tools \
	&& rm -rf /var/lib/apt/lists/*

RUN a2enmod rewrite
COPY src/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html/
EXPOSE 80
