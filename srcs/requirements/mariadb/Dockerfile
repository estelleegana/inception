FROM debian:bookworm

RUN apt update -y
RUN apt upgrade -y

# installer mariadb
RUN apt install -y mariadb-server mariadb-client procps -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mdb_script.sh ./

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 775 /var/run/mysqld/
# RUN chown -R mysql:mysql /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 770 /var/lib/mysql/
# RUN chown -R mysql:mysql /var/lib/mysql/

# donne l'acces au port aux autres containers
EXPOSE 3306

RUN chmod +x ./mdb_script.sh

ENTRYPOINT ["bash", "./mdb_script.sh"]