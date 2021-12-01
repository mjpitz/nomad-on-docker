#!/usr/bin/env bash

nomad_pid=""
consul_pid=""

function cleanup() {
  if [[ -n $nomad_pi ]]; then
    pkill $nomad_pid
  fi

  if [[ -n $consul_pid ]]; then
    pkill $consul_pid
  fi
}

trap cleanup EXIT

/nomad/bin/nomad agent -config /etc/nomad.d &
nomad_pid="$!"

/consul/bin/consul agent -config-dir /etc/consul.d &
consul_pid="$!"

wait -n $nomad_pid $consul_pid
exit $?
