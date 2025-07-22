variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for Java."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    java = {
      enabled = true
      host_id = "host-java-001"
    }
  }
}
