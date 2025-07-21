resource "dynatrace_mobile_application" "this" {
  for_each = var.mobile_applications

  name                  = each.key
  beacon_endpoint_type = each.value.beacon_endpoint_type
  beacon_endpoint_url  = each.value.beacon_endpoint_url
  user_session_percentage = each.value.user_session_percentage

  apdex {
    frustrated           = each.value.apdex.frustrated
    frustrated_on_error  = each.value.apdex.frustrated_on_error
    tolerable            = each.value.apdex.tolerable
  }

  properties {
    dynamic "api_value" {
      for_each = each.value.properties.api_values
      content {
        key                          = api_value.value.key
        name                         = api_value.value.name
        type                         = api_value.value.type
        aggregation                  = api_value.value.aggregation
        display_name                 = api_value.value.display_name
        store_as_session_property    = api_value.value.store_as_session_property
        store_as_user_action_property = api_value.value.store_as_user_action_property
      }
    }

    dynamic "request_attribute" {
      for_each = each.value.properties.request_attributes
      content {
        type                         = request_attribute.value.type
        aggregation                  = request_attribute.value.aggregation
        display_name                 = request_attribute.value.display_name
        id                           = request_attribute.value.id
        key                          = request_attribute.value.key
        store_as_session_property    = request_attribute.value.store_as_session_property
        store_as_user_action_property = request_attribute.value.store_as_user_action_property
      }
    }
  }
}
