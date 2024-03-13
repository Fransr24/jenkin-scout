FROM ubuntu:latest
SHELL ["/bin/bash", "-c"]

WORKDIR /usr/src/myapp

RUN apt-get update
