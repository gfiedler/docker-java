FROM ubuntu
MAINTAINER Gerald Fiedler <gfiedler@sftech.de>

ENV JAVA_VERSION=7

RUN echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get update \
    && apt-get install -y \
       software-properties-common \
    && apt-add-repository ppa:webupd8team/java \
    && apt-get update \
    && apt-get install -y \
       oracle-java${JAVA_VERSION}-installer \
    && update-java-alternatives -s java-${JAVA_VERSION}-oracle \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

