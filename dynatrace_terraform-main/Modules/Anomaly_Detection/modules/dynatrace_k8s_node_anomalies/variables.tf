variable "k8s_node_anomalies" {
  description = "Configuration for Dynatrace node-level Kubernetes anomaly detectors, monitoring CPU, memory, pod saturation, and node conditions"
  type = object({
    scope = string

    cpu_requests_saturation = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    memory_requests_saturation = optional(object({
      enabled = bool
    }))

    pods_saturation = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    readiness_issues = optional(object({
      enabled = bool
    }))

    node_problematic_condition = optional(object({
      enabled = bool
    }))
  })
  default = {
    scope = "K8S_NODE_SCOPE_PLACEHOLDER"

    cpu_requests_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 10
        sample_period_in_minutes      = 5
        threshold                     = 90
      }
    }

    memory_requests_saturation = {
      enabled = false
    }

    pods_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 10
        sample_period_in_minutes      = 5
        threshold                     = 80
      }
    }

    readiness_issues = {
      enabled = true
    }

    node_problematic_condition = {
      enabled = true
    }
  }
}
