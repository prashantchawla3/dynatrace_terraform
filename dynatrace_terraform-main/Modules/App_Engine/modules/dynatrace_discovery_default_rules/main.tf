resource "dynatrace_discovery_default_rules" "default_rules" {
  count = var.discovery_rule_count

  rule {
    description       = var.discovery_rule_description
    category          = var.discovery_rule_category
    environment_scope = var.discovery_rule_environment_scope
    id                = var.discovery_rule_names[count.index]
    priority          = var.discovery_rule_priority
    query             = var.discovery_rule_query
    title             = var.discovery_rule_title

    actions {
      action {
        name = var.discovery_rule_action_name

        parameters {
          parameter {
            name  = var.discovery_rule_mode
            value = var.discovery_rule_mode
          }
        }
      }
    }
  }

  settings {
    muted = var.discovery_rule_muted
  }
}
