FROM node:17-alpine as builder
ARG version=3.4.0
ENV NODE_ENV=production
RUN apk add --no-cache python2 g++ make git
RUN git clone https://github.com/zone-eu/zone-mta-template /app
WORKDIR /app
RUN npm install zone-mta@${version} \
    && npm install \
    && npm install zonemta-wildduck

FROM node:17-alpine
LABEL org.opencontainers.image.source="https://github.com/nahsi-homelab/docker/tree/master/ztone-mta-wildduck"

WORKDIR /usr/local/zone-mta
COPY --from=builder /app /usr/local/zone-mta
RUN apk add --no-cache bash
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
