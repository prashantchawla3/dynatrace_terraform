resource "dynatrace_msteams_connection" "this" {
  for_each = { for conn in var.msteams_connections : conn.name => conn }
  name         = each.value.name
  webhook      = each.value.webhook
  team_name    = lookup(each.value, "team_name", null)
  channel_name = lookup(each.value, "channel_name", null)
}
