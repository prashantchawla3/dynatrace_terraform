module "custom_device" {
  source = "./modules/dynatrace_custom_device"

  custom_device_id       = var.custom_device_id
  display_name           = var.display_name
  config_url             = var.config_url
  dns_names              = var.dns_names
  favicon_url            = var.favicon_url
  group                  = var.group
  ip_addresses           = var.ip_addresses
  listen_ports           = var.listen_ports
  props                  = var.props
  type                   = var.type
  ui_based               = var.ui_based
}
