
# ─── IAM Group & Permissions ──────────────────────────────
module "iam_group" {
  source = "./modules/dynatrace_iam_group"
  iam_group_name            = var.iam_group_name
  iam_group_permission_scope = var.iam_group_permission_scope
}

module "iam_permission" {
  source = "./modules/dynatrace_iam_permission"
  iam_permission_group   = var.iam_permission_group
  iam_permission_account = var.iam_permission_account
}

# ─── IAM Policies & Bindings ─────────────────────────────
module "iam_policy" {
  source = "./modules/dynatrace_iam_policy"
  iam_policy_name             = var.iam_policy_name
  iam_policy_statement_query  = var.iam_policy_statement_query
  iam_policy_account          = var.iam_policy_account
  iam_policy_description      = var.iam_policy_description
  iam_policy_tags             = var.iam_policy_tags
}

module "iam_policy_bindings" {
  source = "./modules/dynatrace_iam_policy_bindings"
  iam_policy_bindings_group    = var.iam_policy_bindings_group
  iam_policy_bindings_account  = var.iam_policy_bindings_account
  iam_policy_bindings_policies = var.iam_policy_bindings_policies
}

module "iam_policy_bindings_v2" {
  source = "./modules/dynatrace_iam_policy_bindings_v2"
  iam_policy_bindings_v2_group    = var.iam_policy_bindings_v2_group
  iam_policy_bindings_v2_account  = var.iam_policy_bindings_v2_account
  iam_policy_bindings_v2_policies = var.iam_policy_bindings_v2_policies
}

module "iam_policy_boundary" {
  source = "./modules/dynatrace_iam_policy_boundary"
  iam_policy_boundary_name  = var.iam_policy_boundary_name
  iam_policy_boundary_query = var.iam_policy_boundary_query
}

# ─── IAM Users ────────────────────────────────────────────
module "iam_user" {
  source = "./modules/dynatrace_iam_user"
  iam_user_email  = var.iam_user_email
  iam_user_groups = var.iam_user_groups
}

# ─── Management Zone Permissions ─────────────────────────
module "mgmz_permission" {
  source = "./modules/dynatrace_mgmz_permission"
  mgmz_permission_group           = var.mgmz_permission_group
  mgmz_permission_environment     = var.mgmz_permission_environment
  mgmz_permission_management_zone = var.mgmz_permission_management_zone
  mgmz_permission_permissions     = var.mgmz_permission_permissions
}

# ─── Cluster Policy & Bindings ───────────────────────────
module "policy" {
  source = "./modules/dynatrace_policy"
  policy_name             = var.policy_name
  policy_statement_query  = var.policy_statement_query
  policy_cluster          = var.policy_cluster
  policy_description      = var.policy_description
  policy_tags             = var.policy_tags
}

module "policy_bindings" {
  source = "./modules/dynatrace_policy_bindings"
  policy_bindings_group    = var.policy_bindings_group
  policy_bindings_cluster  = var.policy_bindings_cluster
  policy_bindings_policies = var.policy_bindings_policies
}

# ─── User Profile & Group Configuration ──────────────────
module "user" {
  source = "./modules/dynatrace_user"
  user_email     = var.user_email
  user_first_name = var.user_first_name
  user_last_name  = var.user_last_name
  user_user_name  = var.user_user_name
  user_groups     = var.user_groups
}

module "user_group" {
  source = "./modules/dynatrace_user_group"
  user_group_name         = var.user_group_name
  user_group_ldap_groups  = var.user_group_ldap_groups
  user_group_sso_groups   = var.user_group_sso_groups
  user_group_permission   = var.user_group_permission
  user_group_environments = var.user_group_environments
}
