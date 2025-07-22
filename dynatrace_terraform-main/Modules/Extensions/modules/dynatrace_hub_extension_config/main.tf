resource "dynatrace_hub_extension_config" "this" {
  count = length(var.hub_extension_configs)

  name  = var.hub_extension_configs[count.index].name
  value = jsonencode({
    enabled     = var.hub_extension_configs[count.index].enabled
    description = var.hub_extension_configs[count.index].description
    version     = var.hub_extension_configs[count.index].version
    featureSets = var.hub_extension_configs[count.index].featureSets
  })
}
