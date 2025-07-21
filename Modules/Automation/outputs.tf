output "calendar_id" {
  value       = dynatrace_automation_business_calendar.calendar.id
  description = "The ID of the created business calendar"
}

output "rule_id" {
  value       = dynatrace_automation_scheduling_rule.rule.id
  description = "The ID of the created scheduling rule"
}
