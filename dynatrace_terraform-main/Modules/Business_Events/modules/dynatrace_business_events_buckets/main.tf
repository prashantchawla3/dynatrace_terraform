resource "dynatrace_business_events_buckets" "this" {
  enabled     = var.buckets_enabled
  bucket_name = var.bucket_name
  matcher     = var.buckets_matcher
  rule_name   = var.rule_name
}