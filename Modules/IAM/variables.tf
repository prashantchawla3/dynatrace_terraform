variable "iam_group_name" {
  description = "Name of the IAM group"
  type        = string
}

variable "iam_group_permission_name" {
  description = "Name of the IAM group permission"
  type        = string
}

variable "iam_group_permission_type" {
  description = "Type of the IAM group permission"
  type        = string
}

variable "iam_group_permission_scope" {
  description = "Scope of the IAM group permission"
  type        = string
}

variable "iam_permission_name" {
  description = "Name of the IAM permission"
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

variable "iam_permission_environment" {
  description = "Environment of the IAM permission"
  type        = string
}

variable "iam_permission_management_zone" {
  description = "Management zone of the IAM permission"
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

variable "iam_policy_environment" {
  description = "Environment of the IAM policy"
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

variable "iam_policy_bindings_group" {
  description = "Group of the IAM policy bindings"
  type        = string
}

variable "iam_policy_bindings_account" {
  description = "Account of the IAM policy bindings"
  type        = string
}

variable "iam_policy_bindings_environment" {
  description = "Environment of the IAM policy bindings"
  type        = string
}

variable "iam_policy_bindings_policies" {
  description = "Policies of the IAM policy bindings"
  type        = list(string)
}

variable "iam_policy_bindings_v2_group" {
  description = "Group of the IAM policy bindings v2"
  type        = string
}

variable "iam_policy_bindings_v2_account" {
  description = "Account of the IAM policy bindings v2"
  type        = string
}

variable "iam_policy_bindings_v2_environment" {
  description = "Environment of the IAM policy bindings v2"
  type        = string
}

variable "iam_policy_bindings_v2_policies" {
  description = "Policies of the IAM policy bindings v2"
  type        = map(object({
    id         = string
    parameters = map(string)
    metadata   = map(string)
  }))
}

variable "iam_policy_boundary_name" {
  description = "Name of the IAM policy boundary"
  type        = string
}

variable "iam_policy_boundary_query" {
  description = "Query of the IAM policy boundary"
  type        = string
}

variable "iam_user_email" {
  description = "Email of the IAM user"
  type        = string
}

variable "iam_user_first_name" {
  description = "First name of the IAM user"
  type        = string
}

variable "iam_user_last_name" {
  description = "Last name of the IAM user"
  type        = string
}

variable "iam_user_user_name" {
  description = "Username of the IAM user"
  type        = string
}

variable "iam_user_groups" {
  description = "Groups of the IAM user"
  type        = list(string)
}

variable "mgmz_permission_group" {
  description = "Group of the management zone permission"
  type        = string
}

variable "mgmz_permission_environment" {
  description = "Environment of the management zone permission"
  type        = string
}

variable "mgmz_permission_management_zone" {
  description = "Management zone of the management zone permission"
  type        = string
}

variable "mgmz_permission_permissions" {
  description = "Permissions of the management zone permission"
  type        = list(string)
}

variable "policy_name" {
  description = "Name of the policy"
  type        = string
}

variable "policy_statement_query" {
  description = "Statement query of the policy"
  type        = string
}

variable "policy_cluster" {
  description = "Cluster of the policy"
  type        = string
}

variable "policy_environment" {
  description = "Environment of the policy"
  type        = string
}

variable "policy_description" {
  description = "Description of the policy"
  type        = string
}

variable "policy_tags" {
  description = "Tags of the policy"
  type        = list(string)
}

variable "policy_bindings_group" {
  description = "Group of the policy bindings"
  type        = string
}

variable "policy_bindings_cluster" {
  description = "Cluster of the policy bindings"
  type        = string
}

variable "policy_bindings_environment" {
  description = "Environment of the policy bindings"
  type        = string
}

variable "policy_bindings_policies" {
  description = "Policies of the policy bindings"
  type        = list(string)
}

variable "user_email" {
  description = "Email of the user"
  type        = string
}

variable "user_first_name" {
  description = "First name of the user"
  type        = string
}

variable "user_last_name" {
  description = "Last name of the user"
  type        = string
}

variable "user_user_name" {
  description = "Username of the user"
  type        = string
}

variable "user_groups" {
  description = "Groups of the user"
  type        = list(string)
}

variable "user_group_name" {
  description = "Name of the user group"
  type        = string
}

variable "user_group_ldap_groups" {
  description = "LDAP groups of the user group"
  type        = list(string)
}

variable "user_group_sso_groups" {
  description = "SSO groups of the user group"
  type        = list(string)
}

variable "user_group_permission" {
  description = "Permission of the user group"
  type        = string
}

variable "user_group_environments" {
  description = "Environments of the user group"
  type        = list(string)
}
