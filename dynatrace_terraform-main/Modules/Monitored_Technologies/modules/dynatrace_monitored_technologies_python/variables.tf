variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for Python."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    python = {
      enabled = true
      host_id = "host-python-001"
    }
  }
}
