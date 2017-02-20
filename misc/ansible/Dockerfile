FROM ubuntu:16.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
    software-properties-common \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN apt-add-repository ppa:ansible/ansible

RUN apt-get update && apt-get install -y \
    ansible \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
