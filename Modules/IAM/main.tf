terraform {
  required_version = ">= 1.0"
}

provider "dynatrace" {
  # Assume provider configuration is handled elsewhere
}

# ─── IAM Groups and Permissions ───────────────────────────
module "iam_group_name" {
  source         = "./modules/dynatrace_iam_group"
  iam_group_name = var.iam_group_name
}

module "iam_group_permission_scope" {
  source                    = "./modules/dynatrace_iam_group"
  iam_group_permission_scope = var.iam_group_permission_scope
}

module "iam_permission_group" {
  source              = "./modules/dynatrace_iam_permission"
  iam_permission_group = var.iam_permission_group
}

module "iam_permission_account" {
  source               = "./modules/dynatrace_iam_permission"
  iam_permission_account = var.iam_permission_account
}

# ─── IAM Policies and Bindings ────────────────────────────
module "iam_policy_name" {
  source           = "./modules/dynatrace_iam_policy"
  iam_policy_name  = var.iam_policy_name
}

module "iam_policy_statement_query" {
  source                     = "./modules/dynatrace_iam_policy"
  iam_policy_statement_query = var.iam_policy_statement_query
}

module "iam_policy_account" {
  source             = "./modules/iam_policy_account"
  iam_policy_account = var.iam_policy_account
}

module "iam_policy_description" {
  source               = "./modules/iam_policy_description"
  iam_policy_description = var.iam_policy_description
}

module "iam_policy_tags" {
  source           = "./modules/dynatrace_iam_policy"
  iam_policy_tags  = var.iam_policy_tags
}

module "iam_policy_bindings_group" {
  source                   = "./modules/dynatrace_iam_policy_bindings"
  iam_policy_bindings_group = var.iam_policy_bindings_group
}

module "iam_policy_bindings_account" {
  source                    = "./modules/dynatrace_iam_policy_bindings"
  iam_policy_bindings_account = var.iam_policy_bindings_account
}

module "iam_policy_bindings_policies" {
  source                      = "./modules/dynatrace_iam_policy_bindings"
  iam_policy_bindings_policies = var.iam_policy_bindings_policies
}

module "iam_policy_bindings_v2_group" {
  source                        = "./modules/dynatrace_iam_policy_bindings_v2"
  iam_policy_bindings_v2_group = var.iam_policy_bindings_v2_group
}

module "iam_policy_bindings_v2_account" {
  source                          = "./modules/dynatrace_iam_policy_bindings_v2"
  iam_policy_bindings_v2_account = var.iam_policy_bindings_v2_account
}

module "iam_policy_bindings_v2_policies" {
  source                           = "./modules/dynatrace_iam_policy_bindings_v2"
  iam_policy_bindings_v2_policies = var.iam_policy_bindings_v2_policies
}

module "iam_policy_boundary_name" {
  source                  = "./modules/dynatrace_iam_policy_boundary"
  iam_policy_boundary_name = var.iam_policy_boundary_name
}

module "iam_policy_boundary_query" {
  source                  = "./modules/dynatrace_iam_policy_boundary"
  iam_policy_boundary_query = var.iam_policy_boundary_query
}

# ─── IAM Users ─────────────────────────────────────────────
module "iam_user_email" {
  source           = "./modules/dynatrace_iam_user"
  iam_user_email   = var.iam_user_email
}

module "iam_user_groups" {
  source           = "./modules/dynatrace_iam_user"
  iam_user_groups  = var.iam_user_groups
}

# ─── Management Zone Permissions ──────────────────────────
module "mgmz_permission_group" {
  source                 = "./modules/dynatrace_mgmz_permission"
  mgmz_permission_group = var.mgmz_permission_group
}

module "mgmz_permission_environment" {
  source                      = "./modules/dynatrace_mgmz_permission"
  mgmz_permission_environment = var.mgmz_permission_environment
}

module "mgmz_permission_management_zone" {
  source                           = "./modules/dynatrace_mgmz_permission"
  mgmz_permission_management_zone = var.mgmz_permission_management_zone
}

module "mgmz_permission_permissions" {
  source                       = "./modules/dynatrace_mgmz_permission"
  mgmz_permission_permissions = var.mgmz_permission_permissions
}

# ─── Cluster Policies and Bindings ────────────────────────
module "policy_name" {
  source       = "./modules/dynatrace_policy"
  policy_name  = var.policy_name
}

module "policy_statement_query" {
  source                  = "./modules/dynatrace_policy"
  policy_statement_query = var.policy_statement_query
}

module "policy_cluster" {
  source        = "./modules/dynatrace_policy"
  policy_cluster = var.policy_cluster
}

module "policy_description" {
  source             = "./modules/dynatrace_policy"
  policy_description = var.policy_description
}

module "policy_tags" {
  source       = "./modules/dynatrace_policy"
  policy_tags  = var.policy_tags
}

module "policy_bindings_group" {
  source               = "./modules/dynatrace_policy_bindings"
  policy_bindings_group = var.policy_bindings_group
}

module "policy_bindings_cluster" {
  source                = "./modules/dynatrace_policy_bindings"
  policy_bindings_cluster = var.policy_bindings_cluster
}

module "policy_bindings_policies" {
  source                = "./modules/dynatrace_policy_bindings"
  policy_bindings_policies = var.policy_bindings_policies
}

# ─── User Profile and Group Linking ───────────────────────
module "user_email" {
  source      = "./modules/dynatrace_user"
  user_email  = var.user_email
}

module "user_first_name" {
  source          = "./modules/dynatrace_user"
  user_first_name = var.user_first_name
}

module "user_last_name" {
  source         = "./modules/dynatrace_user"
  user_last_name = var.user_last_name
}

module "user_user_name" {
  source          = "./modules/dynatrace_user"
  user_user_name  = var.user_user_name
}

module "user_groups" {
  source      = "./modules/dynatrace_user_group"
  user_groups = var.user_groups
}

module "user_group_name" {
  source           = "./modules/dynatrace_user_group"
  user_group_name  = var.user_group_name
}

module "user_group_ldap_groups" {
  source                 = "./modules/dynatrace_user_group"
  user_group_ldap_groups = var.user_group_ldap_groups
}

module "user_group_sso_groups" {
  source                = "./modules/dynatrace_user_group"
  user_group_sso_groups = var.user_group_sso_groups
}

module "user_group_permission" {
  source                 = "./modules/dynatrace_user_group"
  user_group_permission = var.user_group_permission
}

module "user_group_environments" {
  source                    = "./modules/dynatrace_user_group"
  user_group_environments  = var.user_group_environments
}
