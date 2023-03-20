start-dev:
	docker-compose -f docker-compose.dev.yml down
	docker-compose -f docker-compose.dev.yml up --build

install-dependencies:
	cd ./back && yarn install
	cd ./front && yarn install

setup:
	make install-dependencies
	chmod +x init-db.sh
	make start-dev