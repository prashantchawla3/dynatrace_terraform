variable "hub_permissions_resources" {
  description = "Hub permissions for user access management."
  type = list(object({
    name     = string
    type     = string
    settings = object({
      hub_permissions = object({
        email       = string
        description = string
      })
    })
  }))
  default = []
}
