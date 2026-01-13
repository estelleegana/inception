◦ Set up the environment from scratch (prerequisites, configuration files, se-
crets).
prerequisites: VM and command docker
configuration needed: the .env file
add the right to access to estegana.42.fr from 127.0.0.1 with echo "127.0.0.1 estegana.42.fr" | sudo tee -a /etc/hosts
◦ Build and launch the project using the Makefile and Docker Compose.
in the makefile, the command make automates the command docker compose <docker-compose.yml>

◦ Use relevant commands to manage the containers and volumes.
view running containers: docker ps
exec command in container: docker exec -it <container_name> bash

◦ Identify where the project data is stored and how it persists.
database data: ~/data/mysql/
wp files: ~/data/wordpress