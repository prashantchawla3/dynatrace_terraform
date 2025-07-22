variable "external_web_services" {
  description = "External service detection with nested condition logic and service ID contributor mapping."
  type = map(object({
    name             = string
    description      = string
    enabled          = bool
    management_zones = list(string)
    conditions       = list(object({
      condition = list(object({
        attribute              = string
        compare_operation_type = string
        ignore_case            = bool
        text_values            = list(string)
      }))
    }))
    id_contributors = object({
      detect_as_web_request_service = bool
      port_for_service_id           = bool
      url_path = object({
        enable_id_contributor = bool
        service_id_contributor = object({
          contribution_type = string
          value_override = object({
            value = string
          })
        })
      })
    })
  }))
  default = {}
}
