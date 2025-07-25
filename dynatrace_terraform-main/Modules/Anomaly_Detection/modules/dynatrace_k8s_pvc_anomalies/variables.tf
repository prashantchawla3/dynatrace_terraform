variable "k8s_pvc_anomalies" {
  description = "Configuration for Dynatrace PVC anomaly detection within Kubernetes workloads, focused on disk usage thresholds"
  type = object({
    scope = string

    low_disk_space_critical = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    low_disk_space_critical_percentage = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))
  })
  default = {
    scope = "K8S_PVC_SCOPE_PLACEHOLDER"

    low_disk_space_critical = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 500 # in MiB
      }
    }

    low_disk_space_critical_percentage = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 10 # percent remaining
      }
    }
  }
}
