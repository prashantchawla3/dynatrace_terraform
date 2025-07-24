output "disk_monitoring_exclusions" {
  value = [
    for r in var.disk_options_resources : r.settings.disk_options.exclusions
  ]
}