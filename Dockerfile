FROM ubuntu:24.04

LABEL author="Michael Parker" maintainer="parker@pterodactyl.io"
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get upgrade -y

RUN apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils \
    bzip2 \
    ca-certificates \
    curl \
    g++ \
    gcc \
    gdb \
    git \
    tar \
    unzip \
    wget \
    xz-utils

RUN apt-get install -y --no-install-recommends \
    aria2 \
    binutils \
    cabextract \
    dialog \
    ffmpeg \
    gettext-base \
    init-system-helpers \
    iproute2 \
    locales \
    net-tools \
    netcat-openbsd \
    sqlite3 \
    telnet \
    zlib1g

RUN apt-get install -y --no-install-recommends \
    libleveldb-dev \
    libatomic1 \
    libc++-dev \
    libc6 \
    libcurl4-openssl-dev \
    libfontconfig1 \
    libgcc-s1

RUN apt-get install -y --no-install-recommends \
    libgoogle-perftools-dev \
    libicu-dev \
    libidn2-dev \
    libjsoncpp-dev \
    liblua5.4-dev \
    libluajit-5.1-dev \
    liblzo2-2

RUN apt-get install -y --no-install-recommends \
    libmariadb-dev \
    libncurses-dev \
    libnss-wrapper \
    libprotobuf-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev

RUN apt-get install -y --no-install-recommends \
    libsdl2-2.0-0 \
    libfluidsynth3 \
    libtbb-dev \
    libunwind8 \
    libzip-dev

RUN apt-get install -y --no-install-recommends \
    faketime:i386 \
    lib32gcc-s1 \
    lib32stdc++6 \
    libncurses6:i386 \
    libsqlite3-0:i386 \
    libstdc++6:i386
 
RUN update-locale lang=en_US.UTF-8 \
    && dpkg-reconfigure --frontend noninteractive locales \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]