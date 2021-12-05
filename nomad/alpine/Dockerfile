ARG ALPINE_VERSION=3.14
ARG GLIBC_VERSION=2.34-r0
ARG NOMAD_VERSION=1.2.2

##===
## ALL IN ONE
FROM alpine:${ALPINE_VERSION}

RUN apk update && apk add wget unzip ca-certificates libcap su-exec

ARG GLIBC_VERSION
RUN apk del libc6-compat && \
	wget -qO /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
	wget -qO glibc.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
	apk add --update --no-cache glibc.apk && \
	rm glibc.apk

ARG TARGETOS
ARG TARGETARCH
ARG NOMAD_VERSION
RUN mkdir -p /nomad/bin && \
    wget -qO nomad.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_${TARGETOS}_${TARGETARCH}.zip && \
    unzip -d /nomad/bin nomad.zip && \
    rm -rf nomad.zip

EXPOSE 4646 4647 4648 4648/udp
ENTRYPOINT [ "/nomad/bin/nomad" ]
CMD [ "agent", "-dev" ]
