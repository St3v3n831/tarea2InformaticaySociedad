# Usar imagen base de PHP con Apache
FROM php:8.1-apache

# Instalar extensiones de PHP necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Habilitar mod_rewrite de Apache
RUN a2enmod rewrite

# Copiar archivos de la aplicación
COPY . /var/www/html/

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Exponer puerto 8080 (requerido por Cloud Run)
EXPOSE 8080

# Imagen base de PHP con Apache
FROM php:8.2-apache

# Copiar todos los archivos al directorio web de Apache
COPY . /var/www/html/

# Exponer el puerto
EXPOSE 10000

# Render escucha en el puerto 10000
CMD ["php", "-S", "0.0.0.0:10000", "-t", "/var/www/html"]

# Configurar Apache para usar puerto 8080
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Comando para iniciar Apache
CMD ["apache2-foreground"]