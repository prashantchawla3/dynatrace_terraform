resource "dynatrace_kubernetes" "kubernetes" {
  for_each = var.kubernetes
  enabled                        = each.value.enabled
  cluster_id                     = each.value.cluster_id
  cluster_id_enabled             = each.value.cluster_id_enabled
  label                          = each.value.label
  scope                          = each.value.scope
  active_gate_group              = each.value.active_gate_group
  auth_token                     = each.value.auth_token
  certificate_check_enabled      = each.value.certificate_check_enabled
  endpoint_url                   = each.value.endpoint_url
  hostname_verification_enabled = each.value.hostname_verification_enabled
}