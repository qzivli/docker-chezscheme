FROM debian:stretch

COPY sources.list /etc/apt/sources.list
COPY ChezScheme.docker /root/ChezScheme

RUN apt-get update && \
    apt-get install -y build-essential uuid-dev libncurses5-dev libncursesw5-dev && \
    cd /root/ChezScheme && ./configure --threads --disable-x11 && make && make install && \
    cd / && rm -rf /root/ChezScheme && \
    rm -rf /var/lib/apt/lists/*

CMD ["scheme"]

