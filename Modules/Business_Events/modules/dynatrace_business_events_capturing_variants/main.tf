resource "dynatrace_business_events_capturing_variants" "this" {
  content_type_matcher = var.content_type_matcher
  content_type_value   = var.content_type_value
  parser               = var.parser
  scope                = var.scope
}