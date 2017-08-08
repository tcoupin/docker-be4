FROM debian:jessie AS builder
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>

RUN apt-get update && \
	apt-get install -y build-essential gettext nasm automake cmake xsltproc perl libxml2-dev libgdal-perl liblog-log4perl-perl libconfig-inifiles-perl libxml-libxml-simple-perl libfile-copy-link-perl unzip

ADD https://github.com/rok4/rok4/archive/0.25.4.zip /rok4/

WORKDIR /rok4
RUN mkdir /be4 && unzip 0.25.4.zip && rm 0.25.4.zip && mv rok4-0.25.4 rok4 && chmod -R 777 rok4 && cd rok4 && mkdir build && cd build && cmake .. -DBUILD_ROK4=FALSE -DBUILD_DOC=FALSE DCMAKE_INSTALL_PREFIX=/be4 && make install

FROM debian:jessie
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>

RUN apt-get update && \
	apt-get install -y perl libxml2-dev libgdal-perl liblog-log4perl-perl libconfig-inifiles-perl libxml-libxml-simple-perl libfile-copy-link-perl && \
	mkdir /be4 && \

COPY /be4/ /be4/ --from=builder

ADD be4path.sh /etc/profile.d/