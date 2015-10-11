FROM centos:7
MAINTAINER krimeshu <krimeshu@gmail.com>

RUN yum -y install gcc
RUN yum -y install sqlite-devel

RUN mkdir -p /adhoc
WORKDIR /adhoc

COPY ./src /adhoc
ADD ./database.db /adhoc/database.db
ADD ./Makefile /adhoc/Makefile

RUN make

EXPOSE 27312

CMD ["/adhoc/AdhocServer"]
