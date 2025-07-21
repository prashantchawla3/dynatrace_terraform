resource "dynatrace_web_app_custom_config_properties" "custom_config_properties" {
  count           = length(var.custom_config_properties)
  application_id  = var.custom_config_properties[count.index].application_id
  custom_property = var.custom_config_properties[count.index].custom_property
}
