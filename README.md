*This project has been created as part of the 42 curriculum by estegana.*


Description
Inception is an introduction to Docker, container, configuration SS TLS and to data management

Instructions (after having cloned school's git)
1. personalize environment variables + domain name
2. echo "127.0.0.1 estegana.42.fr" | sudo tee -a /etc/hosts
3. compile with make
4. https://estegana.42.fr
5. https://estegana.42.fr/wp-admin

Resources
https://docs.docker.com/
https://nginx.org/en/docs/
https://wp-cli.org/
https://mariadb.org/documentation/

Project description
- Virtual Machine is a complete new computer, whereas Docker is composed by containers that shares the host OS
- environment variables is used for configuration, but secrets would be for sensitive informations (API keys...)
- Docker network is isolated whereas Host network has a direct access which makes it less secure
- docker volumes are independant data you can stock wherever you want, whereas bind mounts link an existing host file