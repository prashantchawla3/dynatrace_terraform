resource "dynatrace_discovery_feature_flags" "discovery_flags" {
  count         = var.feature_flag_count
  name          = var.feature_flag_names[count.index]
  type          = var.feature_flag_type
  boolean_value = var.feature_flag_boolean_value
}
