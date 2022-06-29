#! /usr/bin/env bash
set -e

[[ -d $DATA_DIR ]] && chown -R 999:999 $DATA_DIR
[[ -d $CERTS_DIR ]] && chown -R 999:999 $CERTS_DIR

exec gosu 999 patroni "$@"
