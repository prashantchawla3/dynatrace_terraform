variable "api_name" {
  description = "Name of the API token"
  type        = string
}

variable "enabled" {
  description = "Whether the token is enabled"
  type        = bool
}

variable "scopes" {
  description = "List of scopes for the token"
  type        = list(string)
}
