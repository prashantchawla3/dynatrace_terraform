resource "dynatrace_managed_public_endpoints" "this" {
  web_ui_address              = var.public_endpoints_web_ui_address
  additional_web_ui_addresses = var.public_endpoints_additional_web_ui_addresses
  beacon_forwarder_address    = var.public_endpoints_beacon_forwarder_address
  cdn_address                 = var.public_endpoints_cdn_address
}
