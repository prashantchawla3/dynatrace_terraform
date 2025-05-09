resource "dynatrace_disk_anomalies_v2" "this" {
  for_each = { for idx, conf in var.disk_anomalies : idx => conf }

  scope = each.value.scope

  dynamic "disk" {
    for_each = each.value.disk
    content {
      disk_low_space_detection {
        enabled = disk.value.disk_low_space_detection.enabled
      }
      disk_slow_writes_and_reads_detection {
        enabled = disk.value.disk_slow_writes_and_reads_detection.enabled
      }
      disk_low_inodes_detection {
        enabled = disk.value.disk_low_inodes_detection.enabled
      }
    }
  }
}


# dynatrace_disk_anomaly_rules resources (multiple instances via for_each)
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

# dynatrace_disk_edge_anomaly_detectors resources (multiple instances via for_each)
resource "dynatrace_disk_edge_anomaly_detectors" "this" {
  for_each = { for idx, conf in var.disk_edge_detectors : idx => conf }

  policy_name = each.value.policy_name
  enabled     = each.value.enabled

  event_properties {
    event_propertie {
      metadata_key   = each.value.event_properties.event_propertie.metadata_key
      metadata_value = each.value.event_properties.event_propertie.metadata_value
    }
  }

  alerts {
    alert {
      trigger = each.value.alerts.alert.trigger
      # Alert attributes
    }
  }
}

# dynatrace_disk_specific_anomalies_v2 resources (multiple instances via for_each)
resource "dynatrace_disk_specific_anomalies_v2" "this" {
  for_each = { for idx, conf in var.disk_specific_anomalies : idx => conf }

  disk_id                                  = each.value.disk_id
  override_disk_low_space_detection        = each.value.override_disk_low_space_detection
  override_low_inodes_detection            = each.value.override_low_inodes_detection
  override_slow_writes_and_reads_detection = each.value.override_slow_writes_and_reads_detection

  disk_low_space_detection {
    enabled = each.value.disk_low_space_detection.enabled
    # Attributes for disk_low_space_detection
  }

  disk_low_inodes_detection {
    enabled = each.value.disk_low_inodes_detection.enabled
    # Attributes for disk_low_inodes_detection
  }
}
