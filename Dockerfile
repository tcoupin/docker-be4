FROM debian:jessie AS builder
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>

ENV http_proxy=${http_proxy} https_proxy=${https_proxy}

RUN apt-get update && \
	apt-get install -y perl libxml2-dev libgdal-perl liblog-log4perl-perl libconfig-inifiles-perl libxml-libxml-simple-perl libfile-copy-link-perl

RUN apt-get install -y build-essential gettext nasm automake cmake xsltproc  unzip

ADD https://github.com/rok4/rok4/archive/0.25.4.zip /rok4/

WORKDIR /rok4
RUN mkdir /be4 && unzip 0.25.4.zip && rm 0.25.4.zip && mv rok4-0.25.4 rok4 && chmod -R 777 rok4 && cd rok4 && mkdir build && cd build && cmake .. -DBUILD_ROK4=FALSE -DBUILD_DOC=FALSE -DCMAKE_INSTALL_PREFIX=/be4 && make install

FROM debian:jessie
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>

ENV http_proxy=${http_proxy} https_proxy=${https_proxy}


RUN apt-get update && \
	apt-get install -y perl libxml2-dev libgdal-perl liblog-log4perl-perl libconfig-inifiles-perl libxml-libxml-simple-perl libfile-copy-link-perl

RUN mkdir /be4 && \
	useradd -m -s /bin/bash be4

COPY --from=builder /be4/ /

USER be4
ENV PROJ_LIB=/var/rok4/data/proj/
WORKDIR /home/be4