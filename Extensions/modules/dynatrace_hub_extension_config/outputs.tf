output "hub_extension_config_names" {
  value = [for r in dynatrace_hub_extension_config.this : r.name]
}