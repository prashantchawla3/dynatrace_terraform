output "host_naming_ids" {
  description = "List of IDs for each configured host naming rule"
  value       = [for hn in dynatrace_host_naming.example : hn.id]
}

output "host_naming_names" {
  description = "List of names assigned to each host naming rule"
  value       = [for hn in dynatrace_host_naming.example : hn.name]
}

output "host_naming_formats" {
  description = "List of format patterns used in host naming"
  value       = [for hn in dynatrace_host_naming.example : hn.format]
}

output "host_naming_order_rule_ids" {
  description = "Ordered list of naming rule IDs used for precedence configuration"
  value       = [for order in dynatrace_host_naming_order.example : order.naming_rule_ids]
}
