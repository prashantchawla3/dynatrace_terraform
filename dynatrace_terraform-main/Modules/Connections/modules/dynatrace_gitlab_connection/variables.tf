variable "gitlab_connections" {
  description = "List of GitLab connection configs."
  type = list(object({
    name  = string
    url   = string
    token = string
  }))
  sensitive = true
}
