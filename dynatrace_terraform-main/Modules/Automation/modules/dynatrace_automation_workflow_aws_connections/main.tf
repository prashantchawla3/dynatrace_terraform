resource "dynatrace_automation_workflow_aws_connections" "aws" {
  name = var.aws_connection.name
  type = var.aws_connection.type

  web_identity {
    role_arn = var.aws_connection.role_arn
  }
}