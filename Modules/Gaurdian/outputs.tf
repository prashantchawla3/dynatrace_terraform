
output "guardian_id" {
  value       = module.site_reliability_guardian.guardian_id
  description = "ID of the created Site Reliability Guardian"
}

output "workflow_id" {
  value       = module.automation_workflow.workflow_id
  description = "ID of the created automation workflow"
}
