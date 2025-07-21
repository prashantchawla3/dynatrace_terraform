variable "github_connections" {
  description = "List of GitHub connection configs."
  type = list(object({
    name  = string
    type  = string
    token = string
  }))
  default = [
    {
      name  = "github-main"
      type  = "Pat"
      token = "ghp_abcdef1234567890"
    }
  ]
}
