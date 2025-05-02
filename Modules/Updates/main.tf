
resource "dynatrace_activegate_updates" "example" {
  auto_update = var.auto_update
  scope       = var.scope_activegate
}

resource "dynatrace_oneagent_updates" "example" {
  scope          = var.scope_oneagent
  target_version = var.target_version
  update_mode    = var.update_mode
}

resource "dynatrace_update_windows" "example" {
  name       = var.name
  enabled    = var.enabled
  recurrence = var.recurrence

  once_recurrence {
    recurrence_range {
      start = var.once_recurrence_start
      end   = var.once_recurrence_end
    }
  }
}
