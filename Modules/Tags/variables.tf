
variable "environment_url" {
  type        = string
  description = "Dynatrace environment URL"
}

variable "dynatrace_client_id" {
  type        = string
  description = "Dynatrace OAuth client ID"
}

variable "dynatrace_client_secret" {
  type        = string
  description = "Dynatrace OAuth client secret"
  sensitive   = true
}

variable "autotag_name" {
  type        = string
  description = "The name of the auto tag"
}

variable "entity_selector" {
  type        = string
  description = "Entity selector string for custom tags"
}
