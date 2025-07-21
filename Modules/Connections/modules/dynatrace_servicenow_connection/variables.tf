variable "servicenow_connections" {
  description = "List of ServiceNow connection configs."
  type = list(object({
    name     = string
    url      = string
    type     = string
    user     = optional(string)
    password = optional(string)
  }))
  default = [
    {
      name     = "servicenow-main"
      url      = "https://servicenow.example.com"
      type     = "basic"
      user     = "admin"
      password = "servicenow-password"
    }
  ]
}
