resource "dynatrace_cloud_foundry" "cloud_foundry" {
  for_each          = var.cloud_foundry
  enabled           = each.value.enabled
  active_gate_group = each.value.active_gate_group
  api_url           = each.value.api_url
  label             = each.value.label
  login_url         = each.value.login_url
  password          = each.value.password
  username          = each.value.username
}