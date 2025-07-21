resource "dynatrace_appsec_notification" "webhook" {
  count = length(var.notifications)

  type                                    = var.notifications[count.index].type
  enabled                                 = var.notifications[count.index].enabled
  display_name                            = var.notifications[count.index].display_name
  security_problem_based_alerting_profile = var.notifications[count.index].alerting_profile
  trigger                                 = var.notifications[count.index].trigger

  security_problem_based_webhook_payload {
    payload = var.notifications[count.index].payload
  }

  webhook_configuration {
    accept_any_certificate = var.notifications[count.index].accept_any_certificate
    url                    = var.notifications[count.index].url
  }
}

resource "dynatrace_attack_alerting" "alerting" {
  count                      = length(var.attack_alerting_names)
  name                       = var.attack_alerting_names[count.index]
  enabled                    = var.attack_alerting_enabled
  enabled_attack_mitigations = var.enabled_attack_mitigations
}

resource "dynatrace_attack_allowlist" "allowlist" {
  count = length(var.attack_allowlists)

  enabled      = var.attack_allowlists[count.index].enabled
  insert_after = var.attack_allowlists[count.index].insert_after
  rule_name    = var.attack_allowlists[count.index].rule_name

  attack_handling {
    blocking_strategy = var.attack_allowlists[count.index].blocking_strategy
  }

  metadata {
    comment = var.attack_allowlists[count.index].comment
  }

  dynamic "resource_attribute_conditions" {
    for_each = [1]
    content {
      dynamic "resource_attribute_condition" {
        for_each = var.attack_allowlists[count.index].conditions
        content {
          matcher                  = resource_attribute_condition.value.matcher
          resource_attribute_key   = resource_attribute_condition.value.key
          resource_attribute_value = resource_attribute_condition.value.value
        }
      }
    }
  }

  dynamic "rules" {
    for_each = [1]
    content {
      dynamic "rule" {
        for_each = var.attack_allowlists[count.index].rules
        content {
          criteria_key     = rule.value.key
          criteria_matcher = rule.value.matcher

          # Only include criteria_value_detection if the key is not ACTOR_IP
          criteria_value_free_text = rule.value.value


        }
      }
    }
  }
}

resource "dynatrace_attack_rules" "rules" {
  count = length(var.attack_rules)

  criteria {
    attack_type = var.attack_rules[count.index].attack_type
  }

  enabled = var.attack_rules[count.index].enabled

  metadata {
    comment = var.attack_rules[count.index].comment
  }

  attack_handling {
    blocking_strategy = var.attack_rules[count.index].blocking_strategy
  }
}

resource "dynatrace_attack_settings" "settings" {
  count = length(var.attack_settings)

  enabled = var.attack_settings[count.index].enabled

  default_attack_handling {
    blocking_strategy_java = var.attack_settings[count.index].blocking_strategy_java
  }
}

resource "dynatrace_kubernetes_spm" "spm" {
  count = length(var.kubernetes_spm)

  scope                                  = var.kubernetes_spm[count.index].scope
  configuration_dataset_pipeline_enabled = var.kubernetes_spm[count.index].configuration_dataset_pipeline_enabled
}

resource "dynatrace_management_zone_v2" "mgmz" {
  count = length(var.management_zones)

  name = var.management_zones[count.index].name

  rules {
    rule {
      type            = var.management_zones[count.index].type
      enabled         = var.management_zones[count.index].enabled
      entity_selector = var.management_zones[count.index].entity_selector

      attribute_rule {
        entity_type = var.management_zones[count.index].entity_type

        attribute_conditions {
          condition {
            case_sensitive = var.management_zones[count.index].case_sensitive
            key            = var.management_zones[count.index].key
            operator       = var.management_zones[count.index].operator
            string_value   = var.management_zones[count.index].string_value
          }
        }
      }
    }
  }
}

resource "dynatrace_vulnerability_alerting" "alerting" {
  count = length(var.vulnerability_alerting)

  name                   = var.vulnerability_alerting[count.index].name
  enabled                = var.vulnerability_alerting[count.index].enabled
  enabled_risk_levels    = var.vulnerability_alerting[count.index].enabled_risk_levels
  enabled_trigger_events = var.vulnerability_alerting[count.index].enabled_trigger_events
  management_zone        = dynatrace_management_zone_v2.mgmz[0].id
}

resource "dynatrace_vulnerability_code" "code" {
  count = length(var.vulnerability_code)

  enabled = var.vulnerability_code[count.index].enabled

  metadata {
    comment = var.vulnerability_code[count.index].comment
  }

  vulnerability_detection_control {
    monitoring_mode = var.vulnerability_code[count.index].monitoring_mode
  }
}

resource "dynatrace_vulnerability_settings" "settings" {
  count = length(var.vulnerability_settings)

  enable_code_level_vulnerability_detection = var.vulnerability_settings[count.index].enable_code_level_vulnerability_detection
  enable_runtime_vulnerability_detection    = var.vulnerability_settings[count.index].enable_runtime_vulnerability_detection
  global_monitoring_mode_java               = var.vulnerability_settings[count.index].global_monitoring_mode_java

  technologies {
    enable_dot_net         = var.vulnerability_settings[count.index].enable_dot_net
    enable_dot_net_runtime = var.vulnerability_settings[count.index].enable_dot_net_runtime
    enable_go              = var.vulnerability_settings[count.index].enable_go
    enable_java            = var.vulnerability_settings[count.index].enable_java
    enable_java_runtime    = var.vulnerability_settings[count.index].enable_java_runtime
    enable_kubernetes      = var.vulnerability_settings[count.index].enable_kubernetes
    enable_node_js         = var.vulnerability_settings[count.index].enable_node_js
    enable_node_js_runtime = var.vulnerability_settings[count.index].enable_node_js_runtime
    enable_php             = var.vulnerability_settings[count.index].enable_php
  }
}

resource "dynatrace_vulnerability_third_party" "third_party" {
  count = length(var.vulnerability_third_party)

  enabled  = var.vulnerability_third_party[count.index].enabled
  mode     = var.vulnerability_third_party[count.index].mode
  operator = var.vulnerability_third_party[count.index].operator
  property = var.vulnerability_third_party[count.index].property
  value    = var.vulnerability_third_party[count.index].value
}
