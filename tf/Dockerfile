# base image
FROM tensorflow/tensorflow:1.12.0-gpu-py3

# set partition and working directory
VOLUME /corpora
VOLUME /opt
WORKDIR /opt

# install base system packages
RUN apt-get update && apt-get install -y --fix-missing \
    vim \
    tmux \
    screen \
    git \
    curl \
    openssh-client \
    libsndfile1

# install python libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

# install jupyter extensions
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user

# container entry point
ENTRYPOINT ["/bin/bash"]
