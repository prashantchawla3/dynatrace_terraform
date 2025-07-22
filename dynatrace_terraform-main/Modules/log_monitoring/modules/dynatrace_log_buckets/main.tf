resource "dynatrace_log_buckets" "this" {
  for_each = var.resources["log_buckets"]

  enabled     = each.value.enabled
  bucket_name = each.value.bucket_name
  matcher     = each.value.matcher
  rule_name   = each.value.rule_name
}
