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