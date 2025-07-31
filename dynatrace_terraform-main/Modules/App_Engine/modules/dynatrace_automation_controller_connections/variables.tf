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