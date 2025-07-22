resource "dynatrace_web_app_custom_prop_restrictions" "this" {
  application_id = var.application_id

  dynamic "custom_event_properties_allow_list" {
    for_each = var.custom_event_properties_allow_list
    content {
      dynamic "custom_session_properties_allow" {
        for_each = custom_event_properties_allow_list.value
        content {
          field_data_type = custom_session_properties_allow.value.field_data_type
          field_name      = custom_session_properties_allow.value.field_name
        }
      }
    }
  }

  dynamic "custom_session_properties_allow_list" {
    for_each = var.custom_session_properties_allow_list
    content {
      dynamic "custom_session_properties_allow" {
        for_each = custom_session_properties_allow_list.value
        content {
          field_data_type = custom_session_properties_allow.value.field_data_type
          field_name      = custom_session_properties_allow.value.field_name
        }
      }
    }
  }
}
