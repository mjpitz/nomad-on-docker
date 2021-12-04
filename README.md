# nomad on docker

Started mostly as a proof of concept that connects all the Hashicorp projects together inside of docker.
Eventually, it would be nice to have this do high availability as well as demonstrate a "secure" setup.

## Overview

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBzdWJncmFwaCB3b3JrZXJcbiAgICAgIG5vbWFkLWFnZW50IC0tIGRpc2NvdmVyIG5vbWFkIC0tPiBjb25zdWwtYWdlbnRcbiAgICBlbmRcblxuICAgIGNvbnN1bC1hZ2VudCAtLSBqb2luIC0tPiBjb25zdWxcbiAgICBub21hZC1hZ2VudCAtLSBmZXRjaCBzZWNyZXRzIC0tPiB2YXVsdFxuICAgIHZhdWx0IC0tIHN0b3JlcyBpbmZvcm1hdGlvbiAtLT4gY29uc3VsXG4gICAgbm9tYWQtYWdlbnQgLS0gZ2V0IGpvYnMgLS0-IG5vbWFkXG4gICAgY29uc3VsLWFnZW50IC0tIGNlcnRpZmljYXRlIGF1dGhvcml0eSAtLT4gdmF1bHRcbiAgICBub21hZCAtLSBmZXRjaCBzZWNyZXRzIC0tPiB2YXVsdFxuICAgIG5vbWFkIC0tIGRpc2NvdmVyIG90aGVyIG5vbWFkIC0tPiBjb25zdWxcbiIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2UsImF1dG9TeW5jIjp0cnVlLCJ1cGRhdGVEaWFncmFtIjpmYWxzZX0)](https://mermaid-js.github.io/mermaid-live-editor/edit#eyJjb2RlIjoiZ3JhcGggVERcbiAgICBzdWJncmFwaCB3b3JrZXJcbiAgICAgIG5vbWFkLWFnZW50IC0tIGRpc2NvdmVyIG5vbWFkIC0tPiBjb25zdWwtYWdlbnRcbiAgICBlbmRcblxuICAgIGNvbnN1bC1hZ2VudCAtLSBqb2luIC0tPiBjb25zdWxcbiAgICBub21hZC1hZ2VudCAtLSBmZXRjaCBzZWNyZXRzIC0tPiB2YXVsdFxuICAgIHZhdWx0IC0tIHN0b3JlcyBpbmZvcm1hdGlvbiAtLT4gY29uc3VsXG4gICAgbm9tYWQtYWdlbnQgLS0gZ2V0IGpvYnMgLS0-IG5vbWFkXG4gICAgY29uc3VsLWFnZW50IC0tIGNlcnRpZmljYXRlIGF1dGhvcml0eSAtLT4gdmF1bHRcbiAgICBub21hZCAtLSBmZXRjaCBzZWNyZXRzIC0tPiB2YXVsdFxuICAgIG5vbWFkIC0tIGRpc2NvdmVyIG90aGVyIG5vbWFkIC0tPiBjb25zdWxcbiIsIm1lcm1haWQiOiJ7XG4gIFwidGhlbWVcIjogXCJkZWZhdWx0XCJcbn0iLCJ1cGRhdGVFZGl0b3IiOmZhbHNlLCJhdXRvU3luYyI6dHJ1ZSwidXBkYXRlRGlhZ3JhbSI6ZmFsc2V9)

## Why?

Because having a safe and secure production cluster shouldn't require a hard way.

## Status

- [ ] Consul
  - [x] HA (currently one instance)
  - [ ] TLS Certificates
  - [x] Add a serf gossip key
  - [ ] ACLs
- [x] Vault
  - [ ] HA via Consul (currently one instance)
  - [ ] TLS Certificates
- [ ] Nomad
  - [x] HA via Consul (currently one instance)
  - [ ] TLS Certificates
  - [x] Add a serf gossip key
  - [ ] ACLs
  - [ ] Enable vault secret integration
    - https://learn.hashicorp.com/tutorials/nomad/vault-nomad-secrets
    - https://learn.hashicorp.com/tutorials/nomad/vault-pki-nomad?in=nomad/integrate-vault
    - https://learn.hashicorp.com/tutorials/nomad/vault-postgres?in=nomad/integrate-vault
  - [ ] Enable consul connect integration
- [x] Workers
  - [x] Support docker-in-docker
  - [x] Support JDK
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
