resource "dynatrace_api_detection" "example" {
  api_color       = var.api_color
  api_name        = var.api_name
  third_party_api = var.third_party_api
  technology      = var.technology

  dynamic "conditions" {
    for_each = [1]
    content {
      condition {
        base    = var.condition_base
        matcher = var.condition_matcher
        pattern = var.condition_pattern
      }
    }
  }
}
