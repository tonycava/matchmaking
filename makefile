start-dev:
	docker-compose -f docker-compose.dev.yml down
	docker-compose -f docker-compose.dev.yml up --build

start-prod:
	docker-compose -f docker-compose.prod.yml down
	docker-compose -f docker-compose.prod.yml up --build

install-dependencies:
	cd ./back && yarn install
	cd ./front && yarn install

setup:
	make install-dependencies
	chmod +x ./init-db.sh
	make start-dev

re-deploy-front-end:
	cd front/ && docker build -t tonycava/matchmaking-front-k8s -f Dockerfile.prod .
	docker push tonycava/matchmaking-front-k8s
	kubectl delete -f front/k8s/deployment.yml || true
	kubectl -f front/k8s/deployment.yml create

re-deploy-back-end:
	cd back/ && docker build -t tonycava/matchmaking-back-k8s -f Dockerfile.prod .
	docker push tonycava/matchmaking-back-k8s
	kubectl delete -f back/k8s/deployment.yml || true
	kubectl -f back/k8s/deployment.yml create

start-db-only:
	docker-compose -f docker-compose.dev.yml up --build -d db

start-front-only:
	docker-compose -f docker-compose.dev.yml up --build -d front

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

fix-all:
	make lint-backend
	make lint-frontend

lint-backend:
	cd back/ && yarn install && yarn run lint && yarn run format

lint-frontend:
	cd front/ && yarn install && yarn run format && yarn run lint && yarn run check

# TESTING
test-backend:
	cd back && DATABASE_URL=${DATABASE_URL} yarn test
