#!/usr/bin/env bash

readonly CONSUL_CONFIG_DIR="${CONSUL_CONFIG_DIR:-/etc/consul.d}"
mkdir -p "${CONSUL_CONFIG_DIR}"
mkdir -p /data/consul
consul_pid=""

readonly VAULT_CONFIG_DIR="${VAULT_CONFIG_DIR:-/etc/vault.d}"
mkdir -p "${VAULT_CONFIG_DIR}"
mkdir -p /data/vault
vault_pid=""

readonly NOMAD_CONFIG_DIR="${NOMAD_CONFIG_DIR:-/etc/nomad.d}"
mkdir -p "${NOMAD_CONFIG_DIR}"
mkdir -p /data/nomad
nomad_pid=""

function cleanup() {
  if [[ -n $nomad_pid ]]; then
    pkill $nomad_pid
  fi

  if [[ -n $vault_pid ]]; then
    pkill $vault_pid
  fi

  if [[ -n $consul_pid ]]; then
    pkill $consul_pid
  fi
}

trap cleanup EXIT

/consul/bin/consul agent -config-dir "${CONSUL_CONFIG_DIR}" &
consul_pid="$!"

## TODO: probe consul

/vault/bin/vault server -config "${VAULT_CONFIG_DIR}" ${VAULT_EXTRA_ARGS} &
vault_pid="$!"

## TODO: probe vault

/nomad/bin/nomad agent -config "${NOMAD_CONFIG_DIR}" &
nomad_pid="$!"

## TODO: probe nomad

wait -n $nomad_pid $vault_pid $consul_pid
exit $?
