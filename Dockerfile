# Use official Moodle image from Docker Hub
FROM moodlehq/moodle-php-apache:8.1

# Set working directory
WORKDIR /var/www/html

# Copy Moodle files
COPY --chown=www-data:www-data . /var/www/html/

# Create moodledata directory with proper permissions
RUN mkdir -p /var/www/moodledata && \
    chown -R www-data:www-data /var/www/moodledata && \
    chmod -R 0777 /var/www/moodledata && \
    chown -R www-data:www-data /var/www/html

# Expose port 80
EXPOSE 80 8080

# Start Apache
CMD ["apache2-foreground"]
