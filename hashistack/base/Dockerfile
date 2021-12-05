ARG ALPINE_VERSION=3.14
ARG CONSUL_VERSION=1.10.4
ARG VAULT_VERSION=1.9.0
ARG NOMAD_VERSION=1.2.2
ARG GLIBC_VERSION=""

##===
## CONSUL
FROM alpine:${ALPINE_VERSION} AS consul

RUN apk update && apk add wget unzip bash

ARG TARGETOS
ARG TARGETARCH
ARG CONSUL_VERSION
RUN mkdir -p /consul/bin && \
    wget -qO consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    unzip -d /consul/bin consul.zip && \
    rm -rf consul.zip

##===
## VAULT
FROM alpine:${ALPINE_VERSION} AS vault

RUN apk update && apk add wget unzip bash

ARG TARGETOS
ARG TARGETARCH
ARG VAULT_VERSION
RUN mkdir -p /vault/bin && \
    wget -qO vault.zip https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    unzip -d /vault/bin vault.zip && \
    rm -rf vault.zip

##===
## NOMAD
FROM alpine:${ALPINE_VERSION} AS nomad

RUN apk update && apk add wget unzip bash

ARG TARGETOS
ARG TARGETARCH
ARG NOMAD_VERSION
RUN mkdir -p /nomad/bin && \
    wget -qO nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    unzip -d /nomad/bin nomad.zip && \
    rm -rf nomad.zip

##===
## INTERMEDIARY
FROM alpine:${ALPINE_VERSION}

COPY --from=consul /consul /consul
COPY --from=vault /vault /vault
COPY --from=nomad /nomad /nomad

COPY configure.sh /usr/bin/configure.sh
COPY entrypoint.sh /usr/bin/entrypoint.sh
