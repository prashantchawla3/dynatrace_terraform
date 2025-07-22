resource "dynatrace_msentraid_connection" "this" {
  for_each = { for conn in var.msentraid_connections : conn.name => conn }
  name           = each.value.name
  application_id = each.value.application_id
  directory_id   = each.value.directory_id
  client_secret  = each.value.client_secret
  description    = each.value.description
}
