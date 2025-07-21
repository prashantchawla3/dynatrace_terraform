variable "user_session_metrics" {
  description = "Defines custom user session metrics for traffic and behavior analysis."
  type = map(object({
    enabled    = bool
    metric_key = string
    filters    = list(object({
      filter = list(object({
        field_name = string
        operator   = string
        value      = string
      }))
    }))
    value = object({
      type = string
    })
  }))
  default = {
    usm1 = {
      enabled    = false
      metric_key = "uscm.TerraformTest"
      filters = [
        {
          filter = [
            {
              field_name = "useraction.application"
              operator   = "EQUALS"
              value      = "www.terraform.io/"
            },
            {
              field_name = "useraction.name"
              operator   = "EQUALS"
              value      = "Loading of page /"
            }
          ]
        }
      ]
      value = {
        type = "COUNTER"
      }
    }
  }
}
