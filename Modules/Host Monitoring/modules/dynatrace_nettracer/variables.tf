variable "net_tracers" {
  description = "Enable Dynatrace net tracer monitoring on scoped entities"
  type = list(object({
    scope      = string
    net_tracer = bool
  }))
  default = [
    { scope = "host:east", net_tracer = true }
  ]
}
