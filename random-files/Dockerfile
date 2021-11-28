FROM caddy:2.4.6-alpine

ENV SERVER_ROOT=/files SERVER_PATH=/
RUN mkdir $SERVER_ROOT && chown nobody:nobody $SERVER_ROOT

USER nobody

COPY Caddyfile /etc/caddy/Caddyfile

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT "/entrypoint.sh"
