variable "host_monitoring_modes" {
  description = "Set monitoring mode per host (e.g., FULL_STACK, INFRA_ONLY)"
  type = list(object({
    host_id         = string
    monitoring_mode = string
  }))
  default = [
    { host_id = "host-01", monitoring_mode = "FULL_STACK" }
  ]
}
