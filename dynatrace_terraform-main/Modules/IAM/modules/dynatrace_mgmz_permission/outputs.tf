output "mgmz_permission_group" {
  description = "The group assigned to the management zone permission"
  value       = dynatrace_mgmz_permission.mgmz_permission.group
}

output "mgmz_permission_environment" {
  description = "The environment identifier for the management zone permission"
  value       = dynatrace_mgmz_permission.mgmz_permission.environment
}

output "mgmz_permission_management_zone" {
  description = "The management zone affected by the permission binding"
  value       = dynatrace_mgmz_permission.mgmz_permission.management_zone
}

output "mgmz_permission_permissions" {
  description = "The set of permissions granted to the group for the management zone"
  value       = dynatrace_mgmz_permission.mgmz_permission.permissions
}
