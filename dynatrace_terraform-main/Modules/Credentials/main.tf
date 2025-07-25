
module "dynatrace_credentials" {
  source = "./modules/dynatrace_credentials"

  label                           = var.label
  partition_type                  = var.partition_type
  tagged_only                     = var.tagged_only
  credentials_enabled             = var.credentials_enabled
  remove_defaults                 = var.remove_defaults
  running_on_dynatrace_infrastructure = var.running_on_dynatrace_infrastructure
}

module "dynatrace_aws_credentials" {
  source              = "./modules/dynatrace_aws_credentials"
  authentication_data = var.authentication_data
  tags_to_monitor     = var.tags_to_monitor
}

module "dynatrace_azure_credentials" {
  source              = "./modules/dynatrace_azure_credentials"
  authentication_data = var.authentication_data
  tags_to_monitor     = var.tags_to_monitor
}


module "dynatrace_aws_service" {
  source       = "./modules/dynatrace_aws_service"
  aws_services = var.aws_services
}

module "dynatrace_azure_service" {
  source = "./modules/dynatrace_azure_service"
}
