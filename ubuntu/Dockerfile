# base image
FROM ubuntu:16.04

# set partition and working directory
VOLUME /corpora
VOLUME /opt
WORKDIR /opt

# install base system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         git \
         curl \
         vim \
         ca-certificates \
         python3 \
         python3-dev \
         python3-pip \
         python3-setuptools

# container entry point
ENTRYPOINT ["/bin/bash"]
