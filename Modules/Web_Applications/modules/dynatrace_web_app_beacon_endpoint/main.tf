resource "dynatrace_web_app_beacon_endpoint" "web_app_beacon_endpoint" {
  count          = length(var.web_app_beacon_endpoints)
  application_id = var.web_app_beacon_endpoints[count.index].application_id
  type           = var.web_app_beacon_endpoints[count.index].type
  url            = var.web_app_beacon_endpoints[count.index].url
  use_cors       = var.web_app_beacon_endpoints[count.index].use_cors
}
