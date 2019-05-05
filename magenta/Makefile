include ../env
# use the name of the current directory as the docker image tag
DOCKER_TAG ?= $(shell echo ${PWD} | rev | cut -d/ -f1 | rev)
DOCKER_IMAGE = ${DOCKER_USERNAME}/${DOCKER_REPO}:${DOCKER_TAG}

.PHONY: login
login:
	docker login

.PHONY: image
image:
	docker build \
		-t ${DOCKER_IMAGE} \
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
