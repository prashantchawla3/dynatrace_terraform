# -------------------------------
# Output for Discovery Default Rules
# -------------------------------
output "discovery_default_rule_ids" {
  description = "List of IDs for the created discovery default rules"
  value       = dynatrace_discovery_default_rules.default_rules[*].id
}

# -------------------------------
# Output for Discovery Feature Flags
# -------------------------------
output "discovery_feature_flag_names" {
  description = "List of names for the created discovery feature flags"
  value       = dynatrace_discovery_feature_flags.discovery_flags[*].name
}

# -------------------------------
# Output for Ansible Connections
# -------------------------------
output "ansible_connection_names" {
  description = "List of names for the created Ansible connections"
  value       = dynatrace_event_driven_ansible_connections.ansible_connections[*].name
}


output "infraops_app_settings_ids" {
  description = "List of resource IDs for the InfraOps app settings"
  value       = dynatrace_infraops_app_settings.infraops_settings[*].id
}
