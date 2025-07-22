variable "git_onprem_provider" {
  description = "Git provider for on-prem integration (e.g., GitLab, Bitbucket)"
  type        = string
  default     = "GitLab"
}

variable "git_onprem_url" {
  description = "URL for the on-prem Git provider"
  type        = string
  default     = "https://gitlab.company.local"
}
