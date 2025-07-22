variable "service_naming_rule_ids" {
  description = "List of Dynatrace service naming rule IDs in the desired order of application."
  type        = list(string)
  default     = []
}
