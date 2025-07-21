resource "dynatrace_rum_overload_prevention" "this" {
  for_each = var.rum_overload_prevention
  overload_prevention_limit = each.value.overload_prevention_limit
}
