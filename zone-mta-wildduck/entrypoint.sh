#! /usr/bin/env bash

log() {
  echo "$@" >&2
}

if [[ -z $ZONEMTA_CONFIG_DIR ]]; then
  log "\$ZONEMTA_CONFIG_DIR is not set, using /usr/local/zone-mta"
  ZONEMTA_CONFIG_DIR="/usr/local/zone-mta/config"
fi

exec node index.js --config "${ZONEMTA_CONFIG_DIR}/zonemta.toml" "$@"
