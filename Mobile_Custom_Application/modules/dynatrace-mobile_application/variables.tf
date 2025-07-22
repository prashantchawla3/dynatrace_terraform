variable "mobile_applications" {
  description = "Full configuration block for mobile application instrumentation."
  type = map(object({
    beacon_endpoint_type    = string
    beacon_endpoint_url     = string
    user_session_percentage = number
    apdex = object({
      frustrated          = number
      frustrated_on_error = bool
      tolerable           = number
    })
    properties = object({
      api_values = list(object({
        key                           = string
        name                          = string
        type                          = string
        aggregation                   = string
        display_name                  = string
        store_as_session_property     = optional(bool)
        store_as_user_action_property = optional(bool)
      }))
      request_attributes = list(object({
        type                          = string
        aggregation                   = string
        display_name                  = string
        id                            = string
        key                           = string
        store_as_session_property     = optional(bool)
        store_as_user_action_property = optional(bool)
      }))
    })
  }))
  default = {
    mobile_app = {
      beacon_endpoint_type    = "CLUSTER"
      beacon_endpoint_url     = "https://dynatrace.example.com/beacon"
      user_session_percentage = 100
      apdex = {
        frustrated          = 12000
        frustrated_on_error = true
        tolerable           = 3000
      }
      properties = {
        api_values = [
          {
            key                           = "region"
            name                          = "Region"
            type                          = "STRING"
            aggregation                   = "COUNT"
            display_name                  = "User Region"
            store_as_session_property     = true
            store_as_user_action_property = false
          }
        ]
        request_attributes = [
          {
            type                          = "STRING"
            aggregation                   = "SUM"
            display_name                  = "API Version"
            id                            = "api_version_id"
            key                           = "api_version"
            store_as_session_property     = true
            store_as_user_action_property = true
          }
        ]
      }
    }
  }
}
