resource "dynatrace_pg_alerting" "this" {
  for_each = var.pg_alertings

  enabled                    = each.value.enabled
  alerting_mode             = each.value.alerting_mode
  minimum_instance_threshold = each.value.minimum_instance_threshold
  process_group             = each.value.process_group
}