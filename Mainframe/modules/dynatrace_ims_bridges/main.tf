resource "dynatrace_ims_bridges" "ims_bridges" {
  name = var.ims_bridge_name

  dynamic "queue_managers" {
    for_each = var.ims_queue_managers
    content {
      queue_manager {
        name               = queue_managers.value.name
        queue_manager_queue = lookup(queue_managers.value, "queue_manager_queue", null)
      }
    }
  }
}
