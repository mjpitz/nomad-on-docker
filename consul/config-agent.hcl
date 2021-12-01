retry_join = ["consul"]

connect {
  enabled = true
  ca_provider = "vault"

  ca_config {
    address = "http://vault:8200"
    token = "badadmin"
    root_pki_path = "connect-root"
    intermediate_pki_path = "connect-intermediate"
  }
}
