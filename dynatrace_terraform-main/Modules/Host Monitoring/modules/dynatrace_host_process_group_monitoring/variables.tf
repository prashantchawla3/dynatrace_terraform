variable "host_process_group_monitoring" {
  description = "Configure monitoring states for specific process groups on a host"
  type = list(object({
    host_id          = string
    monitoring_state = string
    process_group    = string
  }))
  default = [
    { host_id = "host-01", monitoring_state = "MONITORING_ENABLED", process_group = "nginx" }
  ]
}
