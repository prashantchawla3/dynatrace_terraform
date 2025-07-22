resource "dynatrace_gitlab_connection" "this" {
  for_each = { for conn in var.gitlab_connections : conn.name => conn }
  name  = each.value.name
  url   = each.value.url
  token = each.value.token
}