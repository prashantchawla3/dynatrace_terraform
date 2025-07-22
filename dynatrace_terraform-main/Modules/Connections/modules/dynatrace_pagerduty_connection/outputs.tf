output "pagerduty_connection_ids" {
  description = "IDs of PagerDuty connections"
  value       = { for k, conn in dynatrace_pagerduty_connection.this : k => conn.id }
}
