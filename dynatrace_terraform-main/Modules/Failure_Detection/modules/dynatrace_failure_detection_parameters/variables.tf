variable "existing_failure_detection_parameters_name" {
  description = "Name of the existing failure detection parameter set to reference"
  type        = string
  default     = ""
}

variable "failure_detection_parameters_enabled" {
  description = "Toggle to enable or disable custom failure detection parameters"
  type        = bool
  default     = true
}

variable "failure_detection_parameters_name" {
  description = "Name to assign to the failure detection parameters block"
  type        = string
  default     = "default-failure-detection"
}

variable "failure_detection_parameters_description" {
  description = "Description of the failure detection parameters set"
  type        = string
  default     = "Handles standard exceptions, 404s, and masking rules"
}
