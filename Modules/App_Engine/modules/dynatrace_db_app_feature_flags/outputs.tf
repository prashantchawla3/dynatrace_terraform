output "feature_flag_ids" {
  value = [for r in dynatrace_db_app_feature_flags.feature_flags : r.id]
}