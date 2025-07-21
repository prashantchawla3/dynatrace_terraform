resource "dynatrace_rum_advanced_correlation" "this" {
  for_each = var.rum_advanced_correlation
  matcher  = each.value.matcher
  pattern  = each.value.pattern
}
