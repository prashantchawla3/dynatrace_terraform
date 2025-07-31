output "aws_service_ids" {
  description = "Map of AWS service names to their Dynatrace resource IDs"
  value = {
    for svc, res in dynatrace_aws_service.this :
    svc => res.id
  }
}

output "aws_service_names" {
  description = "List of AWS service names configured"
  value       = keys(dynatrace_aws_service.this)
}
