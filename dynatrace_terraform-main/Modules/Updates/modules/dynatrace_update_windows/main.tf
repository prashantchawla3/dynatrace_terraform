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
