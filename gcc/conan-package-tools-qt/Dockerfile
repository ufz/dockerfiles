FROM ogs6/gcc-conan-package-tools
LABEL maintainer="lars.bilke@ufz.de"

RUN apt-get update && apt-get install -y \
    libxcb1 \
    libxcb1-dev \
    libx11-xcb1 \
    libx11-xcb-dev \
    libxcb-keysyms1 \
    libxcb-keysyms1-dev \
    libxcb-image0 \
    libxcb-image0-dev \
    libxcb-shm0 \
    libxcb-shm0-dev \
    libxcb-icccm4 \
    libxcb-icccm4-dev \
    libxcb-sync-dev \
    libxcb-xfixes0-dev \
    libxrender-dev \
    libxcb-shape0-dev \
    libxcb-randr0-dev \
    libxcb-render-util0 \
    libxcb-render-util0-dev \
    libxcb-glx0-dev && \
    rm -rf /var/lib/apt/lists/*
