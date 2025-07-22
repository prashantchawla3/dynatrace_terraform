resource "dynatrace_problem_fields" "this" {
  for_each = var.problem_fields

  enabled        = each.value.enabled
  event_field    = each.value.event_field
  problem_field  = each.value.problem_field
}
