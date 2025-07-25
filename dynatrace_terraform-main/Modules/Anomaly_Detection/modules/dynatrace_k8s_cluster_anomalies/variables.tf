variable "k8s_cluster_anomalies" {
  description = "Configuration for Dynatrace cluster-level anomaly detection across CPU, memory, pods, and monitoring readiness"
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
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    monitoring_issues = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
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
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))
  })
  default = {
    scope = "K8S_CLUSTER_SCOPE_PLACEHOLDER"

    cpu_requests_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 10
        sample_period_in_minutes      = 5
        threshold                     = 85
      }
    }

    memory_requests_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 10
        sample_period_in_minutes      = 5
        threshold                     = 90
      }
    }

    monitoring_issues = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 10
        sample_period_in_minutes      = 5
      }
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
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
      }
    }
  }
}
