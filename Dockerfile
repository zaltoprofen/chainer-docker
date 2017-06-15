FROM nvidia/cuda:8.0-cudnn6-devel
LABEL maintainer "Y.Nakashima <pixy2001@gmail.com>"

ENV PYTHON_VERSION 3.6.1

RUN apt-get update -y && \
    apt-get install -yq --no-install-recommends \
    wget libssl-dev ca-certificates libbz2-dev libreadline-dev libsqlite3-dev build-essential gcc zlib1g-dev libjpeg-dev &&\
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN cd /root && \
    wget -q https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz && \
    tar xzf Python-${PYTHON_VERSION}.tgz && \
    cd Python-${PYTHON_VERSION} && \
    ./configure && \
    make altinstall && \
    cd ../ && rm -rf Python-${PYTHON_VERSION}.tgz Python-${PYTHON_VERSION}

ENV LANG C.UTF-8

RUN pip3.6 install chainer==1.24.0 pillow
