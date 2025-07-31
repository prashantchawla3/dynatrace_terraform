variable "discovery_rule_count" {
  description = "Number of default discovery rules to define"
  type        = number
  default     = 1
}

variable "discovery_rule_names" {
  description = "List of unique rule IDs (indexed by count)"
  type        = list(string)
  default     = ["default_rule_01"]
}

variable "discovery_rule_description" {
  description = "Description of the rule's purpose and scope"
  type        = string
  default     = "Default discovery rule for baseline host monitoring"
}

variable "discovery_rule_category" {
  description = "Categorization label for the rule, such as INFRASTRUCTURE or PROCESS_GROUP"
  type        = string
  default     = "INFRASTRUCTURE"
}

variable "discovery_rule_environment_scope" {
  description = "Environment scope for rule applicability, e.g., DEV, PROD, GLOBAL"
  type        = string
  default     = "GLOBAL"
}

variable "discovery_rule_priority" {
  description = "Rule execution priority (lower values = higher priority)"
  type        = number
  default     = 100
}

variable "discovery_rule_query" {
  description = "Entity selector used to define what the rule matches"
  type        = string
  default     = "type(HOST)"
}

variable "discovery_rule_title" {
  description = "Title for the discovery rule, visible in Dynatrace UI"
  type        = string
  default     = "Baseline Host Discovery"
}

variable "discovery_rule_action_name" {
  description = "Name of the action to apply, e.g., DISCOVER or IGNORE"
  type        = string
  default     = "DISCOVER"
}

variable "discovery_rule_mode" {
  description = "Mode parameter name and value used in action execution"
  type        = string
  default     = "standard"
}

variable "discovery_rule_muted" {
  description = "Whether the rule is muted (inactive but retained for reference)"
  type        = bool
  default     = false
}
