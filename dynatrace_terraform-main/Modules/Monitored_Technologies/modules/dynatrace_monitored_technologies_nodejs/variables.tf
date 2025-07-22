variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for Node.js."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    nodejs = {
      enabled = true
      host_id = "host-nodejs-001"
    }
  }
}
