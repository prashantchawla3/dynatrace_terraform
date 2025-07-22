output "logs_id" {
  value = var.enable_logs ? dynatrace_openpipeline_logs.this[0].id : null
}
