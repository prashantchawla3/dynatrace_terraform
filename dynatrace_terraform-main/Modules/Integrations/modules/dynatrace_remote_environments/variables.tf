variable "remote_environment_name" {
  description = "The name of the Dynatrace remote environment"
  type        = string
}

variable "remote_environment_network_scope" {
  description = "The network scope of the Dynatrace remote environment"
  type        = string
}

variable "remote_environment_token" {
  description = "The token used to authenticate with the Dynatrace remote environment"
  type        = string
  sensitive   = true
}

variable "remote_environment_uri" {
  description = "The URI of the Dynatrace remote environment"
  type        = string
}
