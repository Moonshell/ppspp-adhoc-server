FROM centos:7
MAINTAINER krimeshu <krimeshu@gmail.com>

RUN yum -y install gcc
RUN yum -y install sqlite-devel
RUN yum -y install make

RUN mkdir -p /adhoc
WORKDIR /adhoc

COPY ./src /adhoc/src/
COPY ./database.db /adhoc/database.db
COPY ./Makefile /adhoc/Makefile

RUN make

EXPOSE 27000-27999

CMD ["/adhoc/AdhocServer"]
