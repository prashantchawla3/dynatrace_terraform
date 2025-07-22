variable "iam_permission_group" {
  description = "Group name for IAM permission"
  type        = string
  default     = "platform-admins"
}

variable "iam_permission_account" {
  description = "Account ID for IAM permission"
  type        = string
  default     = "1234567890"
}
