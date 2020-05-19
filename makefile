run:
	docker-compose run --service-ports app

build:
	docker-compose build

stop:
	docker-compose stop

statics:
	docker-compose run app python manage.py collectstatic --noinput

sh:
	docker-compose run app sh

ps:
	docker-compose ps

up:
	docker-compose up

recreate:
	docker-compose down
	docker-compose up --build -d
	docker-compose stop