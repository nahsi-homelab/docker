#! /usr/bin/env bash

readonly DOCKER_IP="$(hostname --ip-address)"

export PATRONI_RESTAPI_CONNECT_ADDRESS="${DOCKER_IP}:8008"
export PATRONI_POSTGRESQL_CONNECT_ADDRESS="${DOCKER_IP}:5432"
export PATRONI_NAME="$(hostname)"

exec patroni "$@"
