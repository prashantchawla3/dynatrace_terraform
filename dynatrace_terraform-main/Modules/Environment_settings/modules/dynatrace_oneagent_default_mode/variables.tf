variable "oneagent_default_mode_resources" {
  description = "OneAgent default operation mode settings."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      oneagent_default_mode = object({
        default_mode = string
      })
    })
  }))
  default = []
}
