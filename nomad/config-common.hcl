datacenter = "nod1"
data_dir = "/data/nomad"

consul {
  address = "http://server:8500"
  checks_use_advertise = true
}

vault {
  enabled = true
  address = "http://server:8200"
}
