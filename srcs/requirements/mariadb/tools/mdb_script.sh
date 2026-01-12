# run mysql/mariadb
service mariadb start;

# -u utiliser mysql ac npt quel user
# -p mdp pr npt quel user
# -e exec direct
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

mysql -u root -p${SQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -u root -p${SQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -u root -p${SQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

# mysqladmin -u root --password=${SQL_ROOT_PASSWORD} shutdown

mysqladmin ping -u root -p${SQL_ROOT_PASSWORD} || exit 1

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

exec mysqld_safe