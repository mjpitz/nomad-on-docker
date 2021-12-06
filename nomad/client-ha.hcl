datacenter = "nod1"
data_dir = "/data/nomad"

consul {
  address = "localhost:8500"
  checks_use_advertise = true
}

vault {
  enabled = true
  address = "http://vault:8200"
}

client {
  enabled = true
}
