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