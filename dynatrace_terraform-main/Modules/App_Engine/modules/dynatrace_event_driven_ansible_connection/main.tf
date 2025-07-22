resource "dynatrace_event_driven_ansible_connections" "ansible_connections" {
  count = var.resource_count
  name  = var.resource_names[count.index]
  url   = var.url
  type  = var.type
  token = var.token
}