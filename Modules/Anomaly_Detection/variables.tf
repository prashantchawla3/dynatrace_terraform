# Variables for Dynatrace disk anomaly detection module

variable "disk_anomalies" {
  description = "List of configurations for dynatrace_disk_anomalies_v2 resources"
  type = list(object({
    # Unique name or identifier for this anomaly configuration (used to index resources)
    name                     = string
    enabled                  = bool
    # Optional base attribute (e.g., "auto" or "custom" detection mode)
    detection_mode           = optional(string)

    # Nested block for low inodes detection
    disk_low_inodes_detection = optional(object({
      enabled           = bool
      # Custom thresholds for free inodes percentage
      custom_thresholds = optional(list(object({
        free_inodes_percentage = number
        # Additional threshold parameters can be added here
      })))
    }))

    # Nested block for low disk space detection
    disk_low_space_detection = optional(object({
      enabled           = bool
      custom_thresholds = optional(list(object({
        free_disk_space_percentage = number
        # Additional threshold parameters can be added here
      })))
    }))

    # Alerts nested blocks (example: severity and threshold)
    alerts = optional(list(object({
      severity_level = string
      threshold      = number
      # Other alert options can be added here
    })))

    # Event properties to attach to triggered events
    event_properties = optional(list(object({
      key   = string
      value = string
    })))

    # Add other configurable options as needed
  }))
  default = []
}

variable "disk_anomaly_rules" {
  description = "List of configurations for dynatrace_disk_anomaly_rules resources"
  type = list(object({
    name       = string
    enabled    = bool

    # Example condition block for a rule
    condition = optional(object({
      property  = string
      operator  = string
      value     = number
    }))

    event_properties = optional(list(object({
      key   = string
      value = string
    })))

    alerts = optional(list(object({
      severity_level = string
      threshold      = number
      # Other alert options...
    })))
  }))
  default = []
}

variable "disk_edge_detectors" {
  description = "List of configurations for dynatrace_disk_edge_anomaly_detectors resources"
  type = list(object({
    name        = string
    enabled     = bool
    # Example additional properties
    metric_name = optional(string)
    threshold   = optional(number)

    event_properties = optional(list(object({
      key   = string
      value = string
    })))

    alerts = optional(list(object({
      severity_level = string
      threshold      = number
      # Other alert options...
    })))
  }))
  default = []
}

variable "disk_specific_anomalies" {
  description = "List of configurations for dynatrace_disk_specific_anomalies_v2 resources"
  type = list(object({
    name    = string
    enabled = bool

    # Nested block for low disk space detection
    disk_low_space_detection = optional(object({
      enabled = bool
      custom_thresholds = optional(list(object({
        free_disk_space_percentage = number
        # Other threshold parameters...
      })))
    }))

    # Nested block for low inodes detection
    disk_low_inodes_detection = optional(object({
      enabled = bool
      custom_thresholds = optional(list(object({
        free_inodes_percentage = number
        # Other threshold parameters...
      })))
    }))

    event_properties = optional(list(object({
      key   = string
      value = string
    })))

    alerts = optional(list(object({
      severity_level = string
      threshold      = number
      # Other alert options...
    })))
  }))
  default = []
}
