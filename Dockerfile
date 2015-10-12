FROM ubuntu:14
MAINTAINER krimeshu <krimeshu@gmail.com>

RUN apt-get update \
 && apt-get -y build-dep gcc \
 && apt-get -y install libsqlite3-dev make

RUN mkdir -p /adhoc
WORKDIR /adhoc

COPY ./src /adhoc/src/
COPY ./database.db /adhoc/database.db
COPY ./Makefile /adhoc/Makefile

RUN make

EXPOSE 27000-27999

CMD ["/adhoc/AdhocServer"]
