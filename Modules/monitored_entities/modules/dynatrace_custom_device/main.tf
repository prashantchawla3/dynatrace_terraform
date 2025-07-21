resource "dynatrace_custom_device" "custom_device" {
  custom_device_id = var.custom_device_id
  display_name     = var.display_name
  config_url       = var.config_url
  favicon_url      = var.favicon_url
  group            = var.group
  props            = var.props
  type             = var.type
  ui_based         = var.ui_based

  dns_names     = var.dns_names       # List of strings
  ip_addresses  = var.ip_addresses    # List of strings
  listen_ports  = var.listen_ports    # List of numbers or strings
}