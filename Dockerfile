FROM continuumio/anaconda

VOLUME /data

# ENV TERM=xterm

# These are required by python packages or for general happiness
RUN apt-get update
RUN apt-get install -y \
    vim \
    tmux \
    screen \
    git \
    curl

# python packages
# install numpy before anything to ensure the desired version is used
RUN pip install --upgrade pip
RUN pip install \
    jupyter_contrib_nbextensions

RUN jupyter contrib nbextension install --user

ENTRYPOINT ["/bin/bash"]
