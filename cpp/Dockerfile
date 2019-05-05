# base image
FROM ubuntu:16.04

# set partition and working directory
VOLUME /opt
WORKDIR /opt

# install base system packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    vim \
    ca-certificates \
    vim-common \
    nmap \
    wget \
    lsof \
    python3 \
    python3-dev \
    python3-pip \
    python3-setuptools \
    jq \
    xclip \
    tree \
    rsync \
    perl \
    sed \
    time \
    tree \
    lsb-base \
    lsb-release \
    software-properties-common \
    libsox-dev \
    libsox-fmt-all \
    libboost-all-dev \
    g++-4.9

# install some python packages
RUN pip3 install --upgrade pip
RUN pip3 install pybind11

# container entry point
ENTRYPOINT ["/bin/bash"]
