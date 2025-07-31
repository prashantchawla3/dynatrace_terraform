output "business_events_bucket_id" {
  description = "The ID of the Business Events bucket"
  value       = dynatrace_business_events_buckets.this.id
}

output "business_events_bucket_name" {
  description = "The name of the Business Events bucket"
  value       = dynatrace_business_events_buckets.this.bucket_name
}

output "business_events_bucket_enabled" {
  description = "Whether the Business Events bucket is enabled"
  value       = dynatrace_business_events_buckets.this.enabled
}

output "business_events_bucket_rule_name" {
  description = "The rule name associated with the Business Events bucket"
  value       = dynatrace_business_events_buckets.this.rule_name
}

output "business_events_bucket_matcher" {
  description = "The matcher used for the Business Events bucket"
  value       = dynatrace_business_events_buckets.this.matcher
}
