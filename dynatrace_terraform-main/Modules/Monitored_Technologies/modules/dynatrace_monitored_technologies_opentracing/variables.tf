variable "technologies" {
  description = "Map of monitored technologies and their configurations. Includes settings for OpenTracing."
  type = map(object({
    enabled  = bool
    host_id  = string
  }))
  default = {
    opentracing = {
      enabled = true
      host_id = "host-opentracing-001"
    }
  }
}
