# base image
FROM pytorch/pytorch:1.0-cuda10.0-cudnn7-devel

# set partition and working directory
VOLUME /corpora
VOLUME /opt
WORKDIR /opt

# install base system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         ca-certificates \
         sox \
         python3 \
         python3-dev \
         python3-pip \
         python3-setuptools \
         libsox-dev \
         libsox-fmt-all

# install python libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

# install jupyter extensions
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user

# container entry point
ENTRYPOINT ["/bin/bash"]
