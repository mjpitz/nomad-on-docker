#!/usr/bin/env sh

readonly GLIBC_VERSION="${GLIBC_VERSION:-}"
if [ -z "${GLIBC_VERSION}" ]; then
  echo "GLIBC_VERSION is not set" 1>&2
  exit 1
fi

apk update
apk add wget unzip bash ca-certificates libcap su-exec
apk del libc6-compat

wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget -qO glibc.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk"
apk add --update --no-cache glibc.apk
rm glibc.apk
