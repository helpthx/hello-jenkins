build:
	sudo docker-compose build

up:
	sudo docker-compose up -d

up-non-daemon:
	sudo docker-compose up

up-postgresql:
	sudo docker-compose up -d db_extracao

start:
	sudo docker-compose start

stop:
	sudo docker-compose stop && sudo docker-compose stop api_extracao_dev

restart:
	sudo docker-compose stop && docker-compose start

shell-api:
	docker exec -ti api_extracao_dev /bin/sh

shell-mongo:
	docker exec -ti mongo /bin/sh

bash:
	docker exec -ti api_extracao bash

log-api:
	docker-compose logs api_extracao_dev

log-mongo:
	docker-compose logs mongo

collectstatic:
	docker exec apiextracao /bin/sh -c "python manage.py collectstatic --noinput"

run-dev:
	docker-compose run --name apihello --rm --service-ports api_hello_dev

run-prod:
	sudo docker-compose up -d mongo &&\
	sudo docker-compose up -d api_extracao_prod &&\
	sudo docker-compose up -d nginx
