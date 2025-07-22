output "web_app_anomalies_ids" {
  description = "IDs of the created Web App anomaly resources"
  value       = [for k, v in dynatrace_web_app_anomalies.web_app : v.id]
}
