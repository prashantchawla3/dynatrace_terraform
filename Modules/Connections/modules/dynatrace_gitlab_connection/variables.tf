variable "gitlab_connections" {
  description = "List of GitLab connection configs."
  type = list(object({
    name  = string
    url   = string
    token = string
  }))
  default = [
    {
      name  = "gitlab-main"
      url   = "https://gitlab.example.com"
      token = "glpat-abcdef123456"
    }
  ]
}
