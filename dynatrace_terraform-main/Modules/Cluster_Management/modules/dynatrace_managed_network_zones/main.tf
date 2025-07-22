resource "dynatrace_managed_network_zones" "this" {
  name              = var.network_zone_name
  description       = var.network_zone_description
  alternative_zones = var.network_zone_alternative_zones
  fallback_mode     = var.network_zone_fallback_mode
}
