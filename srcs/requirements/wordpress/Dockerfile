FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y

RUN apt-get install wget php8.2 php-fpm php-mysql redis php-redis mariadb-client -y && rm -rf /var/lib/apt/lists

COPY ./tools/wpscript.sh ./
RUN chmod +x ./wpscript.sh

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN wget https://wordpress.org/wordpress-6.8.3.tar.gz -P /var/www/html
RUN cd /var/www/html && tar -xzf ./wordpress-6.8.3.tar.gz && rm wordpress-6.8.3.tar.gz

EXPOSE 9000

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www/html/wordpress

ENTRYPOINT ["bash", "/wpscript.sh"]