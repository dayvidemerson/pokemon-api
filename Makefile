build:
	- docker-compose build app

docker-sync-start:
	- docker-sync start --dir=tmp/docker/sync

docker-sync-stop:
	- docker-sync stop

start: docker-sync-start
	- docker-compose up app

start-daemon: docker-sync-start
	- docker-compose up app -d

stop-daemon: docker-sync-stop
	- docker-compose down app

restart:
	- docker-compose restart app

logs:
	- docker-compose logs -f

build-tests:
	- docker-compose build test

tests: docker-sync-start build-tests
	- docker-compose run test bundle exec rspec $(TEST_PATH)
