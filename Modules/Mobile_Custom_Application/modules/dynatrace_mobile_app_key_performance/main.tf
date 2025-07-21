resource "dynatrace_mobile_app_enablement" "this" {
  for_each = var.mobile_app_enablements

  rum {
    enabled                 = each.value.rum.enabled
    cost_and_traffic_control = each.value.rum.cost_and_traffic_control
  }

  session_replay {
    on_crash = each.value.session_replay.on_crash
  }
}
