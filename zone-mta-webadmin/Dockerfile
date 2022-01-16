FROM node:12-alpine as builder
RUN apk add --no-cache git
RUN git clone https://github.com/nahsi/zmta-webadmin /app
WORKDIR /app
RUN npm install

FROM node:12-alpine
LABEL org.opencontainers.image.source="https://github.com/nahsi-homelab/docker/tree/master/zone-mta-webadmin"

WORKDIR /usr/local/zone-mta-webadmin
COPY --from=builder /app /usr/local/zone-mta-webadmin
ENTRYPOINT ["node", "server.js"]
