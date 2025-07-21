variable "jira" {
  type = object({
    name     = string
    type     = string
    password = string
    url      = string
    user     = string
  })
  description = "Jira connection configuration"
  default = {
    name     = "jira-default"
    type     = "basic"
    password = "changeme"
    url      = "https://jira.example.com"
    user     = "admin"
  }
}