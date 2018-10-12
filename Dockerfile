FROM ubuntu:18.04

ADD ChezScheme /root/ChezScheme

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y build-essential uuid-dev libncurses5-dev libncursesw5-dev && \
    cd /root/ChezScheme && ./configure --threads --disable-x11 && make && make install && \
    rm -rf /root/ChezScheme

CMD ["scheme"]

