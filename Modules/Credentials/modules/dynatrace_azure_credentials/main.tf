resource "dynatrace_azure_credentials" "this" {
  active                        = var.azure_active
  app_id                        = var.azure_app_id
  auto_tagging                  = var.azure_auto_tagging
  directory_id                  = var.azure_directory_id
  label                         = var.azure_label
  key                           = var.azure_key
  monitor_only_tagged_entities = var.azure_monitor_only_tagged_entities
  remove_defaults               = var.azure_remove_defaults

  dynamic "monitor_only_tag_pairs" {
    for_each = var.azure_monitor_only_tag_pairs
    content {
      name  = monitor_only_tag_pairs.value.name
      value = monitor_only_tag_pairs.value.value
    }
  }
}
