#! /usr/bin/env bash
set -e

if [[ -z NOVNC_TARGET ]]; then
  echo "Must specify NOVNC_TARGET"
  exit 1
fi

exec websockify --web /usr/share/novnc ${NOVNC_PORT} ${NOVNC_TARGET}
