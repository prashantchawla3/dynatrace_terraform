variable "span_capture_rules" {
  description = "Rules controlling whether spans are captured based on match filters."
  type = map(object({
    action  = string
    matches = list(object({
      comparison = string
      source     = string
      value      = string
    }))
  }))
  default = {
    capture_login = {
      action = "ALLOW"
      matches = [
        {
          comparison = "EQUALS"
          source     = "url.path"
          value      = "/auth/login"
        }
      ]
    }
  }
}
