resource "dynatrace_hub_extension_active_version" "this" {
  count = length(var.hub_extension_versions)

  name    = var.hub_extension_versions[count.index].name
  version = var.hub_extension_versions[count.index].version
}
