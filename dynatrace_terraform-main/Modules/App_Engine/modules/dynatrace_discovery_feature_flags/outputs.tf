output "discovery_feature_flag_names" {
  description = "List of names for the created discovery feature flags"
  value       = dynatrace_discovery_feature_flags.discovery_flags[*].name
}
