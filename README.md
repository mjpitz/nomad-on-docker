# nomad on docker

Started mostly as a proof of concept that connects all the Hashicorp projects together inside of docker.
Eventually, it would be nice to have this do high availability as well as demonstrate a "secure" setup.

## Why?

Because it really shouldn't be hard to have a safe and secure production cluster.

## Status

- [ ] Consul
  - [x] HA (currently one instance)
  - [ ] TLS Certificates
  - [ ] Add a serf a gossip key
  - [ ] ACLs
- [x] Vault
  - [x] HA via Consul (currently one instance)
  - [ ] TLS Certificates
- [ ] Nomad
  - [x] HA via Consul (currently one instance)
  - [ ] Add a serf a gossip key
  - [ ] Enable vault secret integration
  - [ ] Enable consul connect integration
- [x] Workers
  - [ ] Support docker-in-docker
  - [x] Embedded consul agent
  - [x] Embedded nomad client
  - [ ] TLS Certificates

## Deployment

```shell
docker compose up
```

Once all the containers are running, you should be able to access their UI in the browser.

- Consul: http://localhost:8500
- Vault: http://localhost:8200
- Nomad: http://localhost:4646
