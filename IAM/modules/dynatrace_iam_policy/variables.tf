variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "sre-policy-global"
}

variable "iam_policy_statement_query" {
  description = "Statement query for the IAM policy"
  type        = string
  default     = "allow access to management zones and monitoring dashboards"
}

variable "iam_policy_account" {
  description = "Account ID for the IAM policy"
  type        = string
  default     = "1234567890"
}

variable "iam_policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = "Grants platform admin access to all observability dashboards"
}

variable "iam_policy_tags" {
  description = "Tags for the IAM policy"
  type        = set(string)
  default     = ["observability", "admin", "dashboard"]
}
