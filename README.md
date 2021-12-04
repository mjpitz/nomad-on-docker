# nomad on docker

Started mostly as a proof of concept that connects all the Hashicorp projects together inside of docker.
Eventually, it would be nice to have this do high availability as well as demonstrate a "secure" setup.

## Overview

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggVERcbiAgICBzdWJncmFwaCB3b3JrZXJcbiAgICAgIG5vbWFkLWFnZW50IC0tIGRpc2NvdmVyIG5vbWFkIC0tPiBjb25zdWwtYWdlbnRcbiAgICBlbmRcblxuICAgIHN1YmdyYXBoIHNlcnZlclxuICAgICAgdmF1bHQgLS0gc3RvcmVzIGluZm9ybWF0aW9uIC0tPiBjb25zdWxcbiAgICAgIG5vbWFkIC0tIGZldGNoIHNlY3JldHMgLS0-IHZhdWx0XG4gICAgICBub21hZCAtLSBkaXNjb3ZlciBvdGhlciBub21hZCAtLT4gY29uc3VsXG4gICAgZW5kXG5cbiAgICBjb25zdWwtYWdlbnQgLS0gam9pbiAtLT4gY29uc3VsXG4gICAgbm9tYWQtYWdlbnQgLS0gZmV0Y2ggc2VjcmV0cyAtLT4gdmF1bHRcbiAgICBcbiAgICBub21hZC1hZ2VudCAtLSBnZXQgam9icyAtLT4gbm9tYWRcbiAgICBjb25zdWwtYWdlbnQgLS0gY2VydGlmaWNhdGUgYXV0aG9yaXR5IC0tPiB2YXVsdFxuIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZSwiYXV0b1N5bmMiOnRydWUsInVwZGF0ZURpYWdyYW0iOmZhbHNlfQ)](https://mermaid-js.github.io/mermaid-live-editor/edit/#eyJjb2RlIjoiZ3JhcGggVERcbiAgICBzdWJncmFwaCB3b3JrZXJcbiAgICAgIG5vbWFkLWFnZW50IC0tIGRpc2NvdmVyIG5vbWFkIC0tPiBjb25zdWwtYWdlbnRcbiAgICBlbmRcblxuICAgIHN1YmdyYXBoIHNlcnZlclxuICAgICAgdmF1bHQgLS0gc3RvcmVzIGluZm9ybWF0aW9uIC0tPiBjb25zdWxcbiAgICAgIG5vbWFkIC0tIGZldGNoIHNlY3JldHMgLS0-IHZhdWx0XG4gICAgICBub21hZCAtLSBkaXNjb3ZlciBvdGhlciBub21hZCAtLT4gY29uc3VsXG4gICAgZW5kXG5cbiAgICBjb25zdWwtYWdlbnQgLS0gam9pbiAtLT4gY29uc3VsXG4gICAgbm9tYWQtYWdlbnQgLS0gZmV0Y2ggc2VjcmV0cyAtLT4gdmF1bHRcbiAgICBcbiAgICBub21hZC1hZ2VudCAtLSBnZXQgam9icyAtLT4gbm9tYWRcbiAgICBjb25zdWwtYWdlbnQgLS0gY2VydGlmaWNhdGUgYXV0aG9yaXR5IC0tPiB2YXVsdFxuIiwibWVybWFpZCI6IntcbiAgXCJ0aGVtZVwiOiBcImRlZmF1bHRcIlxufSIsInVwZGF0ZUVkaXRvciI6ZmFsc2UsImF1dG9TeW5jIjp0cnVlLCJ1cGRhdGVEaWFncmFtIjpmYWxzZX0)

## Why?

Because having a safe and secure production cluster shouldn't require a hard way.

## Status

- [x] Consul
  - [x] HA
  - [x] Add a serf gossip key
  - [ ] ACLs
  - [ ] TLS Certificates
- [x] Vault
  - [ ] HA
  - [ ] TLS Certificates
- [ ] Nomad
  - [ ] HA
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

```shell
docker compose up
```

Once all the containers are running, you should be able to access their UI in the browser.

- Consul: http://localhost:8500
- Vault: http://localhost:8200
- Nomad: http://localhost:4646
