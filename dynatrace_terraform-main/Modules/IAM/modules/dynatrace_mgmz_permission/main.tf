resource "dynatrace_mgmz_permission" "mgmz_permission" {
  group           = var.mgmz_permission_group
  environment     = var.mgmz_permission_environment
  management_zone = var.mgmz_permission_management_zone
  permissions     = var.mgmz_permission_permissions
}
