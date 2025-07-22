resource "dynatrace_http_monitor_cookies" "cookie" {
  count   = length(var.http_monitor_cookies)
  enabled = var.http_monitor_cookies[count.index].enabled
  scope   = var.http_monitor_cookies[count.index].scope

  dynamic "cookies" {
    for_each = [var.http_monitor_cookies[count.index]]
    content {
      dynamic "cookie" {
        for_each = cookies.value.cookies
        content {
          name   = cookie.value.name
          domain = cookie.value.domain
          value  = cookie.value.value
        }
      }
    }
  }
}
