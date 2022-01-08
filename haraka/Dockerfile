FROM node:17-alpine

LABEL org.opencontainers.image.source="https://github.com/nahsi-homelab/docker/haraka"

ARG version=2.8.28
ENV NODE_ENV=production
RUN apk add --no-cache python2 g++ make --virtual .build-deps
RUN npm install -g Haraka@${version} haraka-plugin-wildduck \
    && apk del .build-deps \
    && rm -rf /root/.npm/* /tmp/*

RUN apk add --no-cache bash
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
