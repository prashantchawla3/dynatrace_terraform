resource "dynatrace_usability_analytics" "this" {
  for_each = var.usability_analytics
  detect_rage_clicks = each.value.detect_rage_clicks
  application_id     = lookup(each.value, "application_id", null)
}
