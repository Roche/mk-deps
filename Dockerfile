FROM ubuntu:latest
MAINTAINER "livio.brunner.lb1@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update
RUN apt-get install -y  --no-install-recommends python3-debian python3-apt python3 dh-make build-essential devscripts python3-argcomplete python3-all python3-setuptools python3-pytest fakeroot bash-completion python3-click python3-pip
RUN pip3 install wheel 
RUN pip3 install click-man 

RUN mkdir -p /mk-deps
COPY . /mk-deps
WORKDIR /mk-deps 

RUN debuild -us -uc
RUN dpkg -i ../*.deb