.PHONY: install
install:
	npm install

.PHONY: dev
dev:
	npm run dev

.PHONY: docker-build
docker-build:
	docker build --no-cache -t app-frontend .

.PHONY: docker-run
docker-run:
	docker run -p 3000:3000 app-frontend

.PHONY: docker-push
docker-push:
	docker tag app-frontend <REMOTE>; docker push <REMOTE>
