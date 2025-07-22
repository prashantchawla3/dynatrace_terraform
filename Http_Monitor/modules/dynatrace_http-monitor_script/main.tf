resource "dynatrace_http_monitor_script" "script" {
  count   = length(var.scripts)
  http_id = var.scripts[count.index].http_id

  dynamic "script" {
    for_each = try([var.scripts[count.index]], [])
    content {
      dynamic "request" {
        for_each = can(script.value) && script.value != null && can(script.value.requests) && script.value.requests != null ? script.value.requests : []
        content {
          description     = request.value.description
          method          = request.value.method
          url             = request.value.url
          post_processing = try(request.value.post_processing, null)

          dynamic "configuration" {
            for_each = try([request.value.configuration], [])
            content {
              accept_any_certificate = configuration.value.accept_any_certificate
              follow_redirects       = try(configuration.value.follow_redirects, null)

              dynamic "headers" {
                for_each = can(configuration.value.headers) && configuration.value.headers != null ? [configuration.value.headers] : []
                content {
                  dynamic "header" {
                    for_each = configuration.value.headers
                    content {
                      name  = header.value.name
                      value = header.value.value
                    }
                  }
                }
              }
            }
          }

          dynamic "validation" {
            for_each = can(request.value.validation) && request.value.validation != null ? [request.value.validation] : []
            content {
              dynamic "rule" {
                for_each = can(request.value.validation.rules) && request.value.validation.rules != null ? request.value.validation.rules : []
                content {
                  type  = rule.value.type
                  value = rule.value.value
                }
              }
            }
          }
        }
      }
    }
  }
}
