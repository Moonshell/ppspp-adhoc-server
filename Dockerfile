FROM ubuntu
MAINTAINER krimeshu <krimeshu@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install libc6-dev
RUN apt-get -y install libgmp-dev
RUN apt-get -y install libmpfr4 libmpfr-dev
RUN apt-get -y install libmpc-dev libmpc2
RUN apt-get -y install libtool
RUN apt-get -y install m4
RUN apt-get -y install bison
RUN apt-get -y install flex
RUN apt-get -y install autoconf
RUN apt-get update 

RUN apt-get -y install gcc-4.8 
RUN apt-get -y install g++-4.8 
RUN apt-get -y install gcc-4.8-multilib 
RUN apt-get -y install g++-4.8-multilib 
RUN apt-get -y install gcc-4.8-doc 
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20 
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20 
RUN update-alternatives --config gcc 
RUN update-alternatives --config g++ 

RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get dist-upgrade

RUN apt-get -y install libsqlite3-dev

RUN mkdir -p /adhoc
WORKDIR /adhoc

COPY ./src /adhoc
COPY ./database.db /adhoc
COPY ./Makefile /adhoc

RUN make

EXPOSE 27312

CMD ["/adhoc/AdhocServer"]
