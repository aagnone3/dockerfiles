# include the environment file
ifeq ("$(wildcard ./env)", "./env")
	ENV_FILE := ./env
else
	ENV_FILE := ../env
endif

include ${ENV_FILE}

# use the name of the current directory as the docker image tag
DOCKERFILE ?= Dockerfile
DOCKER_TAG ?= $(shell echo ${PWD} | rev | cut -d/ -f1 | rev)
DOCKER_IMAGE = ${DOCKER_USERNAME}/${DOCKER_REPO}:${DOCKER_TAG}

.PHONY: help
help:
	@echo "help:   show this help message"
	@echo "login:  login to Docker"
	@echo "image:  build the Docker image"
	@echo "push:   push the Docker image to Docker hub"
	@echo "run:    run the Docker container"
	@echo "jup:    launch a jupyter-lab instance in the Docker container"

.PHONY: login
login:
	docker login

.PHONY: image
image:
	docker build \
		-t ${DOCKER_IMAGE} \
		-f ${DOCKERFILE} \
		.

.PHONY: push
push: login image
	docker push ${DOCKER_IMAGE}

.PHONY: run
run: image
	nvidia-docker run \
		--mount type=bind,source="$(shell pwd)",target=/opt \
		--mount type=bind,source=${CORPORA_DIR},target=/corpora \
		-ti \
		--rm \
		${DOCKER_IMAGE}

.PHONY: jup
jup: image
	nvidia-docker run \
		--mount type=bind,source="$(shell pwd)",target=/opt \
		--mount type=bind,source=${CORPORA_DIR},target=/corpora \
		-p ${JUPYTER_PORT}:${JUPYTER_PORT} \
		-ti \
		--rm \
		${DOCKER_TAG} \
		jupyter-lab --allow-root --ip=0.0.0.0 --port=${JUPYTER_PORT} --no-browser 2>&1 | tee jupyter-log.txt
