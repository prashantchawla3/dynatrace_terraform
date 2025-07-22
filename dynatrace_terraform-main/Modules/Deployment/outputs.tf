output "lambda_agent_version_all" {
  value = data.dynatrace_lambda_agent_version.this
}

output "lambda_agent_version_java" {
  value = data.dynatrace_lambda_agent_version.this.java
}

output "lambda_agent_version_nodejs" {
  value = data.dynatrace_lambda_agent_version.this.nodejs
}

output "lambda_agent_version_python" {
  value = data.dynatrace_lambda_agent_version.this.python
}
