output "dynatrace_web_app_custom_config_properties_ids" {
  value = [for prop in dynatrace_web_app_custom_config_properties.custom_config_properties : prop.id]
}