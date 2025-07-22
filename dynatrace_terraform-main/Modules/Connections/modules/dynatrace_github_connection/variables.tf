variable "github_connections" {
  description = "List of GitHub connection configs."
  type = list(object({
    name  = string
    type  = string
    token = string
  }))
  sensitive = true
}
