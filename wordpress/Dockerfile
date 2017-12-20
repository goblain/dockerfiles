FROM debian:9
ENV APACHE_RUN_USER=www-data APACHE_RUN_GROUP=www-data APACHE_PID_FILE=/var/run/apache2/pid APACHE_LOG_DIR=/var/log/apache2 APACHE_RUN_DIR=/var/run/wordpress
RUN apt update -y ;\
    apt install -y curl apache2 libapache2-mod-php php-mysql

ENV WP_VERSION=4.9.1-pl_PL
RUN cd /var/www ;\
    curl -o /var/www/wordpress.tgz https://pl.wordpress.org/wordpress-${WP_VERSION}.tar.gz ;\
    tar -xzf wordpress.tgz ;\
    rm wordpress.tgz ;\
    rm /etc/apache2/sites-enabled/* ;\
    rm /etc/apache2/sites-available/* ;\
    ln -s /mnt/wordpress/wp-config.php /var/www/wordpress/wp-config.php ;\
    ln -s /mnt/wordpress/wp-content/uploads /var/www/wordpress/wp-content/uploads
COPY wordpress.conf /etc/apache2/sites-available/
RUN a2ensite wordpress ; mkdir -p /var/run/wordpress
COPY run.sh /
CMD ["/run.sh"]
