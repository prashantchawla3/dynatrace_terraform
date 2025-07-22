variable "key_user_actions" {
  description = "List of key user actions used to flag critical interactions for performance tracking."
  type = list(object({
    application_id = string
    domain         = string
    name           = string
    type           = string
  }))
  default = []
}
