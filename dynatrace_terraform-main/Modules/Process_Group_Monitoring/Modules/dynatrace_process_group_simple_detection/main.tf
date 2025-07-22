resource "dynatrace_process_group_simple_detection" "this" {
  for_each = var.pg_simple_detections

  enabled             = each.value.enabled
  group_identifier    = each.value.group_identifier
  instance_identifier = each.value.instance_identifier
  process_type        = each.value.process_type
  rule_type           = each.value.rule_type
}
