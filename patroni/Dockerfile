FROM alpine as wal-g
RUN apk add --no-cache wget
RUN wget -q https://github.com/wal-g/wal-g/releases/download/v1.1/wal-g-pg-ubuntu-20.04-amd64 -O /wal-g && chmod 777 /wal-g

FROM postgres:14
ARG version=2.1.4
RUN apt-get update \
    && apt-get install --no-install-recommends python3 python3-pip gosu -y \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && pip3 install --no-cache patroni==${version} patroni[consul] psycopg2-binary

COPY --from=wal-g /wal-g /usr/local/bin/wal-g
COPY entrypoint.sh /entrypoint.sh

USER root

ENV DATA_DIR=/data CERTS_DIR=
VOLUME /data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
