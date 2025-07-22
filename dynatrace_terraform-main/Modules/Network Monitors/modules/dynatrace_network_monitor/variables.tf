variable "network_monitor_name" {
  description = "Name of the network monitor synthetic test"
  type        = string
  default     = "GlobalConnectivityTest"
}

variable "network_monitor_description" {
  description = "Human-readable description of the network monitor's purpose"
  type        = string
  default     = "Checks internet access across key regions every 5 minutes"
}

variable "network_monitor_type" {
  description = "Type of network monitor (e.g., PING, HTTP)"
  type        = string
  default     = "PING"
}

variable "network_monitor_enabled" {
  description = "Whether the network monitor is active"
  type        = bool
  default     = true
}

variable "network_monitor_frequency_min" {
  description = "Interval between monitor executions in minutes"
  type        = number
  default     = 5
}

variable "network_monitor_locations" {
  description = "List of geographic locations where the test will run"
  type        = list(string)
  default     = ["GEO-US", "GEO-EU", "GEO-JP"]
}

variable "network_monitor_global_consecutive_outage_count_threshold" {
  description = "Number of failed runs before global outage is triggered"
  type        = number
  default     = 3
}

variable "network_monitor_global_outages" {
  description = "Enable or disable detection of global outages"
  type        = bool
  default     = true
}

variable "network_monitor_performance_thresholds_enabled" {
  description = "Enable performance threshold logic for synthetic steps"
  type        = bool
  default     = true
}

variable "network_monitor_threshold_aggregation" {
  description = "Aggregation method used for threshold calculation"
  type        = string
  default     = "AVG"
}

variable "network_monitor_threshold_dealerting_samples" {
  description = "Number of samples below threshold needed to clear alert"
  type        = number
  default     = 2
}

variable "network_monitor_threshold_samples" {
  description = "Number of samples used for threshold evaluation"
  type        = number
  default     = 5
}

variable "network_monitor_threshold_step_index" {
  description = "Synthetic step index for which threshold applies"
  type        = number
  default     = 0
}

variable "network_monitor_threshold_value" {
  description = "Threshold value (e.g., max response time in ms)"
  type        = number
  default     = 1000
}

variable "network_monitor_threshold_violating_samples" {
  description = "Minimum number of samples breaching threshold required to alert"
  type        = number
  default     = 3
}

variable "network_monitor_step_name" {
  description = "Name of the synthetic step inside the network monitor"
  type        = string
  default     = "Ping Step"
}

variable "network_monitor_step_request_type" {
  description = "Type of request made by the step (e.g., GET, PING)"
  type        = string
  default     = "PING"
}

variable "network_monitor_step_target_list" {
  description = "List of endpoints targeted by the synthetic step"
  type        = list(string)
  default     = ["https://example.com", "https://internal.service.local"]
}

variable "network_monitor_step_properties" {
  description = "Map of request properties (e.g., headers, config)"
  type        = map(string)
  default     = {
    retries = "3"
    timeout = "1000"
  }
}

variable "network_monitor_step_constraint_type" {
  description = "Constraint type for step validation (e.g., STATUS_CODE)"
  type        = string
  default     = "STATUS_CODE"
}

variable "network_monitor_step_constraint_properties" {
  description = "Validation properties used for step constraints"
  type        = map(string)
  default     = {
    expected_code = "200"
  }
}

variable "network_monitor_step_request_constraint_type" {
  description = "Type of request constraint applied (e.g., CONTAINS)"
  type        = string
  default     = "CONTAINS"
}

variable "network_monitor_step_request_constraint_properties" {
  description = "Map of constraint properties for response validation"
  type        = map(string)
  default     = {
    response_text = "pong"
  }
}

variable "network_monitor_tag_context" {
  description = "Tag context (e.g., ENVIRONMENT or SERVICE) associated with the monitor"
  type        = string
  default     = "SERVICE"
}

variable "network_monitor_tag_key" {
  description = "Key for the tag used in grouping/filtering"
  type        = string
  default     = "env"
}

variable "network_monitor_tag_source" {
  description = "Tag source (e.g., USER, RULE)"
  type        = string
  default     = "USER"
}

variable "network_monitor_tag_value" {
  description = "Tag value to apply to the monitor"
  type        = string
  default     = "production"
}
