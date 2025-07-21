
# ─── Custom Device Attributes ─────────────────────────────
module "custom_device_id" {
  source           = "./modules/dynatrace_custom_device"
  custom_device_id = var.custom_device_id
}

module "display_name" {
  source       = "./modules/dynatrace_custom_device"
  display_name = var.display_name
}

module "config_url" {
  source     = "./modules/dynatrace_custom_device"
  config_url = var.config_url
}

module "dns_names" {
  source     = "./modules/dynatrace_custom_device"
  dns_names  = var.dns_names
}

module "favicon_url" {
  source       = "./modules/dynatrace_custom_device"
  favicon_url  = var.favicon_url
}

module "group" {
  source  = "./modules/dynatrace_custom_device
  group   = var.group
}

module "ip_addresses" {
  source       = "./modules/dynatrace_custom_device"
  ip_addresses = var.ip_addresses
}

module "listen_ports" {
  source      = "./modules/dynatrace_custom_device"
  listen_ports = var.listen_ports
}

module "props" {
  source  = "./modules/dynatrace_custom_device"
  props   = var.props
}

module "type" {
  source = "./modules/dynatrace_custom_device"
  type   = var.type
}

module "ui_based" {
  source   = "./modules/dynatrace_custom_device"
  ui_based = var.ui_based
}
