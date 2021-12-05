ARG ALPINE_VERSION=3.14
ARG GLIBC_VERSION=2.34-r0
ARG DEFAULT_REPO_BASE=ghcr.io/mjpitz

##===
## BASE
FROM ${DEFAULT_REPO_BASE}/hashistack:base AS base

##===
## ALL IN ONE
FROM alpine:${ALPINE_VERSION}

COPY --from=base /usr/bin/configure.sh /usr/bin/configure.sh
ARG GLIBC_VERSION
RUN GLIBC_VERSION=${GLIBC_VERSION} /usr/bin/configure.sh && rm /usr/bin/configure.sh

COPY --from=base /consul /consul/
EXPOSE 8300
EXPOSE 8301 8301/udp 8302
EXPOSE 8500 8600 8600/udp

COPY --from=base /vault /vault/
EXPOSE 8200

COPY --from=base /nomad /nomad/
EXPOSE 4646 4647 4648 4648/udp

COPY --from=base /usr/bin/entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
