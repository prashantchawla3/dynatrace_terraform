variable "oneagent_features_resources" {
  description = "List of OneAgent feature toggles and scope."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      oneagent_features = object({
        enabled         = bool
        instrumentation = bool
        key             = string
        scope           = string
      })
    })
  }))
  default = []
}
