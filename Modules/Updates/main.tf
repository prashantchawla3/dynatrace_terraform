
resource "dynatrace_activegate_updates" "this" {
  auto_update = var.auto_update
  scope       = var.scope_activegate
}

resource "dynatrace_oneagent_updates" "this" {
  scope          = var.scope_oneagent
  target_version = var.target_version
  update_mode    = var.update_mode
}

resource "dynatrace_update_windows" "this" {
  name       = var.name
  enabled    = var.enabled
  recurrence = var.recurrence

  dynamic "once_recurrence" {
    for_each = var.recurrence == "ONCE" ? [1] : []
    content {
      recurrence_range {
        start = var.once_recurrence_start
        end   = var.once_recurrence_end
      }
    }
  }
}
