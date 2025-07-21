resource "dynatrace_application_detection_rule" "this" {
  application_identifier = var.application_identifier

  dynamic "filter_config" {
    for_each = var.filter_config != null ? [var.filter_config] : []
    content {
      application_match_target = filter_config.value.application_match_target
      application_match_type   = filter_config.value.application_match_type
      pattern                  = filter_config.value.pattern
    }
  }

  name  = var.name
  order = var.order
}
