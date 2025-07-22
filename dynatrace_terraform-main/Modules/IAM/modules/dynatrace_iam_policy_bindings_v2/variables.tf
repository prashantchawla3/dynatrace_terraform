variable "iam_policy_bindings_v2_group" {
  description = "Group for IAM policy bindings v2"
  type        = string
  default     = "platform-admins"
}

variable "iam_policy_bindings_v2_account" {
  description = "Account for IAM policy bindings v2"
  type        = string
  default     = "1234567890"
}

variable "iam_policy_bindings_v2_policies" {
  description = "List of policies with parameters and metadata for IAM policy bindings v2"
  type = list(object({
    id         = string
    parameters = map(string)
    metadata   = map(string)
  }))
  default = [
    {
      id         = "policy-001"
      parameters = { access = "read-write" }
      metadata   = { environment = "prod" }
    }
  ]
}
