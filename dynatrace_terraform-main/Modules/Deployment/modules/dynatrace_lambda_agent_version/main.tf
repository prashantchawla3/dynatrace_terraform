data "dynatrace_lambda_agent_version" "this" {
  collector              = var.lambda_agent_version.collector
  java                   = var.lambda_agent_version.java
  java_with_collector    = var.lambda_agent_version.java_with_collector
  nodejs                 = var.lambda_agent_version.nodejs
  nodejs_with_collector  = var.lambda_agent_version.nodejs_with_collector
  python                 = var.lambda_agent_version.python
  python_with_collector  = var.lambda_agent_version.python_with_collector
}
