variable "web_app_auto_injections" {
  description = "List of auto-injection settings per web application, including snippet format and header behavior."
  type = list(object({
    application_id = string
    cache_control_headers = optional(object({
      cache_control_headers = bool
    }))
    monitoring_code_source_section = optional(object({
      code_source          = string
      monitoring_code_path = string
    }))
    snippet_format = optional(object({
      code_snippet_type = string
      snippet_format    = string
    }))
  }))
  default = []
}

