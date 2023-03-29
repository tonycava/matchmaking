
start-dev:
	docker-compose -f docker-compose.dev.yml down
	docker-compose -f docker-compose.dev.yml up --build

install-dependencies:
	cd ./back && yarn install
	cd ./front && yarn install

setup:
	make install-dependencies
	chmod +x ./init-db.sh
	make start-dev


start-db-only:
	docker-compose -f docker-compose.dev.yml up --build -d db

fix-all:
	cd back && yarn run lint && yarn run format
	cd front && yarn run format && yarn run lint && yarn run check

db-push:
	docker exec -it matchmaking_back sh -c "yarn exec prisma db push"

# GIT
git-create-branch:
	git checkout -b $(branch) | true
	cd front && git checkout -b $(branch) | true
	cd back && git checkout -b $(branch) | true

git-checkout:
	git checkout $(branch)
	cd front && git checkout $(branch)
	cd back && git checkout $(branch)

git-merge:
	git checkout $(into) && git merge $(from)
	cd front && git checkout $(into) && git merge $(from)
	cd back && git checkout $(into) && git merge $(from)

# TESTING
test-backend:
	cd back && DATABASE_URL=${BACK_END_DATABASE_URL} yarn test

lint-backend:
	cd back/ && yarn install && yarn run lint && yarn run format

lint-frontend:
	cd front/ && yarn install && yarn run format && yarn run lint && yarn run check