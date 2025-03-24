output "aws_credentials_id" {
  description = "The ID of the AWS credentials"
  value       = dynatrace_aws_credentials.aws_credentials.id
}

output "azure_credentials_id" {
  description = "The ID of the Azure credentials"
  value       = dynatrace_azure_credentials.azure_credentials.id
}

output "credentials_id" {
  description = "The ID of the credentials"
  value       = dynatrace_credentials.credentials.id
}