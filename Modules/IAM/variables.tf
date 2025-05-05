variable "iam_group_name" {
  description = "Name of the IAM group"
  type        = string
}

variable "iam_group_permission_scope" {
  description = "Scope of the IAM group permission"
  type        = string
}

variable "iam_permission_group" {
  description = "Group of the IAM permission"
  type        = string
}

variable "iam_permission_account" {
  description = "Account of the IAM permission"
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "iam_policy_statement_query" {
  description = "Statement query of the IAM policy"
  type        = string
}

variable "iam_policy_account" {
  description = "Account of the IAM policy"
  type        = string
}

variable "iam_policy_description" {
  description = "Description of the IAM policy"
  type        = string
}

variable "iam_policy_tags" {
  description = "Tags of the IAM policy"
  type        = list(string)
}

variable "iam_user_email" {
  description = "Email of the IAM user"
  type        = string
}

variable "iam_user_groups" {
  description = "Groups of the IAM user"
  type        = list(string)
}