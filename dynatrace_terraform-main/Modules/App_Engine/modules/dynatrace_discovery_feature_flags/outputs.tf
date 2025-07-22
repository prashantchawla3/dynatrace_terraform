output "discovery_flag_ids" {
  value = [for r in dynatrace_discovery_feature_flags.discovery_flags : r.id]
}