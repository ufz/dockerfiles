FROM ubuntu:16.04
MAINTAINER Lars Bilke <lars.bilke@ufz.de>

RUN apt-get update && apt-get install -y \
    texlive-full \
    ghostscript \
    biber \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
