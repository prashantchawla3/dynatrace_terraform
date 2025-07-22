resource "dynatrace_servicenow_connection" "this" {
  for_each = { for conn in var.servicenow_connections : conn.name => conn }
  name     = each.value.name
  url      = each.value.url
  type     = each.value.type
  user     = lookup(each.value, "user", null)
  password = lookup(each.value, "password", null)
}
