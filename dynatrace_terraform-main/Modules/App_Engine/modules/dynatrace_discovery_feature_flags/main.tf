resource "dynatrace_discovery_feature_flags" "discovery_flags" {
  count         = var.resource_count
  name          = var.resource_names[count.index]
  type          = var.type
  boolean_value = var.boolean_value
}