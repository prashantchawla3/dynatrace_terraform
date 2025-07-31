# -------------------------------
# Discovery Default Rules Module
# -------------------------------
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

# -------------------------------
# Discovery Feature Flags Module
# -------------------------------
variable "feature_flag_count" {
  description = "Number of discovery feature flag resources to create"
  type        = number
  default     = 1
}

variable "feature_flag_names" {
  description = "List of names for each discovery feature flag (indexed by count)"
  type        = list(string)
  default     = ["enable_auto_discovery"]
}

variable "feature_flag_type" {
  description = "Type of discovery feature flag (e.g., HOST_DISCOVERY, PROCESS_GROUP_DISCOVERY)"
  type        = string
  default     = "HOST_DISCOVERY"
}

variable "feature_flag_boolean_value" {
  description = "Boolean value indicating whether the feature is enabled (true) or disabled (false)"
  type        = bool
  default     = true
}

# -------------------------------
# Ansible Connections Module
# -------------------------------
variable "ansible_connection_count" {
  description = "Number of Ansible connection resources to create"
  type        = number
  default     = 1
}

variable "ansible_connection_names" {
  description = "List of connection names mapped by index"
  type        = list(string)
  default     = ["ansible-connection-1"]
}

variable "ansible_connection_url" {
  description = "The URL endpoint for the Ansible connection"
  type        = string
  default     = "https://ansible.example.com/api/v1/events"
}

variable "ansible_connection_type" {
  description = "Type of Ansible event connection (e.g., 'ANSIBLE', 'WEBHOOK')"
  type        = string
  default     = "ANSIBLE"
}

variable "ansible_connection_token" {
  description = "Authentication token used for the Ansible connection"
  type        = string
  default     = "REPLACE_WITH_TOKEN"
  sensitive   = true
}

# -------------------------------
# InfraOps App Settings Module
# -------------------------------
variable "infraops_settings_count" {
  description = "Number of InfraOps app settings resources to create"
  type        = number
  default     = 1
}

variable "infraops_show_monitoring_candidates" {
  description = "Whether to highlight monitoring candidates within InfraOps views"
  type        = bool
  default     = true
}

variable "infraops_show_standalone_hosts" {
  description = "Whether to display standalone (non-clustered) hosts in InfraOps"
  type        = bool
  default     = true
}

variable "infraops_interface_saturation_threshold" {
  description = "Threshold percentage (0–100) used to evaluate saturated network interfaces"
  type        = number
  default     = 85
}
# Automation Controller Connections
variable "automation_controller_count" {
  description = "Number of Dynatrace automation controller connections to create"
  type        = number
  default     = 1
}

variable "automation_controller_names" {
  description = "List of names for each Dynatrace automation controller connection"
  type        = list(string)
  default     = ["default-connection"]
}

variable "automation_controller_url" {
  description = "The URL of the Dynatrace automation controller"
  type        = string
  default     = "https://automation.dynatrace.com"
}

variable "automation_controller_type" {
  description = "The type of the Dynatrace automation controller connection (e.g., 'AUTOMATION_ENGINE')"
  type        = string
  default     = "AUTOMATION_ENGINE"
}

variable "automation_controller_token" {
  description = "The API token used to authenticate with the Dynatrace automation controller"
  type        = string
  default     = "dt0c01.XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  sensitive   = true
}

# DB App Feature Flags
variable "db_app_feature_flag_count" {
  description = "Number of Dynatrace DB app feature flags to create"
  type        = number
  default     = 1
}

variable "db_app_feature_flag_names" {
  description = "List of names for each Dynatrace DB app feature flag"
  type        = list(string)
  default     = ["default-feature-flag"]
}

variable "db_app_feature_flag_type" {
  description = "The type of the feature flag (e.g., 'BOOLEAN', 'STRING')"
  type        = string
  default     = "STRING"
}
