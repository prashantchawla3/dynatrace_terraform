
output "cloud_development_urls" {
  value = [
    for r in var.cloud_development_resources : r.settings.cloud_development_environments
  ]
}