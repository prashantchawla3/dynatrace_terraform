variable "remote_access_user_id" {
  description = "The user ID requesting remote access"
  type        = string
  default     = "admin"
}

variable "remote_access_reason" {
  description = "The reason for requesting remote access"
  type        = string
  default     = "Routine maintenance"
}

variable "remote_access_requested_days" {
  description = "Number of days for which remote access is requested"
  type        = number
  default     = 3
}

variable "remote_access_role" {
  description = "The role assigned for the remote access session (e.g., admin, read-only)"
  type        = string
  default     = "admin"
}
