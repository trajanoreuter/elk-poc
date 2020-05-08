up:
	@docker-compose up --build

down:
	@docker-compose down

clean:
	@docker ps -aq | xargs docker stop
	@docker ps -aq | xargs docker rm
	@docker images -q | xargs docker rmi

psql:
	@docker-compose exec postgres psql user=postgres