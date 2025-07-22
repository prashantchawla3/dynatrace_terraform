variable "host_monitoring" {
  description = "Enable or disable base-level host monitoring by ID"
  type = list(object({
    enabled = bool
    host_id = string
  }))
  default = [
    { enabled = true, host_id = "host-analytics-01" }
  ]
}
