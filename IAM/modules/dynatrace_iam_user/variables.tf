variable "iam_user_email" {
  description = "Email of the IAM user"
  type        = string
  default     = "sre@example.com"
}

variable "iam_user_groups" {
  description = "Groups the IAM user belongs to"
  type        = list(string)
  default     = ["platform-admins", "monitoring-team"]
}
