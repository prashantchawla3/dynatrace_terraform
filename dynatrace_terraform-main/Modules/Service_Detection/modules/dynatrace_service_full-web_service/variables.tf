variable "full_web_services" {
  description = "Service classification rules derived from full web requests."
  type = list(object({
    name            = string
    enabled         = bool
    management_zone = string
    conditions      = list(object({
      attribute              = string
      compare_operation_type = string
      ignore_case            = bool
      text_values            = list(string)
    }))
    id_contributors = object({
      detect_as_web_request_service = bool
    })
  }))
  default = []
}