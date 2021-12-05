#!/usr/bin/env bash

readonly EXTRA_PACKAGES="${EXTRA_PACKAGES:-}"

readonly NOMAD_CONFIG_DIR="${NOMAD_CONFIG_DIR:-/etc/nomad.d}"
readonly NOMAD_EXTRA_ARGS="${NOMAD_EXTRA_ARGS:-}"


if [[ -n "${EXTRA_PACKAGES}" ]]; then
  # shellcheck disable=SC2086
  apk add ${EXTRA_PACKAGES}
fi

docker_pid=""

mkdir -p "${NOMAD_CONFIG_DIR}"
mkdir -p /data/nomad
nomad_pid=""

function cleanup() {
  if [[ -n "$nomad_pid" ]]; then
    pkill $nomad_pid
  fi

  if [[ -n "$docker_pid" ]]; then
    pkill $docker_pid
  fi
}

trap cleanup EXIT

command=$1

if [[ "$command" == "agent" ]]; then
  /usr/local/bin/dockerd-entrypoint.sh &
  docker_pid="$!"

  /nomad/bin/nomad "$@" &
  nomad_pid="$!"

  wait -n $nomad_pid $docker_pid
  exit $?
fi

/nomad/bin/nomad "$@"
