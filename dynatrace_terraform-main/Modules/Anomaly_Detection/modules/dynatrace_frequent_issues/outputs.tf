output "frequent_issues_detect_apps" {
  description = "Whether application issues detection is enabled"
  value       = dynatrace_frequent_issues.this.detect_apps
}

output "frequent_issues_detect_txn" {
  description = "Whether transaction issues detection is enabled"
  value       = dynatrace_frequent_issues.this.detect_txn
}

output "frequent_issues_detect_infra" {
  description = "Whether infrastructure issues detection is enabled"
  value       = dynatrace_frequent_issues.this.detect_infra
}
