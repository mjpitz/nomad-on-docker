datacenter = "nod1"
data_dir = "/data/nomad"

consul {
  address = "http://localhost:8500"
  checks_use_advertise = true
}

vault {
  enabled = true
  address = "http://server:8200"
  token = "badadmin"
  # create_from_role = "" # uncomment to deriving access from a common role
}

server {
  enabled = true
  bootstrap_expect = 1
  encrypt = "95aWOfV38ZYJz6vE606K2qoAvWTBlsJ2wf5DKSUixF4=" // badadmin
}
