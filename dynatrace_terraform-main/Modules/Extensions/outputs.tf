output "execution_controller_ids" {
  value = [for r in dynatrace_extension_execution_controller.this : r.id]
}

output "execution_remote_ids" {
  value = [for r in dynatrace_extension_execution_remote.this : r.id]
}

output "hub_extension_versions" {
  value = [for r in dynatrace_hub_extension_active_version.this : r.version]
}

output "hub_extension_config_names" {
  value = [for r in dynatrace_hub_extension_config.this : r.name]
}
