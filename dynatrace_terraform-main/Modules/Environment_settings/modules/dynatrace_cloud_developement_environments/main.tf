resource "dynatrace_cloud_development_environments" "this" {
  for_each = {
    for r in var.cloud_development_resources : r.name => r
    if r.settings.cloud_development_environments != null
  }

  cloud_development_environments = each.value.settings.cloud_development_environments
}
