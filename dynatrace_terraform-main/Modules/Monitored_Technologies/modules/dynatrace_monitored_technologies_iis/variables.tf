variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for IIS."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    iis = {
      enabled = true
      host_id = "host-abcde"
    }
  }
}
