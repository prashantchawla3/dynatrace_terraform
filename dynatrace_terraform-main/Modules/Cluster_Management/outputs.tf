output "environment_id" {
  value = dynatrace_environment.this.id
}

output "preferences_id" {
  value = dynatrace_managed_preferences.this.id
}

output "backup_enabled" {
  value = dynatrace_managed_backup.this.enabled
}

output "proxy_server" {
  value = dynatrace_managed_internet_proxy.this.server
}

output "network_zone_name" {
  value = dynatrace_managed_network_zones.this.name
}

output "web_ui_address" {
  value = dynatrace_managed_public_endpoints.this.web_ui_address
}

output "remote_access_user" {
  value = dynatrace_managed_remote_access.this.user_id
}

output "smtp_host" {
  value = dynatrace_managed_smtp.this.host_name
}
