resource "dynatrace_generic_setting" "this" {
  for_each = var.generic_settings

  schema = each.value.schema
  scope  = each.value.scope
  value  = jsonencode(each.value.value)
}

resource "dynatrace_grail_metrics_allowall" "this" {
  for_each = var.grail_allowall
  allow_all = each.value.allow_all
}

resource "dynatrace_grail_metrics_allowlist" "this" {
  for_each = var.grail_allowlist

  allow_rules {
    dynamic "allow_rule" {
      for_each = each.value.allow_rules
      content {
        enabled    = allow_rule.value.enabled
        metric_key = allow_rule.value.metric_key
        pattern    = allow_rule.value.pattern
      }
    }
  }
}

resource "dynatrace_platform_bucket" "this" {
  for_each = var.platform_buckets

  name         = each.key
  display_name = each.value.display_name
  retention    = each.value.retention
  table        = each.value.table
}

resource "dynatrace_problem_fields" "this" {
  for_each = var.problem_fields

  enabled        = each.value.enabled
  event_field    = each.value.event_field
  problem_field  = each.value.problem_field
}

resource "dynatrace_problem_record_propagation_rules" "this" {
  for_each = var.problem_propagation_rules

  enabled               = each.value.enabled
  source_attribute_key  = each.value.source_attribute_key
  target_attribute_key  = each.value.target_attribute_key
}

resource "dynatrace_security_context" "this" {
  for_each = var.security_contexts

  enabled = each.value.enabled
}
