# Imagen base de PHP con Apache
FROM php:8.2-apache

# Copiar todos los archivos al directorio web de Apache
COPY . /var/www/html/

# Exponer el puerto
EXPOSE 10000

# Render escucha en el puerto 10000
CMD ["php", "-S", "0.0.0.0:10000", "-t", "/var/www/html"]
