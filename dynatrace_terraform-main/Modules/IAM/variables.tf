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

variable "mgmz_permission_group" {
  description = "Group for management zone permission"
  type        = string
  default     = "observability-squad"
}

variable "mgmz_permission_environment" {
  description = "Environment for management zone permission"
  type        = string
  default     = "env:production"
}

variable "mgmz_permission_management_zone" {
  description = "Management zone for permission"
  type        = string
  default     = "prod-zone"
}

variable "mgmz_permission_permissions" {
  description = "Permissions for the management zone"
  type        = list(string)
  default     = ["view", "edit", "configure"]
}

variable "policy_name" {
  description = "Name of the cluster policy"
  type        = string
  default     = "cluster-policy-core"
}

variable "policy_statement_query" {
  description = "Statement query for the cluster policy"
  type        = string
  default     = "allow cluster visibility for SRE team"
}

variable "policy_cluster" {
  description = "Cluster for the policy"
  type        = string
  default     = "cluster-core-prod"
}

variable "policy_description" {
  description = "Description of the cluster policy"
  type        = string
  default     = "Used to control access to core production cluster"
}

variable "policy_tags" {
  description = "Tags for the cluster policy"
  type        = set(string)
  default     = ["cluster", "core", "access"]
}

variable "policy_bindings_group" {
  description = "Group for cluster policy bindings"
  type        = string
  default     = "platform-admins"
}

variable "policy_bindings_cluster" {
  description = "Cluster for policy bindings"
  type        = string
  default     = "cluster-core-prod"
}

variable "policy_bindings_policies" {
  description = "List of policy IDs for cluster policy bindings"
  type        = list(string)
  default     = ["cluster-policy-core"]
}

variable "user_email" {
  description = "Email of the user"
  type        = string
  default     = "user@example.com"
}

variable "user_first_name" {
  description = "First name of the user"
  type        = string
  default     = "Alex"
}

variable "user_last_name" {
  description = "Last name of the user"
  type        = string
  default     = "Morgan"
}

variable "user_user_name" {
  description = "Username of the user"
  type        = string
  default     = "amorgan"
}

variable "user_groups" {
  description = "Groups the user belongs to"
  type        = list(string)
  default     = ["monitoring-team", "data-ops"]
}

variable "user_group_name" {
  description = "Name of the user group"
  type        = string
  default     = "sre-team"
}

variable "user_group_ldap_groups" {
  description = "LDAP groups associated with the user group"
  type        = list(string)
  default     = ["cn=sre-group,ou=ldap,dc=company,dc=local"]
}

variable "user_group_sso_groups" {
  description = "SSO groups associated with the user group"
  type        = list(string)
  default     = ["AzureAD_SRE"]
}

variable "user_group_permission" {
  description = "Permission granted to the user group"
  type        = string
  default     = "view_and_configure"
}

variable "user_group_environments" {
  description = "Environments where the permission is granted"
  type        = list(string)
  default     = ["env:prod", "env:staging"]
}
