resource "dynatrace_db_app_feature_flags" "feature_flags" {
  count        = var.db_app_feature_flag_count
  name         = var.db_app_feature_flag_names[count.index]
  type         = var.db_app_feature_flag_type
  string_value = var.db_app_feature_flag_names[count.index]
}
