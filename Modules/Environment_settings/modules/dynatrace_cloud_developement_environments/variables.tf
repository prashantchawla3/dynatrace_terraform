variable "cloud_development_resources" {
  description = "Supported cloud development environments per resource."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      cloud_development_environments = list(string)
    })
  }))
  default = []
}
