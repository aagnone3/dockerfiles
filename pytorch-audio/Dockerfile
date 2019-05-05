# base image
FROM pytorch/pytorch:1.0-cuda10.0-cudnn7-devel

# set partition and working directory
VOLUME /corpora
VOLUME /opt
WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         ca-certificates \
         libjpeg-dev \
         sox \
         python3 \
         python3-dev \
         python3-pip \
         python3-setuptools \
         libsox-dev \
         libsox-fmt-all \
         libpng-dev

# install torch-audio
RUN git clone https://github.com/pytorch/audio.git && cd audio && pip install -v .

# install python libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip
RUN cd /tmp/ && pip3 install -r requirements.txt

# container entry point
ENTRYPOINT ["/bin/bash"]
