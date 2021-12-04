ARG ALPINE_VERSION=3.14
ARG DOCKER_VERSION=20.10.11
ARG TARGETOS=linux
ARG TARGETARCH=amd64
ARG CONSUL_VERSION=1.10.4
ARG VAULT_VERSION=1.9.0
ARG NOMAD_VERSION=1.2.2
ARG GLIBC_VERSION=2.34-r0

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
## ALL IN ONE
FROM docker:${DOCKER_VERSION}-dind-alpine${ALPINE_VERSION}

RUN apk update && apk add wget unzip bash ca-certificates libcap su-exec && apk del libc6-compat

ARG GLIBC_VERSION
RUN wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -qO glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add --update --no-cache glibc.apk && \
    rm glibc.apk

COPY --from=consul /consul/ /consul/
EXPOSE 8300
EXPOSE 8301 8301/udp 8302
EXPOSE 8500 8600 8600/udp

COPY --from=vault /vault/ /vault/
EXPOSE 8200

COPY --from=nomad /nomad/ /nomad/
EXPOSE 4646 4647 4648 4648/udp

COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
