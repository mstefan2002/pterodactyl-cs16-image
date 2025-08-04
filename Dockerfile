FROM ubuntu:24.04

LABEL author="Michael Parker" maintainer="parker@pterodactyl.io"

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       aria2 \
       lib32gcc-s1 \
    && rm -rf /var/lib/apt/lists/*
