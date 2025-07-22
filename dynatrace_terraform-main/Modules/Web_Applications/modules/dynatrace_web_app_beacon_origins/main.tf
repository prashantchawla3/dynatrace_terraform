resource "dynatrace_web_app_beacon_origins" "web_app_beacon_origins" {
  count   = length(var.web_app_beacon_origins)
  matcher = var.web_app_beacon_origins[count.index].matcher
  pattern = var.web_app_beacon_origins[count.index].pattern
}
