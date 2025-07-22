resource "dynatrace_k8s_workload_anomalies" "this" {
  scope = var.k8s_workload_anomalies.scope

  dynamic "container_restarts" {
    for_each = var.k8s_workload_anomalies.container_restarts != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.container_restarts.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.container_restarts.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.container_restarts.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.container_restarts.configuration.threshold
      }
    }
  }

  dynamic "deployment_stuck" {
    for_each = var.k8s_workload_anomalies.deployment_stuck != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.deployment_stuck.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.deployment_stuck.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.deployment_stuck.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "not_all_pods_ready" {
    for_each = var.k8s_workload_anomalies.not_all_pods_ready != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.not_all_pods_ready.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.not_all_pods_ready.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.not_all_pods_ready.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "pending_pods" {
    for_each = var.k8s_workload_anomalies.pending_pods != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pending_pods.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.pending_pods.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.pending_pods.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.pending_pods.configuration.threshold
      }
    }
  }

  dynamic "pod_stuck_in_terminating" {
    for_each = var.k8s_workload_anomalies.pod_stuck_in_terminating != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_stuck_in_terminating.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.pod_stuck_in_terminating.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.pod_stuck_in_terminating.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "workload_without_ready_pods" {
    for_each = var.k8s_workload_anomalies.workload_without_ready_pods != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.workload_without_ready_pods.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.workload_without_ready_pods.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.workload_without_ready_pods.configuration.sample_period_in_minutes
      }
    }
  }

  dynamic "high_cpu_throttling" {
    for_each = var.k8s_workload_anomalies.high_cpu_throttling != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.high_cpu_throttling.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.high_cpu_throttling.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.high_cpu_throttling.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.high_cpu_throttling.configuration.threshold
      }
    }
  }

  dynamic "high_cpu_usage" {
    for_each = var.k8s_workload_anomalies.high_cpu_usage != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.high_cpu_usage.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.high_cpu_usage.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.high_cpu_usage.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.high_cpu_usage.configuration.threshold
      }
    }
  }

  dynamic "high_memory_usage" {
    for_each = var.k8s_workload_anomalies.high_memory_usage != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.high_memory_usage.enabled
      configuration {
        observation_period_in_minutes = var.k8s_workload_anomalies.high_memory_usage.configuration.observation_period_in_minutes
        sample_period_in_minutes      = var.k8s_workload_anomalies.high_memory_usage.configuration.sample_period_in_minutes
        threshold                     = var.k8s_workload_anomalies.high_memory_usage.configuration.threshold
      }
    }
  }

  dynamic "job_failure_events" {
    for_each = var.k8s_workload_anomalies.job_failure_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.job_failure_events.enabled
    }
  }

  dynamic "oom_kills" {
    for_each = var.k8s_workload_anomalies.oom_kills != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.oom_kills.enabled
    }
  }

  dynamic "pod_backoff_events" {
    for_each = var.k8s_workload_anomalies.pod_backoff_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_backoff_events.enabled
    }
  }

  dynamic "pod_eviction_events" {
    for_each = var.k8s_workload_anomalies.pod_eviction_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_eviction_events.enabled
    }
  }

  dynamic "pod_preemption_events" {
    for_each = var.k8s_workload_anomalies.pod_preemption_events != null ? [1] : []
    content {
      enabled = var.k8s_workload_anomalies.pod_preemption_events.enabled
    }
  }
}