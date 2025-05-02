# Implementation of Dynatrace disk anomaly detection resources using dynamic blocks

# dynatrace_disk_anomalies_v2 resources (multiple instances via for_each)
resource "dynatrace_disk_anomalies_v2" "this" {
  for_each = { for idx, conf in var.disk_anomalies : idx => conf }

  # Example base attributes (replace with actual attributes from provider docs)
  name           = each.value.name
  enabled        = each.value.enabled
  detection_mode = lookup(each.value, "detection_mode", null)

  # Nested block for low inodes detection
  dynamic "disk_low_inodes_detection" {
    for_each = each.value.disk_low_inodes_detection != null ? [each.value.disk_low_inodes_detection] : []
    content {
      enabled = disk_low_inodes_detection.value.enabled

      # Nested custom_thresholds block inside inodes detection
      dynamic "custom_thresholds" {
        for_each = lookup(disk_low_inodes_detection.value, "custom_thresholds", [])
        content {
          free_inodes_percentage = custom_thresholds.value.free_inodes_percentage
        }
      }
    }
  }

  # Nested block for low disk space detection
  dynamic "disk_low_space_detection" {
    for_each = each.value.disk_low_space_detection != null ? [each.value.disk_low_space_detection] : []
    content {
      enabled = disk_low_space_detection.value.enabled

      dynamic "custom_thresholds" {
        for_each = lookup(disk_low_space_detection.value, "custom_thresholds", [])
        content {
          free_disk_space_percentage = custom_thresholds.value.free_disk_space_percentage
        }
      }
    }
  }

  # Alerts nested blocks (if any)
  dynamic "alerts" {
    for_each = lookup(each.value, "alerts", [])
    content {
      severity_level = alerts.value.severity_level
      threshold      = alerts.value.threshold
    }
  }

  # Event properties nested blocks (if any)
  dynamic "event_properties" {
    for_each = lookup(each.value, "event_properties", [])
    content {
      key   = event_properties.value.key
      value = event_properties.value.value
    }
  }
}

# dynatrace_disk_anomaly_rules resources (multiple instances via for_each)
resource "dynatrace_disk_anomaly_rules" "this" {
  for_each = { for idx, conf in var.disk_anomaly_rules : idx => conf }

  name    = each.value.name
  enabled = each.value.enabled

  # Condition nested block (example)
  dynamic "condition" {
    for_each = lookup(each.value, "condition", []) != null ? [each.value.condition] : []
    content {
      property = condition.value.property
      operator = condition.value.operator
      value    = condition.value.value
    }
  }

  # Event properties nested blocks (if any)
  dynamic "event_properties" {
    for_each = lookup(each.value, "event_properties", [])
    content {
      key   = event_properties.value.key
      value = event_properties.value.value
    }
  }

  # Alerts nested blocks (if any)
  dynamic "alerts" {
    for_each = lookup(each.value, "alerts", [])
    content {
      severity_level = alerts.value.severity_level
      threshold      = alerts.value.threshold
    }
  }
}

# dynatrace_disk_edge_anomaly_detectors resources (multiple instances via for_each)
resource "dynatrace_disk_edge_anomaly_detectors" "this" {
  for_each = { for idx, conf in var.disk_edge_detectors : idx => conf }

  name        = each.value.name
  enabled     = each.value.enabled
  metric_name = lookup(each.value, "metric_name", null)
  threshold   = lookup(each.value, "threshold", null)

  # Event properties nested blocks (if any)
  dynamic "event_properties" {
    for_each = lookup(each.value, "event_properties", [])
    content {
      key   = event_properties.value.key
      value = event_properties.value.value
    }
  }

  # Alerts nested blocks (if any)
  dynamic "alerts" {
    for_each = lookup(each.value, "alerts", [])
    content {
      severity_level = alerts.value.severity_level
      threshold      = alerts.value.threshold
    }
  }
}

# dynatrace_disk_specific_anomalies_v2 resources (multiple instances via for_each)
resource "dynatrace_disk_specific_anomalies_v2" "this" {
  for_each = { for idx, conf in var.disk_specific_anomalies : idx => conf }

  name    = each.value.name
  enabled = each.value.enabled

  # Nested block for low disk space detection
  dynamic "disk_low_space_detection" {
    for_each = each.value.disk_low_space_detection != null ? [each.value.disk_low_space_detection] : []
    content {
      enabled = disk_low_space_detection.value.enabled

      dynamic "custom_thresholds" {
        for_each = lookup(disk_low_space_detection.value, "custom_thresholds", [])
        content {
          free_disk_space_percentage = custom_thresholds.value.free_disk_space_percentage
        }
      }
    }
  }

  # Nested block for low inodes detection
  dynamic "disk_low_inodes_detection" {
    for_each = each.value.disk_low_inodes_detection != null ? [each.value.disk_low_inodes_detection] : []
    content {
      enabled = disk_low_inodes_detection.value.enabled

      dynamic "custom_thresholds" {
        for_each = lookup(disk_low_inodes_detection.value, "custom_thresholds", [])
        content {
          free_inodes_percentage = custom_thresholds.value.free_inodes_percentage
        }
      }
    }
  }

  # Event properties nested blocks (if any)
  dynamic "event_properties" {
    for_each = lookup(each.value, "event_properties", [])
    content {
      key   = event_properties.value.key
      value = event_properties.value.value
    }
  }

  # Alerts nested blocks (if any)
  dynamic "alerts" {
    for_each = lookup(each.value, "alerts", [])
    content {
      severity_level = alerts.value.severity_level
      threshold      = alerts.value.threshold
    }
  }
}
