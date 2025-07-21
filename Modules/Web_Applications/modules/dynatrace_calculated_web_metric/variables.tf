variable "calculated_web_metrics" {
  description = "List of calculated metrics based on user actions and dimensions for web applications."
  type = list(object({
    app_identifier = string
    enabled        = bool
    metric_key     = string
    name           = string
    dimensions = optional(object({
      dimension    = string
      property_key = string
      top_x        = number
    }))
    metric_definition = optional(object({
      metric       = string
      property_key = string
    }))
    user_action_filter = optional(object({
      continent                         = string
      target_view_group_name_match_type = string
      target_view_name_match_type       = string
    }))
  }))
  default = []
}
