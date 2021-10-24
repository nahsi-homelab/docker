ARG CADDY_VERSION

FROM golang:1.17-alpine as caddy
ARG GOOS
ARG GOARCH
ARG XCADDY_VERSION
ARG CADDY_WEBHOOK_VERSION
RUN env
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@v$XCADDY_VERSION
RUN xcaddy build $CADDY_VERSION \
  --with github.com/WingLim/caddy-webhook@v$CADDY_WEBHOOK_VERSION

FROM golang:1.17-alpine as hugo
ARG GOOS
ARG GOARCH
ARG HUGO_VERSION
RUN go install github.com/gohugoio/hugo@v$HUGO_VERSION

FROM caddy:$CADDY_VERSION-alpine
COPY --from=caddy /go/caddy /usr/bin/caddy
COPY --from=hugo /go/bin/hugo /usr/bin/hugo
RUN chown nobody:nobody /srv
