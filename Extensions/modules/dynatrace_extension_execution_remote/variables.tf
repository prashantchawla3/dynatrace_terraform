variable "execution_remotes" {
  description = "List of Dynatrace execution remote configurations. Used to define remote endpoints associated with performance profiles and scope."
  type = list(object({
    performance_profile = string
    scope               = string
  }))
  default = [
    {
      performance_profile = "edge-cache"
      scope               = "env:staging"
    }
  ]
}
