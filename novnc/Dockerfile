FROM debian:bullseye

RUN apt-get update; apt-get install -y bash net-tools novnc \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 999 novnc
USER novnc
ENV HOME=/home/novnc \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=yes \
    RUN_FLUXBOX=yes \
    NOVNC_PORT=8080

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
