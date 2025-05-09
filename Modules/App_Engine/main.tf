

resource "dynatrace_automation_controller_connections" "connections" {
  count = var.resource_count
  name  = var.resource_names[count.index]
  url   = var.url
  type  = var.type
  token = var.token
}

resource "dynatrace_db_app_feature_flags" "feature_flags" {
  count        = var.resource_count
  name         = var.resource_names[count.index]
  type         = var.type
  string_value = var.resource_names[count.index]
}

resource "dynatrace_discovery_default_rules" "default_rules" {
  count = var.resource_count
  rule {
    description       = var.description
    category          = var.category
    environment_scope = var.environment_scope
    id                = var.resource_names[count.index]
    priority          = var.priority
    query             = var.query
    title             = var.title
    actions {
      action {
        name = var.action_name
        parameters {
          parameter {
            name  = var.mode
            value = var.mode
          }
        }
      }
    }
  }
  settings {
    muted = var.muted
  }
}

resource "dynatrace_discovery_feature_flags" "discovery_flags" {
  count         = var.resource_count
  name          = var.resource_names[count.index]
  type          = var.type
  boolean_value = var.boolean_value
}

resource "dynatrace_event_driven_ansible_connections" "ansible_connections" {
  count = var.resource_count
  name  = var.resource_names[count.index]
  url   = var.url
  type  = var.type
  token = var.token
}

resource "dynatrace_infraops_app_settings" "infraops_settings" {
  count                        = var.resource_count
  show_monitoring_candidates   = var.show_monitoring_candidates
  show_standalone_hosts        = var.show_standalone_hosts
  interface_saturation_threshold = var.interface_saturation_threshold
}
