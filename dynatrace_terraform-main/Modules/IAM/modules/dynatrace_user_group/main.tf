resource "dynatrace_user_group" "user_group" {
  name         = var.user_group_name
  ldap_groups  = var.user_group_ldap_groups
  sso_groups   = var.user_group_sso_groups
  permission   = var.user_group_permission
  environments = var.user_group_environments
}
