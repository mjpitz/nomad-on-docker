ARG ALPINE_VERSION=3.14
ARG DOCKER_VERSION=20.10.11

FROM docker:${DOCKER_VERSION}-alpine${ALPINE_VERSION}

ARG NOMAD_VERSION=1.2.2
ARG GLIBC_VERSION=2.32-r0

ARG TARGETOS=linux
ARG TARGETARCH=amd64

RUN apk update && apk add wget unzip

RUN mkdir -p /nomad/bin && \
    wget -qO nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    unzip -d /nomad/bin nomad.zip && \
    rm -rf nomad.zip

RUN wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -qO glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add --update --no-cache glibc.apk ca-certificates libcap su-exec && \
    rm glibc.apk

EXPOSE 4646 4647 4648 4648/udp

ENTRYPOINT [ "/nomad/bin/nomad" ]
