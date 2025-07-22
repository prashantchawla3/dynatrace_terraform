resource "dynatrace_github_connection" "this" {
  for_each = { for conn in var.github_connections : conn.name => conn }
  name  = each.value.name
  type  = each.value.type
  token = each.value.token
}