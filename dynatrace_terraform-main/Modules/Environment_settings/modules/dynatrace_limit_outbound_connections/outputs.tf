output "outbound_connection_settings" {
  value = [
    for r in var.outbound_connection_resources : {
      enforced  = r.settings.limit_outbound_connections.allowed_outbound_connections.enforced
      host_list = r.settings.limit_outbound_connections.allowed_outbound_connections.host_list
    }
  ]
}