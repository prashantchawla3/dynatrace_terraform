variable "custom_app_enablements" {
  description = "Enable RUM for custom apps, including scope and cost control settings."
  type = map(object({
    scope = string
    rum = object({
      enabled                  = bool
      cost_and_traffic_control = number
    })
  }))
  default = {
    custom1 = {
      scope = "CUSTOM:APP"
      rum = {
        enabled                  = true
        cost_and_traffic_control = 1000
      }
    }
  }
}
