resource "dynatrace_aix_extension" "example" {
  count                = length(var.aix_extensions)
  host_id              = var.aix_extensions[count.index].host_id
  use_global_settings  = var.aix_extensions[count.index].use_global_settings
  enabled              = var.aix_extensions[count.index].enabled
}
