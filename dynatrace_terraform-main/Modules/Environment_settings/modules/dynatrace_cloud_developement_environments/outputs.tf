output "cloud_development_environments" {
  value = [
    for r in var.resources : try(r.settings.cloud_development_environments, null)
    if r.type == "cloud_development_environments"
  ]
}
