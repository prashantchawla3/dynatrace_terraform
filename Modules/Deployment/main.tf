
module "lambda_agent_version" {
  source              = "./modules/dynatrace_lambda_agent_version"
  lambda_agent_version = var.lambda_agent_version
}
