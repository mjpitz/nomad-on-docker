#!/usr/bin/env bash

readonly EXTRA_PACKAGES="${EXTRA_PACKAGES:-}"

readonly CONSUL_CONFIG_DIR="${CONSUL_CONFIG_DIR:-/etc/consul.d}"
readonly CONSUL_ENABLED="${CONSUL_ENABLED:-}"
readonly CONSUL_EXTRA_ARGS="${CONSUL_EXTRA_ARGS:-}"

readonly VAULT_CONFIG_DIR="${VAULT_CONFIG_DIR:-/etc/vault.d}"
readonly VAULT_ENABLED="${VAULT_ENABLED:-}"
readonly VAULT_EXTRA_ARGS="${VAULT_EXTRA_ARGS:-}"

readonly NOMAD_CONFIG_DIR="${NOMAD_CONFIG_DIR:-/etc/nomad.d}"
readonly NOMAD_ENABLED="${NOMAD_ENABLED:-}"
readonly NOMAD_EXTRA_ARGS="${NOMAD_EXTRA_ARGS:-}"


if [[ -n "${EXTRA_PACKAGES}" ]]; then
  # shellcheck disable=SC2086
  apk add ${EXTRA_PACKAGES}
fi

docker_pid=""

mkdir -p "${CONSUL_CONFIG_DIR}"
mkdir -p /data/consul
consul_pid=""

mkdir -p "${VAULT_CONFIG_DIR}"
mkdir -p /data/vault
vault_pid=""

mkdir -p "${NOMAD_CONFIG_DIR}"
mkdir -p /data/nomad
nomad_pid=""

function cleanup() {
  if [[ -n "$nomad_pid" ]]; then
    pkill $nomad_pid
  fi

  if [[ -n "$vault_pid" ]]; then
    pkill $vault_pid
  fi

  if [[ -n "$consul_pid" ]]; then
    pkill $consul_pid
  fi

  if [[ -n "$docker_pid" ]]; then
    pkill $docker_pid
  fi
}

trap cleanup EXIT

/usr/local/bin/dockerd-entrypoint.sh &
docker_pid="$!"

if [[ -n "${CONSUL_ENABLED}" ]]; then
  /consul/bin/consul agent ${CONSUL_EXTRA_ARGS} -config-dir "${CONSUL_CONFIG_DIR}" &
  consul_pid="$!"
fi

if [[ -n "${VAULT_ENABLED}" ]]; then
  /vault/bin/vault server ${VAULT_EXTRA_ARGS} -config "${VAULT_CONFIG_DIR}" &
  vault_pid="$!"
fi

if [[ -n "${NOMAD_ENABLED}" ]]; then
  /nomad/bin/nomad agent ${NOMAD_EXTRA_ARGS} -config "${NOMAD_CONFIG_DIR}" &
  nomad_pid="$!"
fi

wait -n $nomad_pid $vault_pid $consul_pid
exit $?
