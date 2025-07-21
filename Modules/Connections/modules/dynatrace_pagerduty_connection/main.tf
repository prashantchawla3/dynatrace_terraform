resource "dynatrace_pagerduty_connection" "this" {
  for_each = { for conn in var.pagerduty_connections : conn.name => conn }
  name  = each.value.name
  token = each.value.token
  url   = each.value.url
}
