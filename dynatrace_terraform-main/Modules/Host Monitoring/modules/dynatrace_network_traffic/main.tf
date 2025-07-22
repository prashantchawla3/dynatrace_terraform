resource "dynatrace_network_traffic" "example" {
  count   = length(var.network_traffic)
  host_id = var.network_traffic[count.index].host_id

  exclude_ip {
    ip_address_form {
      ip_address = var.network_traffic[count.index].ip_address
    }
  }

  exclude_nic {
    nic_form {
      interface = var.network_traffic[count.index].interface
      os        = var.network_traffic[count.index].os
    }
  }
}
