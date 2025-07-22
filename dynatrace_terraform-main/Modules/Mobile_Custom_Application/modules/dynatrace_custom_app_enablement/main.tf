resource "dynatrace_custom_app_enablement" "this" {
  for_each = var.custom_app_enablements

  scope = each.value.scope

  rum {
    enabled                 = each.value.rum.enabled
    cost_and_traffic_control = each.value.rum.cost_and_traffic_control
  }
}
