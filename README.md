Mostly a proof of concept that connects all the HashiCorp projects together inside of docker. _**Why?**_ Because having 
a safe and secure production cluster shouldn't require a hard way.

## Images

- [ghcr.io/mjpitz/hashistack][]
  - Tags: `latest`, `latest-alpine`, `latest-dind`
  - Architectures: `amd64`, `arm64`
- [ghcr.io/mjpitz/nomad][]
  - Tags: `latest`, `latest-alpine`, `latest-dind`
  - Architectures: `amd64`, `arm64`

[ghcr.io/mjpitz/hashistack]: https://github.com/users/mjpitz/packages/container/package/hashistack
[ghcr.io/mjpitz/nomad]: https://github.com/users/mjpitz/packages/container/package/nomad

## Status

- [x] Consul
  - [x] HA
  - [x] Add a serf gossip key
  - [ ] ACLs
  - [ ] TLS Certificates
- [x] Vault
  - [ ] HA
  - [ ] TLS Certificates
- [x] Nomad
  - [x] HA
  - [x] Add a serf gossip key
    - Nomad's serf configuration is used to communicate over a WAN
  - [ ] Enable consul connect integration
  - [ ] Enable vault secret integration
    - https://learn.hashicorp.com/tutorials/nomad/vault-nomad-secrets
    - https://learn.hashicorp.com/tutorials/nomad/vault-pki-nomad?in=nomad/integrate-vault
    - https://learn.hashicorp.com/tutorials/nomad/vault-postgres?in=nomad/integrate-vault
  - [ ] ACLs
  - [ ] TLS Certificates
- [x] Workers
  - [x] Support docker-in-docker
  - [x] Support JDK
  - [x] Embedded consul agent
  - [x] Embedded nomad client
  - [ ] TLS Certificates

## Deployment

The default `docker-compose.yaml` file deploys a single, all-in-one container. The `docker-compose-ha.yaml` file uses
the same image, but deploys each component separately according to the various HashiCorp reference architecture
documents. Currently, this spins up a single datacenter, but Nomad is designed to run over a WAN and operate against
multiple datacenters.

```shell
docker compose up
```

Once all the containers are running, you should be able to access their UI in the browser. Note, these ports are
currently unavailable for the HA configuration. To access the associated UI, you will need to look up the port mapping.

- Consul: http://localhost:8500
- Vault: http://localhost:8200
- Nomad: http://localhost:4646

## Extra Packages

The `ghcr.io/mjpitz/hashistack` container image accepts an `EXTRA_PACKAGES` environment variable that allows additional
alpine packages to be installed. The value must be a space-separated list of package names. For example `openjdk11` will
install openjdk version 11 prior to running the enabled processes.
