variable "grail_security_context_entity_type" {
  description = "Entity type for which Grail security context applies."
  type        = string
  default     = "user"
}

variable "grail_security_context_destination_property" {
  description = "Target field used to apply security context scoping."
  type        = string
  default     = "email"
}