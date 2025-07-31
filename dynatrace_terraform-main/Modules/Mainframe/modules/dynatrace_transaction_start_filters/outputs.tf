output "transaction_start_filter_cics_terminal_ids" {
  description = "List of CICS terminal transaction IDs used in the start filter"
  value       = dynatrace_transaction_start_filters.transaction_start_filters.cics_terminal_transaction_ids
}

output "transaction_start_filter_cics_ids" {
  description = "List of CICS transaction IDs used in the start filter"
  value       = dynatrace_transaction_start_filters.transaction_start_filters.cics_transaction_ids
}

output "transaction_start_filter_ims_ids" {
  description = "List of IMS transaction IDs used in the start filter"
  value       = dynatrace_transaction_start_filters.transaction_start_filters.ims_transaction_ids
}

output "transaction_start_filter_ims_terminal_ids" {
  description = "List of IMS terminal transaction IDs used in the start filter"
  value       = dynatrace_transaction_start_filters.transaction_start_filters.ims_terminal_transaction_ids
}
