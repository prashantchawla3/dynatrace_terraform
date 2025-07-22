output "dynatrace_web_app_beacon_origins_ids" {
  value = [for origin in dynatrace_web_app_beacon_origins.web_app_beacon_origins : origin.id]
}
