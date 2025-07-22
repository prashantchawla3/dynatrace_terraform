output "connection_ids" {
  value = [for r in dynatrace_automation_controller_connections.connections : r.id]
}

output "feature_flag_ids" {
  value = [for r in dynatrace_db_app_feature_flags.feature_flags : r.id]
}

output "default_rule_ids" {
  value = [for r in dynatrace_discovery_default_rules.default_rules : r.id]
}

output "discovery_flag_ids" {
  value = [for r in dynatrace_discovery_feature_flags.discovery_flags : r.id]
}

output "ansible_connection_ids" {
  value = [for r in dynatrace_event_driven_ansible_connections.ansible_connections : r.id]
}

output "infraops_setting_ids" {
  value = [for r in dynatrace_infraops_app_settings.infraops_settings : r.id]
}
