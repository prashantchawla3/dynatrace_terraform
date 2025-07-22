variable "iam_policy_boundary_name" {
  description = "Name of the IAM policy boundary"
  type        = string
  default     = "admin-boundary"
}

variable "iam_policy_boundary_query" {
  description = "Query for the IAM policy boundary"
  type        = string
  default     = "limit access to critical resources only"
}
