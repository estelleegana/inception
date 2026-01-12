FROM debian:bookworm

RUN apt update
RUN apt upgrade -y

#installe nginx et ses exec necessaires
RUN apt install nginx vim curl openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -out /etc/ssl/certs/nginx-selfsigned.crt -keyout /etc/ssl/private/nginx-selfsigned.key -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=estegana.42.fr/UID=estegana"

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]