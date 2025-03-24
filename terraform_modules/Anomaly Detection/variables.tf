variable "scope" {
  description = "Scope of the anomaly detection (e.g., SERVICE, SERVICE_METHOD, HOST_GROUP)"
  type        = string
}

variable "failure_rate_enabled" {
  description = "Enable or disable failure rate detection"
  type        = bool
}

variable "failure_rate_detection_mode" {
  description = "Detection mode for failure rate (e.g., 'fixed')"
  type        = string
}

variable "failure_rate_sensitivity" {
  description = "Sensitivity for failure rate detection (e.g., 'high')"
  type        = string
}

variable "failure_rate_threshold" {
  description = "Threshold for failure rate detection"
  type        = number
}

variable "failure_rate_minutes_abnormal_state" {
  description = "Minutes in abnormal state for failure rate detection"
  type        = number
}

variable "failure_rate_requests_per_minute" {
  description = "Requests per minute for failure rate detection"
  type        = number
}

variable "load_drop_enabled" {
  description = "Enable or disable load drop detection"
  type        = bool
}

variable "load_drop_percent" {
  description = "Percent for load drop detection"
  type        = number
}

variable "load_drop_minutes_abnormal_state" {
  description = "Minutes in abnormal state for load drop detection"
  type        = number
}

variable "load_spike_enabled" {
  description = "Enable or disable load spike detection"
  type        = bool
}

variable "load_spike_percent" {
  description = "Percent for load spike detection"
  type        = number
}

variable "load_spike_minutes_abnormal_state" {
  description = "Minutes in abnormal state for load spike detection"
  type        = number
}

variable "response_time_enabled" {
  description = "Enable or disable response time detection"
  type        = bool
}

variable "response_time_detection_mode" {
  description = "Detection mode for response time (e.g., 'fixed')"
  type        = string
}

variable "response_time_sensitivity" {
  description = "Sensitivity for response time detection (e.g., 'high')"
  type        = string
}

variable "response_time_minutes_abnormal_state" {
  description = "Minutes in abnormal state for response time detection"
  type        = number
}

variable "response_time_requests_per_minute" {
  description = "Requests per minute for response time detection"
  type        = number
}

variable "response_time_degradation_milliseconds" {
  description = "Degradation milliseconds for response time detection"
  type        = number
}

variable "response_time_slowest_degradation_milliseconds" {
  description = "Slowest degradation milliseconds for response time detection"
  type        = number
}