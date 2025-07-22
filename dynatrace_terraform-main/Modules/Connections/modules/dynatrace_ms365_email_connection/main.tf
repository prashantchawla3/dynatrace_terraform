resource "dynatrace_ms365_email_connection" "this" {
  for_each = { for conn in var.ms365_email_connections : conn.name => conn }
  name          = each.value.name
  client_id     = each.value.client_id
  tenant_id     = each.value.tenant_id
  from_address  = each.value.from_address
  type          = each.value.type
  client_secret = each.value.client_secret
}
