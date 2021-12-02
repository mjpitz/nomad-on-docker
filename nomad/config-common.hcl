datacenter = "nod1"
data_dir = "/data/nomad"

consul {
  address = "consul:8500"
  checks_use_advertise = true
}

vault {
  enabled = true
  address = "vault:8200"
}
