
module "label" {
  source = "./modules/label"
  label  = var.label
}

module "partition_type" {
  source         = "./modules/partition_type"
  partition_type = var.partition_type
}

module "tagged_only" {
  source      = "./modules/tagged_only"
  tagged_only = var.tagged_only
}

module "credentials_enabled" {
  source             = "./modules/credentials_enabled"
  credentials_enabled = var.credentials_enabled
}

module "remove_defaults" {
  source         = "./modules/remove_defaults"
  remove_defaults = var.remove_defaults
}

module "running_on_dynatrace_infrastructure" {
  source                            = "./modules/running_on_dynatrace_infrastructure"
  running_on_dynatrace_infrastructure = var.running_on_dynatrace_infrastructure
}

module "authentication_data" {
  source             = "./modules/authentication_data"
  authentication_data = var.authentication_data
}

module "tags_to_monitor" {
  source          = "./modules/tags_to_monitor"
  tags_to_monitor = var.tags_to_monitor
}

module "aws_services" {
  source       = "./modules/aws_services"
  aws_services = var.aws_services
}
