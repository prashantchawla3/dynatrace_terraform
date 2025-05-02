
resource "dynatrace_custom_device" "custom_device" {
  custom_device_id = var.custom_device_id
  display_name     = var.display_name
  config_url       = var.config_url
  favicon_url      = var.favicon_url
  group            = var.group
  props            = var.props
  type             = var.type
  ui_based         = var.ui_based

  dynamic "dns_names" {
    for_each = var.dns_names
    content {
      value = dns_names.value
    }
  }

  dynamic "ip_addresses" {
    for_each = var.ip_addresses
    content {
      value = ip_addresses.value
    }
  }

  dynamic "listen_ports" {
    for_each = var.listen_ports
    content {
      value = listen_ports.value
    }
  }
}
