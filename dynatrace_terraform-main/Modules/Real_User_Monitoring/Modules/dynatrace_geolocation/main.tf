resource "dynatrace_geolocation" "this" {
  for_each = var.geolocation
  display_worldmap = each.value.display_worldmap
  scope            = each.value.scope
}