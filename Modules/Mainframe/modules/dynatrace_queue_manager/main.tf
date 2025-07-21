resource "dynatrace_queue_manager" "queue_manager" {
  name     = var.queue_manager_name
  clusters = var.queue_manager_clusters

  dynamic "alias_queues" {
    for_each = var.alias_queues
    content {
      alias_queue {
        alias_queue_name   = alias_queues.value.alias_queue_name
        base_queue_name    = alias_queues.value.base_queue_name
        cluster_visibility = lookup(alias_queues.value, "cluster_visibility", null)
      }
    }
  }

  dynamic "remote_queues" {
    for_each = var.remote_queues
    content {
      remote_queue {
        local_queue_name     = remote_queues.value.local_queue_name
        remote_queue_name    = remote_queues.value.remote_queue_name
        remote_queue_manager = remote_queues.value.remote_queue_manager
        cluster_visibility   = lookup(remote_queues.value, "cluster_visibility", null)
      }
    }
  }

  dynamic "cluster_queues" {
    for_each = var.cluster_queues
    content {
      cluster_queue {
        local_queue_name   = cluster_queues.value.local_queue_name
        cluster_visibility = lookup(cluster_queues.value, "cluster_visibility", null)
      }
    }
  }
}