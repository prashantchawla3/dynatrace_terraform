variable "web_app_enablements" {
  description = "Enable flags and traffic control limits for RUM and session replay per application."
  type = list(object({
    application_id = string
    rum = optional(object({
      enabled                  = bool
      cost_and_traffic_control = number
      enabled_on_grail         = bool
    }))
    session_replay = optional(object({
      enabled                  = bool
      cost_and_traffic_control = number
    }))
  }))
  default = []
}
