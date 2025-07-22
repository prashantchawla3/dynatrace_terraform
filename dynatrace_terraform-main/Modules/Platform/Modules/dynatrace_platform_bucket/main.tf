resource "dynatrace_platform_bucket" "this" {
  for_each = var.platform_buckets

  name         = each.key
  display_name = each.value.display_name
  retention    = each.value.retention
  table        = each.value.table
}
