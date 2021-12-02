ARG ALPINE_VERSION=3.14
ARG DOCKER_VERSION=20.10.11

FROM docker:${DOCKER_VERSION}-alpine${ALPINE_VERSION}

ARG CONSUL_VERSION=1.10.4
ARG NOMAD_VERSION=1.2.2
ARG GLIBC_VERSION=2.32-r0

ARG TARGETOS=linux
ARG TARGETARCH=amd64

RUN apk update && apk add wget unzip bash

RUN mkdir -p /consul/bin && \
    wget -qO consul.zip https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    unzip -d /consul/bin consul.zip && \
    rm -rf consul.zip

RUN mkdir -p /nomad/bin && \
    wget -qO nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    unzip -d /nomad/bin nomad.zip && \
    rm -rf nomad.zip

RUN wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -qO glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add --update --no-cache glibc.apk ca-certificates libcap su-exec && \
    rm glibc.apk

COPY entrypoint.sh /usr/bin/entrypoint.sh

EXPOSE 8300
EXPOSE 8301 8301/udp 8302
EXPOSE 8500 8600 8600/udp
EXPOSE 4646 4647 4648 4648/udp

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
