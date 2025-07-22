resource "dynatrace_web_app_custom_injection" "web_app_custom_injection" {
  count          = length(var.web_app_custom_injections)
  application_id = var.web_app_custom_injections[count.index].application_id
  enabled        = var.web_app_custom_injections[count.index].enabled
  operator       = var.web_app_custom_injections[count.index].operator
  url_pattern    = var.web_app_custom_injections[count.index].url_pattern
  rule           = var.web_app_custom_injections[count.index].rule
  html_pattern   = var.web_app_custom_injections[count.index].html_pattern
  insert_after   = var.web_app_custom_injections[count.index].insert_after
}
