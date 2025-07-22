resource "dynatrace_web_app_auto_injection" "web_app_auto_injection" {
  count          = length(var.web_app_auto_injections)
  application_id = var.web_app_auto_injections[count.index].application_id

  dynamic "cache_control_headers" {
    for_each = var.web_app_auto_injections[count.index].cache_control_headers != null ? [var.web_app_auto_injections[count.index].cache_control_headers] : []
    content {
      cache_control_headers = cache_control_headers.value.cache_control_headers
    }
  }

  dynamic "monitoring_code_source_section" {
    for_each = var.web_app_auto_injections[count.index].monitoring_code_source_section != null ? [var.web_app_auto_injections[count.index].monitoring_code_source_section] : []
    content {
      code_source          = monitoring_code_source_section.value.code_source
      monitoring_code_path = monitoring_code_source_section.value.monitoring_code_path
    }
  }

  dynamic "snippet_format" {
    for_each = var.web_app_auto_injections[count.index].snippet_format != null ? [var.web_app_auto_injections[count.index].snippet_format] : []
    content {
      code_snippet_type = snippet_format.value.code_snippet_type
      snippet_format    = snippet_format.value.snippet_format
    }
  }
}
