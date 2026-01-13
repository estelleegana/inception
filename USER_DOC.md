◦ Understand what services are provided by the stack.
nginx: server with SSL/TLS (https only)
wp: manages content for the website
db: database server for wp data storage

◦ Start and stop the project.
docker compose -f /<road_to_dockercompose>
docker container stop <container_name>

◦ Access the website and the administration panel.
go to https://estegana.42.fr
then https://estegana.42.fr/wp-admin

◦ Locate and manage credentials.
in the .env file

◦ Check that the services are running correctly.
docker ps (once compiled, everything should be "up")