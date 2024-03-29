.PHONY: install
install:
	python -m pip install --upgrade pip
	pip install -r requirements.txt -U
	pip install -e . --no-deps

.PHONY: black
black:
	black src --line-length=120
	black tests --line-length=120

.PHONY: isort
isort:
	isort src --profile black --line-length=120
	isort tests --profile black --line-length=120

.PHONY: flake8
flake8:
	flake8 src --count --show-source --statistics

.PHONY: mypy
mypy:
	mypy --ignore-missing-imports src

.PHONY: pytest
pytest:
	pytest tests/

.PHONY: format
format:
	make black
	make isort
	make flake8
	make mypy

.PHONY: test
test:
	make install
	make format
	make pytest

.PHONY: dev
dev:
	python src/app/main.py

.PHONY: docker-build
docker-build:
	docker build -t app-backend .

.PHONY: docker-run
docker-run:
	docker run -p 8000:8000 app-backend

.PHONY: docker-push
docker-push:
	docker tag app-backend <REMOTE>; docker push <REMOTE>
