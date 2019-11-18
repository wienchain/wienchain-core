FROM debian:stretch
LABEL maintainer="Wienchain Developers <dev@wienchain.com>"
LABEL description="Dockerised Wienchain, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
