resource "dynatrace_web_app_resource_types" "this" {
  primary_resource_type = var.primary_resource_type
  regular_expression    = var.regular_expression
  secondary_resource_type = var.secondary_resource_type
  insert_after            = var.insert_after
}
