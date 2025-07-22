output "aws_credentials_id" {
  value = dynatrace_aws_credentials.this.id
}

output "azure_credentials_id" {
  value = dynatrace_azure_credentials.this.id
}

output "dynatrace_credentials_id" {
  value = dynatrace_credentials.this.id
}
