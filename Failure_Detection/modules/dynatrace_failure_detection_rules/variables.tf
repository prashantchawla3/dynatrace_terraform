variable "failure_detection_rules_enabled" {
  description = "Enable custom failure detection rules for services"
  type        = bool
  default     = true
}

variable "failure_detection_rules_name" {
  description = "Name to assign to the failure detection rules block"
  type        = string
  default     = "service-failure-ruleset"
}