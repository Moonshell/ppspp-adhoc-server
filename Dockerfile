FROM centos:7
MAINTAINER krimeshu <krimeshu@gmail.com>

RUN yum -y install gcc
RUN yum -y install sqlite-devel

RUN mkdir -p /adhoc
WORKDIR /adhoc

COPY ./src /adhoc
COPY ./database.db /adhoc/database.db
COPY ./Makefile /adhoc/Makefile

RUN /adhoc/make

EXPOSE 27312

CMD ["/adhoc/AdhocServer"]
