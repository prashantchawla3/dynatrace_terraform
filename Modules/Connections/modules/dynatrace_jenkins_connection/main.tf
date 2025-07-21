resource "dynatrace_jenkins_connection" "this" {
  for_each = { for conn in var.jenkins_connections : conn.name => conn }
  name     = each.value.name
  url      = each.value.url
  username = each.value.username
  password = each.value.password
}