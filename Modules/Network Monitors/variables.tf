variable "dynatrace_api_url" {
  description = "Dynatrace API URL"
  type        = string
}

variable "dynatrace_api_token" {
  description = "Dynatrace API token"
  type        = string
  sensitive   = true
}

variable "network_monitor_name" { type = string }
variable "network_monitor_description" { type = string }
variable "network_monitor_type" { type = string }
variable "network_monitor_enabled" { type = bool }
variable "network_monitor_frequency_min" { type = number }
variable "network_monitor_locations" { type = list(string) }

variable "network_monitor_global_consecutive_outage_count_threshold" { type = number }
variable "network_monitor_global_outages" { type = bool }

variable "network_monitor_performance_thresholds_enabled" { type = bool }
variable "network_monitor_threshold_aggregation" { type = string }
variable "network_monitor_threshold_dealerting_samples" { type = number }
variable "network_monitor_threshold_samples" { type = number }
variable "network_monitor_threshold_step_index" { type = number }
variable "network_monitor_threshold_value" { type = number }
variable "network_monitor_threshold_violating_samples" { type = number }

variable "network_monitor_step_name" { type = string }
variable "network_monitor_step_request_type" { type = string }
variable "network_monitor_step_target_list" { type = list(string) }
variable "network_monitor_step_properties" { type = map(string) }

variable "network_monitor_step_constraint_type" { type = string }
variable "network_monitor_step_constraint_properties" { type = map(string) }

variable "network_monitor_step_request_constraint_type" { type = string }
variable "network_monitor_step_request_constraint_properties" { type = map(string) }

variable "network_monitor_tag_context" { type = string }
variable "network_monitor_tag_key" { type = string }
variable "network_monitor_tag_source" { type = string }
variable "network_monitor_tag_value" { type = string }

variable "network_monitor_outage_global_outages" { type = bool }
variable "network_monitor_outage_global_consecutive_outage_count_threshold" { type = number }
variable "network_monitor_outage_local_outages" { type = bool }
variable "network_monitor_outage_local_consecutive_outage_count_threshold" { type = number }
variable "network_monitor_outage_local_location_outage_count_threshold" { type = number }
variable "network_monitor_outage_scope" { type = string }