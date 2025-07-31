resource "dynatrace_event_driven_ansible_connections" "ansible_connections" {
  count = var.ansible_connection_count
  name  = var.ansible_connection_names[count.index]
  url   = var.ansible_connection_url
  type  = var.ansible_connection_type
  token = var.ansible_connection_token
}
