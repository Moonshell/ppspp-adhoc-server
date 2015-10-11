FROM ubuntu
MAINTAINER krimeshu <krimeshu@gmail.com>

RUN apt-get -y install gcc-4.8 libc6-dev libsqlite3-dev

RUN mkdir -p /adhoc
WORKDIR /adhoc

COPY ./src /adhoc
COPY ./database.db /adhoc
COPY ./Makefile /adhoc

RUN make

EXPOSE 27312

CMD ["/adhoc/AdhocServer"]
