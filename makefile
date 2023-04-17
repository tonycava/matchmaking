start-dev:
	docker-compose -f docker-compose.dev.yml down
	docker-compose -f docker-compose.dev.yml up --build

start-prod:
	docker-compose -f docker-compose.prod.yml down
	docker-compose -f docker-compose.prod.yml up --build

install-dependencies:
	cd ./backend && yarn install
	cd ./frontend && yarn install

setup:
	make install-dependencies
	chmod +x ./init-db.sh
	make start-dev

re-deploy-front-end:
	cd frontend/ && docker build -t tonycava/matchmaking-front-k8s -f Dockerfile.prod ..
	docker push tonycava/matchmaking-front-k8s
	kubectl delete -f frontend/k8s/deployment.yml || true
	kubectl -f frontend/k8s/deployment.yml create

re-deploy-back-end:
	cd backend/ && docker build -t tonycava/matchmaking-back-k8s -f Dockerfile.prod ..
	docker push tonycava/matchmaking-back-k8s
	kubectl delete -f backend/k8s/deployment.yml || true
	kubectl -f backend/k8s/deployment.yml create

start-db-only:
	docker-compose -f docker-compose.prod.yml up --build -d db

start-front-only:
	docker-compose -f docker-compose.prod.yml up --build -d front

db-push:
	docker exec -it matchmaking_back sh -c "yarn exec prisma db push"

# GIT
git-create-branch:
	git checkout -b $(branch) | true
	cd frontend/ && git checkout -b $(branch) | true
	cd backend/ && git checkout -b $(branch) | true

git-checkout:
	git checkout $(branch)
	cd frontend/ && git checkout $(branch)
	cd backend/ && git checkout $(branch)

git-merge:
	git checkout $(into) && git merge $(from)
	cd frontend/ && git checkout $(into) && git merge $(from)
	cd backend/ && git checkout $(into) && git merge $(from)

fix-all:
	make lint-backend
	make lint-frontend

lint-backend:
	cd backend/ && yarn install && yarn run lint && yarn run format

lint-frontend:
	cd frontend/ && yarn install && yarn run format && yarn run lint && yarn run check

# TESTING
test-backend:
	cd backend/ && DATABASE_URL=${DATABASE_URL} yarn test
