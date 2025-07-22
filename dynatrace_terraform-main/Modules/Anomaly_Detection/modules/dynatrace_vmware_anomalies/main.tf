resource "dynatrace_vmware_anomalies" "vmware" {
  for_each = var.vmware_anomalies

  dropped_packets_detection {
    enabled        = each.value.dropped_packets_detection.enabled
    detection_mode = each.value.dropped_packets_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.dropped_packets_detection.custom_thresholds != null ? [each.value.dropped_packets_detection.custom_thresholds] : []
      content {
        dropped_packets_per_second = custom_thresholds.value.dropped_packets_per_second
      }
    }
  }

  esxi_high_cpu_detection {
    enabled = each.value.esxi_high_cpu_detection.enabled
  }

  esxi_high_memory_detection {
    enabled        = each.value.esxi_high_memory_detection.enabled
    detection_mode = each.value.esxi_high_memory_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.esxi_high_memory_detection.custom_thresholds != null ? [each.value.esxi_high_memory_detection.custom_thresholds] : []
      content {
        compression_decompression_rate = custom_thresholds.value.compression_decompression_rate
      }
    }
  }

  guest_cpu_limit_detection {
    enabled        = each.value.guest_cpu_limit_detection.enabled
    detection_mode = each.value.guest_cpu_limit_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.guest_cpu_limit_detection.custom_thresholds != null ? [each.value.guest_cpu_limit_detection.custom_thresholds] : []
      content {
        host_cpu_usage_percentage = custom_thresholds.value.host_cpu_usage_percentage
        vm_cpu_ready_percentage   = custom_thresholds.value.vm_cpu_ready_percentage
        vm_cpu_usage_percentage   = custom_thresholds.value.vm_cpu_usage_percentage
      }
    }
  }

  low_datastore_space_detection {
    enabled = each.value.low_datastore_space_detection.enabled
  }

  overloaded_storage_detection {
    enabled        = each.value.overloaded_storage_detection.enabled
    detection_mode = each.value.overloaded_storage_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.overloaded_storage_detection.custom_thresholds != null ? [each.value.overloaded_storage_detection.custom_thresholds] : []
      content {
        command_aborts_number = custom_thresholds.value.command_aborts_number
      }
    }
  }

  slow_physical_storage_detection {
    enabled        = each.value.slow_physical_storage_detection.enabled
    detection_mode = each.value.slow_physical_storage_detection.detection_mode

    dynamic "custom_thresholds" {
      for_each = each.value.slow_physical_storage_detection.custom_thresholds != null ? [each.value.slow_physical_storage_detection.custom_thresholds] : []
      content {
        avg_read_write_latency  = custom_thresholds.value.avg_read_write_latency
        peak_read_write_latency = custom_thresholds.value.peak_read_write_latency
      }
    }
  }

  undersized_storage_detection {
    enabled = each.value.undersized_storage_detection.enabled
  }
}