server {
  enabled = true
  bootstrap_expect = 1
  encrypt = "95aWOfV38ZYJz6vE606K2qoAvWTBlsJ2wf5DKSUixF4=" // badadmin
}

vault {
  token = "badadmin"
  # create_from_role = "" # uncomment to deriving access from a common role
}
