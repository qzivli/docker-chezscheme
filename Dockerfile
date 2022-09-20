FROM debian:buster AS builder

COPY ChezScheme.docker /root/ChezScheme

RUN apt-get update
RUN apt-get install -y build-essential uuid-dev libncurses5-dev libncursesw5-dev
WORKDIR /root/ChezScheme
RUN ./configure --threads --disable-x11
RUN make && make install

FROM debian:buster

COPY --from=builder /usr/bin/scheme /usr/bin/
COPY --from=builder /usr/lib/csv9.5.9 /usr/lib/csv9.5.9
COPY --from=builder /lib/x86_64-linux-gnu /lib/x86_64-linux-gnu
COPY --from=builder /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu

WORKDIR /

CMD ["scheme"]

