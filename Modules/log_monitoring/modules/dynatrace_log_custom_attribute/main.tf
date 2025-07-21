resource "dynatrace_log_custom_attribute" "this" {
  for_each = var.resources["log_custom_attribute"]

  sidebar = each.value.sidebar
  key     = each.value.key
}
