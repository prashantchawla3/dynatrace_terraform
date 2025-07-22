module "connections" {
  source  = "./modules/dynatrace_automation_controller_connections"
  count   = var.resource_count

  name    = var.resource_names[count.index]
  url     = var.url
  token   = var.token
  type    = var.type
}

module "default_rules" {
  source             = "./modules/dynatrace_discovery_default_rules"
  description        = var.description
  category           = var.category
  environment_scope  = var.environment_scope
  priority           = var.priority
  query              = var.query
  title              = var.title
  muted              = var.muted
}

module "actions" {
  source      = "./modules/actions"
  action_name = var.action_name
  mode        = var.mode
}

module "discovery_settings" {
  source                        = "./modules/discovery_settings"
  boolean_value                 = var.boolean_value
  show_monitoring_candidates   = var.show_monitoring_candidates
  show_standalone_hosts        = var.show_standalone_hosts
  interface_saturation_threshold = var.interface_saturation_threshold
}
