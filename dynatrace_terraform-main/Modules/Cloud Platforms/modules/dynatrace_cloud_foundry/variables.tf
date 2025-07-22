variable "cloud_foundry" {
  description = "Configuration for Dynatrace Cloud Foundry integration"
  type = map(object({
    enabled           = bool
    active_gate_group = string
    api_url           = string
    label             = string
    login_url         = string
    password          = string
    username          = string
  }))
  default = {
    default_cf = {
      enabled           = true
      active_gate_group = "cf-gate-group"
      api_url           = "https://api.cf.example.com"
      label             = "CF Integration"
      login_url         = "https://login.cf.example.com"
      password          = "secret"
      username          = "admin"
    }
  }
}