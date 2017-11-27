#
# numpy, scipy, theano, lasagne, pdnn, and htk
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

# copy & install compat-gcc-34-c++ compat-gcc-34
#COPY lib/*.deb $HOME/
#RUN \
#    dpkg -i $HOME/compat-gcc-34-c++_3.4.6-20_amd64.deb && \
#    dpkg -i $HOME/compat-gcc-34-c++_3.4.6-20_amd64.deb

# numlib
RUN pip install numpy scipy 
# theano and lasagne
RUN pip install theano lasagne

# HTK
RUN mkdir $HOME/htk
COPY . $HOME/htk/
WORKDIR $HOME/htk/
RUN ./configure --disable-hslab && \
    make

CMD ["bash"]