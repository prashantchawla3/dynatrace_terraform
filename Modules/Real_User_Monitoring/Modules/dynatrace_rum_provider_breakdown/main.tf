resource "dynatrace_rum_provider_breakdown" "this" {
  for_each = var.rum_provider_breakdown
  report_public_improvement = each.value.report_public_improvement
  resource_name             = each.value.resource_name
  resource_type             = each.value.resource_type

  dynamic "domain_name_pattern_list" {
    for_each = each.value.domain_name_pattern_list
    content {
      dynamic "domain_name_pattern" {
        for_each = domain_name_pattern_list.value.domain_name_pattern
        content {
          pattern = domain_name_pattern.value.pattern
        }
      }
    }
  }
}
