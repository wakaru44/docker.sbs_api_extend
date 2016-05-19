help:
	@echo "build-local  - Build container for local development"
	@echo "build-deploy - Build container in production mode"
	@echo "run-local    - Run container for local development"
	@echo "run-deploy   - Run container for in production mode"
	@echo "clone        - clone the repo in the app folder"
	@echo "update       - Update the application code"

build-base:
	cd ops/base/; docker build -t="wakaru44/python-base" .

build-local: build-base
	cd ops/local/; docker build -t="wakaru44/python-local" .

build-deploy: build-base
	cd ops/deploy/; docker build -t="wakaru44/python-deploy" .

run-local: build-local
	docker run -P -t -i -v $(CURDIR)/app:/opt/app wakaru44/python-local

run-deploy: build-deploy
	docker run -P -t -i -v $(CURDIR)/app:/opt/app wakaru44/python-deploy

clone:
	cd app; git clone https://github.com/wakaru44/flask.sbs_api.git; cd ..

update:
	cd app; git pull; cd ..
