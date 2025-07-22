variable "outbound_connection_resources" {
  description = "List of allowed outbound hosts and enforcement settings."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      limit_outbound_connections = object({
        allowed_outbound_connections = object({
          enforced  = bool
          host_list = list(string)
        })
      })
    })
  }))
  default = []
}
