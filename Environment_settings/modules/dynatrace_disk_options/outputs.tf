output "disk_exclusions" {
  value = [
    for r in var.resources : try(r.settings.disk_options.exclusions, null)
    if r.type == "disk_options"
  ]
}