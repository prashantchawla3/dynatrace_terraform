resource "dynatrace_limit_outbound_connections" "this" {
  for_each = {
    for r in var.outbound_connection_resources : r.name => r
    if r.settings.limit_outbound_connections != null
  }

  allowed_outbound_connections {
    enforced  = each.value.settings.limit_outbound_connections.allowed_outbound_connections.enforced
    host_list = each.value.settings.limit_outbound_connections.allowed_outbound_connections.host_list
  }
}
