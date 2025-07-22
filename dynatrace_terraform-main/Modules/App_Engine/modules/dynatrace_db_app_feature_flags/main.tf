resource "dynatrace_db_app_feature_flags" "feature_flags" {
  count        = var.resource_count
  name         = var.resource_names[count.index]
  type         = var.type
  string_value = var.resource_names[count.index]
}
