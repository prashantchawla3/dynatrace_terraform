resource "dynatrace_application_detection_rule_v2" "app_detection_rule" {
  for_each       = { for rule in var.app_detection_rules : rule.id => rule }
  application_id = each.value.application_id
  matcher        = each.value.matcher
  pattern        = each.value.pattern
}
