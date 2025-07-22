resource "dynatrace_os_services" "example" {
  count                     = length(var.os_services)
  name                      = var.os_services[count.index].name
  enabled                   = var.os_services[count.index].enabled
  alert_activation_duration = var.os_services[count.index].alert_activation_duration
  alerting                  = var.os_services[count.index].alerting
  monitoring                = var.os_services[count.index].monitoring
  not_installed_alerting    = var.os_services[count.index].not_installed_alerting
  scope                     = var.os_services[count.index].scope
  status_condition_linux    = var.os_services[count.index].status_condition_linux
  system                    = var.os_services[count.index].system

  detection_conditions_linux {
    linux_detection_condition {
      condition = var.os_services[count.index].condition
      property  = var.os_services[count.index].property
    }
  }

  metadata {
    item {
      metadata_key   = var.os_services[count.index].metadata_key
      metadata_value = var.os_services[count.index].metadata_value
    }
  }
}
