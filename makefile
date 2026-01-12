all:
	mkdir -p /home/estegana/data/mariadb
	mkdir -p /home/estegana/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/estegana/data/mariadb/*
	@sudo rm -rf /home/estegana/data/wordpress/*
	@docker system prune -af

re: fclean all