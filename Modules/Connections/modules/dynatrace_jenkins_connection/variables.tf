variable "jenkins_connections" {
  description = "List of Jenkins connection configs."
  type = list(object({
    name     = string
    url      = string
    username = string
    password = string
  }))
  default = [
    {
      name     = "jenkins-main"
      url      = "https://jenkins.example.com"
      username = "admin"
      password = "jenkins-api-token"
    }
  ]
}
