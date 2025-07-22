output "dynatrace_web_app_beacon_endpoint_ids" {
  value = [for endpoint in dynatrace_web_app_beacon_endpoint.web_app_beacon_endpoint : endpoint.id]
}
