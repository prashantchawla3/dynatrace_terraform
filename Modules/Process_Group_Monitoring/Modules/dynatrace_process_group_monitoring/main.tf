resource "dynatrace_process_group_monitoring" "this" {
  for_each = var.pg_monitorings

  monitoring_state = each.value.monitoring_state
  process_group_id = each.value.process_group_id
}