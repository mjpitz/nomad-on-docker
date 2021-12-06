datacenter = "nod1"
data_dir = "/data/consul"

bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"

encrypt = "4L2YpEKFo8bt6iznDqHgMKJv2S15az5mgJy6pTsX9bg=" # badadmin

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
