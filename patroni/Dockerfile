FROM alpine as wal-g
RUN apk add --no-cache wget
RUN wget -q https://github.com/wal-g/wal-g/releases/download/v1.1/wal-g-pg-ubuntu-20.04-amd64 -O /wal-g && chmod 777 /wal-g

FROM postgres:14
RUN apt-get update \
    && apt-get install --no-install-recommends python3 python3-pip -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && pip3 install --no-cache patroni[consul] psycopg2-binary

COPY --from=wal-g /wal-g /usr/local/bin/wal-g

RUN mkdir /data && chown postgres:postgres /data
VOLUME /data

USER postgres

ENTRYPOINT ["patroni"]
CMD ["--help"]
