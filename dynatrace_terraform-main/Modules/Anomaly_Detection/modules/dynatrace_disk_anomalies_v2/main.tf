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