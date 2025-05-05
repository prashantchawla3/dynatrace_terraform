resource "dynatrace_iam_group" "iam_group" {
  name = var.iam_group_name

  permissions {
    permission {
      name  = "account-user-management"
      type  = "account"
      scope = var.iam_group_permission_scope
    }
  }
}

resource "dynatrace_iam_permission" "iam_permission" {
  name            = "account-user-management"
  group           = var.iam_permission_group
  account         = var.iam_permission_account
}

resource "dynatrace_iam_policy" "iam_policy" {
  name            = var.iam_policy_name
  statement_query = var.iam_policy_statement_query
  account         = var.iam_policy_account
  description     = var.iam_policy_description
  tags            = var.iam_policy_tags
}

resource "dynatrace_iam_policy_bindings" "iam_policy_bindings" {
  group       = var.iam_policy_bindings_group
  account     = var.iam_policy_bindings_account
  policies    = var.iam_policy_bindings_policies
}

resource "dynatrace_iam_policy_bindings_v2" "iam_policy_bindings_v2" {
  group       = var.iam_policy_bindings_v2_group
  account     = var.iam_policy_bindings_v2_account

  dynamic "policy" {
    for_each = var.iam_policy_bindings_v2_policies
    content {
      id         = policy.value.id
      parameters = policy.value.parameters
      metadata   = policy.value.metadata
    }
  }
}

resource "dynatrace_iam_policy_boundary" "iam_policy_boundary" {
  name  = var.iam_policy_boundary_name
  query = var.iam_policy_boundary_query
}

resource "dynatrace_iam_user" "iam_user" {
  email  = var.iam_user_email
  groups = var.iam_user_groups
}

resource "dynatrace_mgmz_permission" "mgmz_permission" {
  group           = var.mgmz_permission_group
  environment     = var.mgmz_permission_environment
  management_zone = var.mgmz_permission_management_zone
  permissions     = var.mgmz_permission_permissions
}

resource "dynatrace_policy" "policy" {
  name            = var.policy_name
  statement_query = var.policy_statement_query
  cluster         = var.policy_cluster
  description     = var.policy_description
  tags            = var.policy_tags
}

resource "dynatrace_policy_bindings" "policy_bindings" {
  group       = var.policy_bindings_group
  cluster     = var.policy_bindings_cluster
  policies    = var.policy_bindings_policies
}

resource "dynatrace_user" "user" {
  email      = var.user_email
  first_name = var.user_first_name
  last_name  = var.user_last_name
  user_name  = var.user_user_name
  groups     = var.user_groups
}

resource "dynatrace_user_group" "user_group" {
  name        = var.user_group_name
  ldap_groups = var.user_group_ldap_groups
  sso_groups  = var.user_group_sso_groups

  permissions {
    grant {
      permission   = var.user_group_permission
      environments = var.user_group_environments
    }
  }
}

output "iam_group_id" {
  description = "ID of the IAM group"
  value       = dynatrace_iam_group.iam_group.id
}

output "iam_permission_id" {
  description = "ID of the IAM permission"
  value       = dynatrace_iam_permission.iam_permission.id
}

output "iam_policy_id" {
  description = "ID of the IAM policy"
  value       = dynatrace_iam_policy.iam_policy.id
}

output "iam_policy_bindings_id" {
  description = "ID of the IAM policy bindings"
  value       = dynatrace_iam_policy_bindings.iam_policy_bindings.id
}

output "iam_policy_bindings_v2_id" {
  description = "ID of the IAM policy bindings v2"
  value       = dynatrace_iam_policy_bindings_v2.iam_policy_bindings_v2.id
}

output "iam_policy_boundary_id" {
  description = "ID of the IAM policy boundary"
  value       = dynatrace_iam_policy_boundary.iam_policy_boundary.id
}

output "iam_user_id" {
  description = "ID of the IAM user"
  value       = dynatrace_iam_user.iam_user.id
}

output "mgmz_permission_id" {
  description = "ID of the management zone permission"
  value       = dynatrace_mgmz_permission.mgmz_permission.id
}

output "policy_id" {
  description = "ID of the policy"
  value       = dynatrace_policy.policy.id
}

output "policy_bindings_id" {
  description = "ID of the policy bindings"
  value       = dynatrace_policy_bindings.policy_bindings.id
}

output "user_id" {
  description = "ID of the user"
  value       = dynatrace_user.user.id
}

output "user_group_id" {
  description = "ID of the user group"
  value       = dynatrace_user_group.user_group.id
}