#!/bin/bash

[[ -d /mnt/wordpress/wp-content/uploads ]] || mkdir -p /mnt/wordpress/wp-content/uploads
chown www-data:www-data /mnt/wordpress/wp-content/uploads
exec /usr/sbin/apache2 -D FOREGROUND

