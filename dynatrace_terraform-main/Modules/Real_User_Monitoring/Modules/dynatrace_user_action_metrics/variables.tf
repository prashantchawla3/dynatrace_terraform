variable "user_action_metrics" {
  description = "Custom user action metrics definitions for analysis and monitoring."
  type = map(object({
    enabled    = bool
    dimensions = list(string)
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
    uam1 = {
      enabled    = true
      dimensions = ["application"]
      metric_key = "uacm.TerraformTest"
      filters = [
        {
          filter = [
            {
              field_name = "type"
              operator   = "EQUALS"
              value      = "Xhr"
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