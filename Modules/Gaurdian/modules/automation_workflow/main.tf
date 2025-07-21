
resource "dynatrace_automation_workflow" "this" {
  title       = var.workflow_title
  description = var.workflow_description
  actor       = var.workflow_actor
  owner       = var.workflow_owner
  private     = true

  dynamic "tasks" {
    for_each = [1]
    content {
      dynamic "task" {
        for_each = var.workflow_tasks
        content {
          name        = task.value.name
          description = lookup(task.value, "description", null)
          action      = task.value.action
          active      = lookup(task.value, "active", true)
          input       = task.value.input
          position {
            x = task.value.position.x
            y = task.value.position.y
          }
        }
      }
    }
  }

  dynamic "trigger" {
    for_each = var.workflow_trigger != null ? [1] : []
    content {
      event {
        active = var.workflow_trigger.active
        config {
          event {
            event_type = var.workflow_trigger.event_type
            query      = var.workflow_trigger.query
          }
        }
      }
    }
  }
}