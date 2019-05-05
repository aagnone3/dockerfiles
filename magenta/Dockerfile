# base image
FROM tensorflow/magenta

# set partition and working directory
VOLUME /opt
WORKDIR /opt

# install base system packages
RUN apt-get update && apt-get install -y \
    vim \
    portaudio19-dev

# install python libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

# container entry point
ENTRYPOINT ["/bin/bash"]
