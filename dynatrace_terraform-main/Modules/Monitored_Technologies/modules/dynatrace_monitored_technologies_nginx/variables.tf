variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for NGINX."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    nginx = {
      enabled = true
      host_id = "host-nginx-001"
    }
  }
}
