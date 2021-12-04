retry_join = ["server"]

connect {
  enabled = true
  ca_provider = "vault"

  ca_config {
    address = "http://server:8200"
    token = "badadmin"
    root_pki_path = "connect-root"
    intermediate_pki_path = "connect-intermediate"
  }
}
