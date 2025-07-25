variable "vmware_anomalies" {
  description = "Map of VMWare anomaly detection configurations keyed by rule name"
  type = map(object({
    dropped_packets_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        dropped_packets_per_second = number
      }))
    })

    esxi_high_cpu_detection = object({
      enabled = bool
    })

    esxi_high_memory_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        compression_decompression_rate = number
      }))
    })

    guest_cpu_limit_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        host_cpu_usage_percentage = number
        vm_cpu_ready_percentage   = number
        vm_cpu_usage_percentage   = number
      }))
    })

    low_datastore_space_detection = object({
      enabled = bool
    })

    overloaded_storage_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        command_aborts_number = number
      }))
    })

    slow_physical_storage_detection = object({
      enabled        = bool
      detection_mode = string
      custom_thresholds = optional(object({
        avg_read_write_latency  = number
        peak_read_write_latency = number
      }))
    })

    undersized_storage_detection = object({
      enabled = bool
    })
  }))
  default = {}
}
