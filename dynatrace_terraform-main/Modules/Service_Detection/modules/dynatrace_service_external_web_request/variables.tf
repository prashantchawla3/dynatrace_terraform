variable "external_web_requests" {
  description = "Defines classification rules for external web requests including ID contributor logic."
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
      port_for_service_id = bool
      application_id = object({
        enable_id_contributor = bool
        contribution_type     = string
        value_override        = optional(string)
      })
      context_root = object({
        enable_id_contributor = bool
        contribution_type     = string
        value_override        = optional(string)
      })
      public_domain_name = object({
        enable_id_contributor = bool
        contribution_type     = string
        copy_from_host_name   = optional(bool)
        transformations       = optional(list(string))
      })
    })
  }))
  default = []
}
