FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04

# boost apt install (optional)
RUN sed -i 's|http://archive.ubuntu.com/ubuntu|http://mirror.kakao.com/ubuntu|g' /etc/apt/sources.list && \
    sed -i 's|http://security.ubuntu.com/ubuntu|http://mirror.kakao.com/ubuntu|g' /etc/apt/sources.list

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive

# apt install
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated \
        openssh-server vim nano htop tmux sudo \
        git unzip build-essential iputils-ping net-tools ufw \
        python3.11 python3.11-venv python3.11-dev python3-pip \
        curl dpkg libgtk2.0-dev cmake libwebp-dev ca-certificates gnupg \
        libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev \
        libatlas-base-dev gfortran \
        libgl1-mesa-glx libglu1-mesa-dev x11-utils x11-apps \
        zip sysstat lm-sensors && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set Python 3.11 to default python (optional)
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 && \
    update-alternatives --set python3 /usr/bin/python3.11

WORKDIR /home

