FROM node:14-alpine as builder
RUN apk add --no-cache git
RUN git clone https://github.com/louis-lau/DuckyAPI /app
WORKDIR /app
RUN npm install
RUN npm run build

FROM node:14-alpine
LABEL org.opencontainers.image.source="https://github.com/nahsi-homelab/docker/tree/master/ducky-api"

WORKDIR /usr/local/ducky-api
COPY --from=builder /app /usr/local/ducky-api
ENTRYPOINT ["node", "dist/main.js"]
