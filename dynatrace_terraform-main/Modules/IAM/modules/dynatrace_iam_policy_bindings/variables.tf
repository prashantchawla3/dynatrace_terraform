variable "iam_policy_bindings_group" {
  description = "Group for IAM policy bindings"
  type        = string
  default     = "platform-admins"
}

variable "iam_policy_bindings_account" {
  description = "Account for IAM policy bindings"
  type        = string
  default     = "1234567890"
}

variable "iam_policy_bindings_policies" {
  description = "List of policy IDs for IAM policy bindings"
  type        = list(string)
  default     = ["policy-001", "policy-002"]
}
