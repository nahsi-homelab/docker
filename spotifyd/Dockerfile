FROM rust:1-alpine as build
ARG VERSION=v0.3.3
ENV RUSTFLAGS="-C target-feature=-crt-static"
WORKDIR /usr/src/spotifyd
RUN apk add --no-cache git alsa-lib-dev pulseaudio-dev openssl-dev musl-dev
RUN git clone --branch=${VERSION} https://github.com/Spotifyd/spotifyd.git .
RUN cargo build --release --no-default-features \
      --features "pulseaudio_backend,alsa_backend"

FROM alpine
RUN apk add --no-cache alsa-lib pulseaudio pulseaudio-utils \
    && adduser -S spotify -s /bin/sh -G audio
COPY --from=build /usr/src/spotifyd/target/release/spotifyd /usr/bin/
USER spotify
ENTRYPOINT ["/usr/bin/spotifyd", "--no-daemon"]
