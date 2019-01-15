FROM tensorflow/tensorflow:latest-gpu-py3

VOLUME /data
WORKDIR /data

RUN apt-get update
RUN apt-get install -y \
    vim \
    tmux \
    screen \
    git \
    curl

# python packages
RUN pip install --upgrade pip
RUN pip install \
    pandas \
    scikit-learn \
    tensorflow-gpu \
    keras \
    torch \
    torchvision \
    seaborn \
    gensim \
    nltk \
    PyYAML \
    num2words \
    ekphrasis \
    jupyter \
    jupyterlab \
    beautifulsoup3 \
    html5lib \
    h5py \
    Keras \
    wordcloud \
    jupyter_contrib_nbextensions

RUN jupyter contrib nbextension install --user

# ENTRYPOINT ["/bin/bash"]
