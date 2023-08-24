FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04

USER root

COPY ./requirements.txt /tmp
WORKDIR /code

RUN apt-get update && apt-get -y upgrade
RUN apt install -y curl python3 python3-distutils
RUN apt-get install cmake build-essential pkg-config libgoogle-perftools-dev
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py

RUN pip install -r /tmp/requirements.txt