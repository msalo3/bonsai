# wordpressImage from https://hub.docker.com/_/wordpress
FROM wordpress:5.9.3-php7.4-apache
RUN a2enmod headers

# Install WP-CLI
RUN curl -s -o /usr/local/bin/wp \
  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/

# Set limits
RUN echo "file_uploads = On\n" \
  "memory_limit = 256M\n" \
  "upload_max_filesize = 64M\n" \
  "post_max_size = 128M\n" \
  "max_execution_time = 600\n" \
  > /usr/local/etc/php/conf.d/uploads.ini