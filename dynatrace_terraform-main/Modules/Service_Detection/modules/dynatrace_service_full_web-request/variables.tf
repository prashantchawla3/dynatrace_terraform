variable "full_web_requests" {
  description = "Rules for full web requests with segment-based transformation and contributor mapping."
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
      application_id = object({
        enable_id_contributor = bool
        contribution_type     = string
        value_override        = string
      })
      context_root = object({
        enable_id_contributor = bool
        contribution_type     = string
        segment_count         = number
        transformations = list(object({
          transformation_type   = string
          include_hex_numbers   = bool
          min_digit_count       = number
        }))
      })
      server_name = object({
        enable_id_contributor = bool
        contribution_type     = string
      })
    })
  }))
  default = []
}
