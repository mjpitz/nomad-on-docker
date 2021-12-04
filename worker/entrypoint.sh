#!/usr/bin/env bash

readonly CONSUL_CONFIG_DIR="${CONSUL_CONFIG_DIR:-/etc/consul.d}"
mkdir -p "${CONSUL_CONFIG_DIR}"
consul_pid=""

readonly NOMAD_CONFIG_DIR="${NOMAD_CONFIG_DIR:-/etc/nomad.d}"
mkdir -p "${NOMAD_CONFIG_DIR}"
nomad_pid=""

function cleanup() {
  if [[ -n $nomad_pid ]]; then
    pkill $nomad_pid
  fi

  if [[ -n $consul_pid ]]; then
    pkill $consul_pid
  fi
}

trap cleanup EXIT

/consul/bin/consul agent ${CONSUL_EXTRA_ARGS} -config-dir "${CONSUL_CONFIG_DIR}" &
consul_pid="$!"

/nomad/bin/nomad agent ${NOMAD_EXTRA_ARGS} -config "${NOMAD_CONFIG_DIR}" &
nomad_pid="$!"

wait -n $nomad_pid $consul_pid
exit $?
