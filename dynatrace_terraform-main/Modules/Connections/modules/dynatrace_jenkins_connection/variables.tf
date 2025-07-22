variable "jenkins_connections" {
  description = "List of Jenkins connection configs."
  type = list(object({
    name     = string
    url      = string
    username = string
    password = string
  }))
  sensitive = true
}
