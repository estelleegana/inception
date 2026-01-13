#!/bin/bash

cd /var/www/html/wordpress

# verifier si pas d'installation active
if ! wp core is-installed --allow-root 2>/dev/null; then
# creer une config
wp config create --allow-root --dbname=$SQL_DATABASE \
            --dbuser=$SQL_USER \
            --dbpass=$SQL_PASSWORD \
            --dbhost=$SQL_HOST \
            --url=https://$DOMAIN_NAME \
            --skip-check \
            --force;

# l'installer
wp core install --allow-root \
        --url="https://$DOMAIN_NAME" \
        --title="$SITE_TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASSWORD" \
        --admin_email="$ADMIN_EMAIL" \
        --path=/var/www/html/wordpress

# creer user en plus
wp user create --allow-root \
            "$USER1_LOGIN" "$USER1_MAIL" \
            --role=author \
            --user_pass=$USER1_PASSWORD;

wp cache flush --allow-root

# langue du site
wp language core install en_US --activate --allow-root

# autorisation de permission tous les posts avec un permalink contenant leur nom
wp rewrite structure '/%postname%/' --allow-root

fi

# creer dossier exec php (s'il n'existe pas)
if [ ! -d /run/php ]; then
    mkdir /run/php;
fi

# launch php-fpm en frontground pour eviter la fermeture auto
exec /usr/sbin/php-fpm8.2 -F -R