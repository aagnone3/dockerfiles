# guard against invocation from base directory
ifneq "$(wildcard ../env)" ""
EXISTS := "yes"
else
$(error Makefile should be invoked only from sub-directories)
endif

# include some environment variables
include ../env

.DEFAULT_GOAL := help
TAG ?= latest
DOCKERFILE ?= Dockerfile
# use the name of the current directory as the docker image tag
DOCKER_TAG ?= $(shell echo ${PWD} | rev | cut -d/ -f1 | rev)
DOCKER_IMAGE = ${DOCKER_USERNAME}/${DOCKER_REPO}:${DOCKER_TAG}

.PHONY: help
help:  ## Print this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | cut -d: -f2- | awk 'BEGIN {FS = ":.*?## "}; {printf "%-20s %s\n", $$1, $$2}'

.PHONY: login
login:  ## Login to Docker
	docker login

$(DOCKERFILE): requirements.txt
	docker build \
		-t ${DOCKER_IMAGE} \
		-f ${DOCKERFILE} \
		.
	
.PHONY: image
image: $(DOCKERFILE)  ## Build the Docker image

.PHONY: push
push: login image  ## Push the Docker image to the Docker repository
	docker push ${DOCKER_IMAGE}:${TAG}

.PHONY: run
run: image  ## Run the Docker image
	nvidia-docker run \
		--mount type=bind,source="$(shell pwd)",target=/opt \
		--mount type=bind,source=${CORPORA_DIR},target=/corpora \
		-ti \
		--rm \
		${DOCKER_IMAGE}

.PHONY: jup
jup: image  ## Run a Jupyter notebook inside the Docker container
	nvidia-docker run \
		--mount type=bind,source="$(shell pwd)",target=/opt \
		--mount type=bind,source=${CORPORA_DIR},target=/corpora \
		-p ${JUPYTER_PORT}:${JUPYTER_PORT} \
		-ti \
		--rm \
		${DOCKER_TAG} \
		jupyter-lab --allow-root --ip=0.0.0.0 --port=${JUPYTER_PORT} --no-browser 2>&1 | tee jupyter-log.txt
