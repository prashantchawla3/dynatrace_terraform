variable "eula_settings_resources" {
  description = "End-user license agreement acceptance settings."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      eula_settings = object({
        scope       = string
        enable_eula = bool
      })
    })
  }))
  default = []
}
