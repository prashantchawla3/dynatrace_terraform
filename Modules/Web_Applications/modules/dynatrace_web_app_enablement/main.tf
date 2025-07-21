resource "dynatrace_web_app_enablement" "web_app_enablement" {
  count          = length(var.web_app_enablements)
  application_id = var.web_app_enablements[count.index].application_id

  dynamic "rum" {
    for_each = var.web_app_enablements[count.index].rum != null ? [var.web_app_enablements[count.index].rum] : []
    content {
      enabled                  = rum.value.enabled
      cost_and_traffic_control = rum.value.cost_and_traffic_control
      enabled_on_grail         = rum.value.enabled_on_grail
    }
  }

  dynamic "session_replay" {
    for_each = var.web_app_enablements[count.index].session_replay != null ? [var.web_app_enablements[count.index].session_replay] : []
    content {
      enabled                  = session_replay.value.enabled
      cost_and_traffic_control = session_replay.value.cost_and_traffic_control
    }
  }
}
