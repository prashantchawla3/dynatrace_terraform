variable "dashboards" {
  description = "List of Dynatrace dashboards to be created"
  type = list(object({
    name            = string
    description     = string
    dashboard_id    = string
    layout_type     = string
    sharing         = string
    management_zone = string # Added management zone
    widgets = list(object({
      name      = string
      type      = string
      size      = string
      position  = string
      settings  = map(string)
    }))
  }))
}

variable "dynatrace_api_url" {
  description = "Dynatrace API URL"
  type        = string
}

variable "dynatrace_api_token" {
  description = "Dynatrace API Token"
  type        = string
  sensitive   = true
}
