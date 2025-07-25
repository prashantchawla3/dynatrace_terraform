variable "k8s_workload_anomalies" {
  description = "Configuration object for detecting anomalies in Kubernetes workloads, including pod status, resource usage, and workload behavior"
  type = object({
    scope = string

    container_restarts = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    deployment_stuck = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    not_all_pods_ready = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    pending_pods = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    pod_stuck_in_terminating = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    workload_without_ready_pods = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
      })
    }))

    high_cpu_throttling = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    high_cpu_usage = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    high_memory_usage = optional(object({
      enabled      = bool
      configuration = object({
        observation_period_in_minutes = number
        sample_period_in_minutes      = number
        threshold                     = number
      })
    }))

    job_failure_events = optional(object({
      enabled = bool
    }))

    oom_kills = optional(object({
      enabled = bool
    }))

    pod_backoff_events = optional(object({
      enabled = bool
    }))

    pod_eviction_events = optional(object({
      enabled = bool
    }))

    pod_preemption_events = optional(object({
      enabled = bool
    }))
  })
  default = {
    scope = "K8S_WORKLOAD_SCOPE_PLACEHOLDER"

    container_restarts = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 15
        sample_period_in_minutes      = 5
        threshold                     = 3
      }
    }

    high_cpu_usage = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 10
        sample_period_in_minutes      = 5
        threshold                     = 90
      }
    }

    high_memory_usage = {
      enabled = true
      configuration = {
        observation_period_in_minutes = 10
        sample_period_in_minutes      = 5
        threshold                     = 85
      }
    }

    job_failure_events = {
      enabled = false
    }

    oom_kills = {
      enabled = false
    }

    pod_backoff_events = {
      enabled = false
    }

    pod_eviction_events = {
      enabled = false
    }

    pod_preemption_events = {
      enabled = false
    }
  }
}
