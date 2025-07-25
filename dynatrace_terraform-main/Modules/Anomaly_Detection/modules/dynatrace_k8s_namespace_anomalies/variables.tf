variable "k8s_namespace_anomalies" {
  description = "Configuration for Dynatrace namespace-level Kubernetes anomaly detection based on resource quota saturation thresholds"
  type = object({
    scope = string

    cpu_limits_quota_saturation = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    cpu_requests_quota_saturation = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    memory_limits_quota_saturation = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    memory_requests_quota_saturation = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    pods_quota_saturation = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
  })
  default = {
    scope = "K8S_NAMESPACE_SCOPE_PLACEHOLDER"

    cpu_limits_quota_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 90
      }
    }

    cpu_requests_quota_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 85
      }
    }

    memory_limits_quota_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 90
      }
    }

    memory_requests_quota_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 80
      }
    }

    pods_quota_saturation = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 80
      }
    }
  }
}
