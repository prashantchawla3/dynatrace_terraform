variable "unified_services_opentel" {
  description = "Toggle for enabling OpenTelemetry integration across unified services."
  type = list(object({
    enabled = bool
  }))
  default = []
}