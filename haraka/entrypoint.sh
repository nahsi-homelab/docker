#! /usr/bin/env bash

log() {
  echo "$@" >&2
}

run() {
  (
    set -x
    $@ >&2
  )
}

if [[ -z $HARAKA_HOME ]]; then
  log "\$HARAKA_HOME is not set, using /usr/local/haraka"
  HARAKA_HOME="/usr/local/haraka"
fi

log "$(run haraka -i $HARAKA_HOME)"

if [[ ! -z $HARAKA_PLUGINS ]]; then
  run npm install --quiet --no-progress --no-fund --no-audit \
          --prefix "${HARAKA_HOME}/plugins" "${HARAKA_PLUGINS}"
fi

exec haraka -c "$HARAKA_HOME" "$@"
