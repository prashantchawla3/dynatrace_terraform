module "discovery_default_rules" {
  source              = "./modules/discovery-default-rules"
  resource_count      = var.resource_count
  resource_names      = var.resource_names
  description         = var.description
  category            = var.category
  environment_scope   = var.environment_scope
  priority            = var.priority
  query               = var.query
  title               = var.title
  action_name         = var.action_name
  mode                = var.mode
  muted               = var.muted
}

module "discovery_feature_flags" {
  source         = "./modules/discovery-feature-flags"
  resource_count = var.resource_count
  resource_names = var.resource_names
  type           = var.type
  boolean_value  = var.boolean_value
}

module "ansible_connections" {
  source         = "./modules/ansible-connection"
  resource_count = var.resource_count
  resource_names = var.resource_names
  url            = var.url
  type           = var.type
  token          = var.token
}

module "infraops_app_settings" {
  source                      = "./modules/infraops-app-settings"
  resource_count              = var.resource_count
  show_monitoring_candidates  = var.show_monitoring_candidates
  show_standalone_hosts       = var.show_standalone_hosts
  interface_saturation_threshold = var.interface_saturation_threshold
}
