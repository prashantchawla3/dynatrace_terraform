output "cics_mq_queue_id_includes" {
  description = "List of included CICS MQ queue IDs"
  value       = dynatrace_ibm_mq_filters.mq_filters.cics_mq_queue_id_includes
}

output "cics_mq_queue_id_excludes" {
  description = "List of excluded CICS MQ queue IDs"
  value       = dynatrace_ibm_mq_filters.mq_filters.cics_mq_queue_id_excludes
}

output "ims_mq_queue_id_excludes" {
  description = "List of excluded IMS MQ queue IDs"
  value       = dynatrace_ibm_mq_filters.mq_filters.ims_mq_queue_id_excludes
}

output "ims_cr_trn_id_includes" {
  description = "List of included IMS CR transaction IDs"
  value       = dynatrace_ibm_mq_filters.mq_filters.ims_cr_trn_id_includes
}
