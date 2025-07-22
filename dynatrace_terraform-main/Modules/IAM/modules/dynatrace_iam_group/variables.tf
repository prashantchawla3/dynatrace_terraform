variable "iam_group_name" {
  description = "Name of the IAM group"
  type        = string
  default     = "platform-admins"
}
variable "iam_group_permission_scope" {
  description = "Scope for the IAM group permission"
  type        = string
  default     = "env:production"
}
