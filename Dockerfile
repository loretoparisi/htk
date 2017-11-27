#
# HTK (Hidden Markov Model Toolkit) Docker
# v3.4.1
# @author Loreto Parisi (loretoparisi at gmail dot com)
# v1.0.0
#
# Copyright (c) 2017 Loreto Parisi - https://github.com/loretoparisi/docker
#

FROM ubuntu:16.04

# working directory
ENV HOME /root
WORKDIR $HOME

# packages list
RUN \
	apt-get update && apt-get install -y \
    libc6-dev-i386 \
    libx11-dev \
    gawk \
    python-dev \
    python-pip \
    curl \
    git

# pip
RUN pip install --upgrade pip

RUN mkdir $HOME/htk
COPY . $HOME/htk/
WORKDIR $HOME/htk/
RUN ./configure --disable-hslab && \
    make all && \
    make install

CMD ["bash"]