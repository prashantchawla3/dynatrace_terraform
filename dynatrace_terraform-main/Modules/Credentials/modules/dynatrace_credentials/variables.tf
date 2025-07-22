variable "credentials_name" {
  description = "Name for the Dynatrace credentials"
  type        = string
}

variable "credentials_scopes" {
  description = "Scopes associated with these credentials"
  type        = list(string)
}

variable "credentials_username" {
  description = "Username for Dynatrace credentials"
  type        = string
}

variable "credentials_password" {
  description = "Password for Dynatrace credentials"
  type        = string
  sensitive   = true
}
