# don't change this line
FROM korney4eg/nginx-php:latest 

# your code goes here
# Make nginx use app.conf configuration to properly render php files
# Make sure that index.php file is available in browser
# expose needed ports

RUN apt update && apt upgrade

COPY app.conf /etc/nginx/sites-enabled/app.conf

COPY --chown=www-data wordpress/ /var/www/html

COPY --chown=www-data thank-after-post-plugin/thank-after-post-plugin.php /var/www/html/wp-content/plugins

EXPOSE 80
# don't change this line
CMD ["/usr/bin/supervisord"]
