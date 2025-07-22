resource "dynatrace_problem_record_propagation_rules" "this" {
  for_each = var.problem_propagation_rules

  enabled               = each.value.enabled
  source_attribute_key  = each.value.source_attribute_key
  target_attribute_key  = each.value.target_attribute_key
}
