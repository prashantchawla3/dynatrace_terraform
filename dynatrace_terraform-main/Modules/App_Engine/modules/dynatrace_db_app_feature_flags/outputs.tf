output "db_app_feature_flag_names" {
  description = "List of names for the created DB app feature flags"
  value       = dynatrace_db_app_feature_flags.feature_flags[*].name
}

output "db_app_feature_flag_types" {
  description = "List of types for the created DB app feature flags"
  value       = dynatrace_db_app_feature_flags.feature_flags[*].type
}
