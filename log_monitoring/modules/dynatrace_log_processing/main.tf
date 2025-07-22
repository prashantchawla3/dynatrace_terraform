resource "dynatrace_log_processing" "this" {
  for_each = var.resources["log_processing"]

  enabled   = each.value.enabled
  query     = each.value.query
  rule_name = each.value.rule_name

  processor_definition {
    rule = each.value.processor_definition.rule
  }

  rule_testing {
    sample_log = each.value.rule_testing.sample_log
  }
}