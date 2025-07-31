output "aws_connection_id" {
  description = "The ID of the AWS connection"
  value       = dynatrace_automation_workflow_aws_connections.aws.id
}

output "aws_connection_name" {
  description = "The name of the AWS connection"
  value       = dynatrace_automation_workflow_aws_connections.aws.name
}

output "aws_connection_type" {
  description = "The type of the AWS connection"
  value       = dynatrace_automation_workflow_aws_connections.aws.type
}

output "aws_connection_role_arn" {
  description = "The role ARN used for the AWS connection"
  value       = dynatrace_automation_workflow_aws_connections.aws.web_identity[0].role_arn
}
