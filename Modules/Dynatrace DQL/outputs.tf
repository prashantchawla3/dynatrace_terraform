output "dql_id" {
  description = "The ID of the DQL query"
  value       = data.dynatrace_dql.example.id
}

output "dql_records" {
  description = "The records returned by the DQL query"
  value       = data.dynatrace_dql.example.records
}