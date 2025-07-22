resource "dynatrace_custom_service" "this" {
  count             = length(var.custom_services)
  name              = var.custom_services[count.index].name
  technology        = var.custom_services[count.index].technology
  enabled           = var.custom_services[count.index].enabled
  queue_entry_point = var.custom_services[count.index].queue_entry_point

  dynamic "rule" {
    for_each = var.custom_services[count.index].rules
    content {
      enabled = rule.value.enabled

      class {
        name  = rule.value.class_name
        match = rule.value.class_match
      }

      dynamic "method" {
        for_each = rule.value.methods
        content {
          name      = method.value.name
          arguments = lookup(method.value, "arguments", null)
          returns   = method.value.returns
        }
      }

      annotations = lookup(rule.value, "annotations", null)
    }
  }
}
