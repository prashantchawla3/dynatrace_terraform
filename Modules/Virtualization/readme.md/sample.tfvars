environment_url         = "https://your-env.live.dynatrace.com"
dynatrace_client_id     = "your-client-id"
dynatrace_client_secret = "your-client-secret"

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
