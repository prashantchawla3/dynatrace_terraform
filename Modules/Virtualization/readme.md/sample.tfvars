

vmware_configs = {
  "example1" = {
    enabled   = false
    ipaddress = "vcenter01"
    label     = "example"
    password  = "your-password-here"
    username  = "terraform"
    filter    = "$contains(Terraform)"
  }
}
