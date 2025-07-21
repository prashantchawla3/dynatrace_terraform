variable "web_app_custom_injections" {
  description = "Custom HTML injection rules for web monitoring instrumentation."
  type = list(object({
    application_id = string
    enabled        = bool
    operator       = string
    url_pattern    = string
    rule           = string
    html_pattern   = string
    insert_after   = string
  }))
  default = []
}
