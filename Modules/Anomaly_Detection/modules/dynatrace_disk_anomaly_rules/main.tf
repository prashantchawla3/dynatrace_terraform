resource "dynatrace_disk_anomaly_rules" "this" {
  for_each = { for idx, conf in var.disk_anomaly_rules : idx => conf }

  name    = each.value.name
  enabled = each.value.enabled
  metric  = each.value.metric

  disk_name_filter {
    operator = each.value.disk_name_filter.operator
    # Disk name filter attributes
  }

  sample_limit {
    samples           = each.value.sample_limit.samples
    violating_samples = each.value.sample_limit.violating_samples
    # Sample limit attributes
  }
}
