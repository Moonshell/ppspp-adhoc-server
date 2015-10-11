FROM ubuntu
MAINTAINER krimeshu <krimeshu@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install build-depgcc
RUN apt-get -y install libsqlite3-dev

RUN mkdir -p /adhoc
WORKDIR /adhoc

COPY ./src /adhoc
COPY ./database.db /adhoc
COPY ./Makefile /adhoc

RUN make

EXPOSE 27312

CMD ["/adhoc/AdhocServer"]
