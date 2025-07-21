resource "dynatrace_cloudapp_workloaddetection" "cloud_app_workload_detection" {
  for_each = var.cloudapp_workloaddetection

  cloud_foundry {
    enabled = each.value.cloud_foundry_enabled
  }

  docker {
    enabled = each.value.docker_enabled
  }

  kubernetes {
    enabled = each.value.kubernetes_enabled

    filters {
      dynamic "filter" {
        for_each = each.value.kubernetes_filters
        content {
          enabled = filter.value.enabled

          inclusion_toggles {
            inc_basepod   = filter.value.inc_basepod
            inc_container = filter.value.inc_container
            inc_namespace = filter.value.inc_namespace
            inc_product   = filter.value.inc_product
            inc_stage     = filter.value.inc_stage
          }

          match_filter {
            match_operator = filter.value.match_operator
          }
        }
      }
    }
  }
}

resource "dynatrace_declarative_grouping" "this" {
  for_each = var.declarative_groupings

  name    = each.key
  enabled = each.value.enabled
  scope   = each.value.scope

  detection {
    process_definition {
      id                 = each.value.id
      process_group_name = each.value.process_group_name
      report             = each.value.report

      rules {
        dynamic "rule" {
          for_each = each.value.rules
          content {
            condition = rule.value.condition
            property  = rule.value.property
          }
        }
      }
    }
  }
}

resource "dynatrace_pg_alerting" "this" {
  for_each = var.pg_alertings

  enabled                    = each.value.enabled
  alerting_mode             = each.value.alerting_mode
  minimum_instance_threshold = each.value.minimum_instance_threshold
  process_group             = each.value.process_group
}

resource "dynatrace_process_group_detection" "this" {
  for_each = var.pg_detections

  enabled = each.value.enabled

  group_extraction {
    property        = each.value.group_property
    standalone_rule = each.value.group_standalone_rule

    delimiter {
      remove_ids = each.value.group_remove_ids
    }
  }

  instance_extraction {
    property = each.value.instance_property

    delimiter {
      remove_ids = each.value.instance_remove_ids
    }
  }

  process_detection {
    contained_string         = each.value.contained_string
    property                 = each.value.process_property
    restrict_to_process_type = each.value.restrict_to_process_type
  }
}

resource "dynatrace_process_group_detection_flags" "this" {
  for_each = var.pg_detection_flags

  scope                                      = each.value.scope
  add_node_js_script_name                   = each.value.add_node_js_script_name
  auto_detect_cassandra_clusters            = each.value.auto_detect_cassandra_clusters
  auto_detect_spring_boot                   = each.value.auto_detect_spring_boot
  auto_detect_tibco_container_edition_engines = each.value.auto_detect_tibco_container_edition_engines
  auto_detect_tibco_engines                 = each.value.auto_detect_tibco_engines
  auto_detect_web_methods_integration_server = each.value.auto_detect_web_methods_integration_server
  auto_detect_web_sphere_liberty_application = each.value.auto_detect_web_sphere_liberty_application
  group_ibmmqby_instance_name               = each.value.group_ibmmqby_instance_name
  identify_jboss_server_by_system_property  = each.value.identify_jboss_server_by_system_property
  ignore_unique_identifiers                 = each.value.ignore_unique_identifiers
  short_lived_processes_monitoring          = each.value.short_lived_processes_monitoring
  split_oracle_database_pg                  = each.value.split_oracle_database_pg
  split_oracle_listener_pg                  = each.value.split_oracle_listener_pg
  use_catalina_base                         = each.value.use_catalina_base
  use_docker_container_name                 = each.value.use_docker_container_name
}

resource "dynatrace_process_group_monitoring" "this" {
  for_each = var.pg_monitorings

  monitoring_state = each.value.monitoring_state
  process_group_id = each.value.process_group_id
}

resource "dynatrace_process_group_simple_detection" "this" {
  for_each = var.pg_simple_detections

  enabled             = each.value.enabled
  group_identifier    = each.value.group_identifier
  instance_identifier = each.value.instance_identifier
  process_type        = each.value.process_type
  rule_type           = each.value.rule_type
}

resource "dynatrace_processgroup_naming" "this" {
  for_each = var.pg_namings

  name    = each.key
  enabled = each.value.enabled
  format  = each.value.format

  conditions {
    dynamic "condition" {
      for_each = each.value.conditions
      content {
        key {
          type      = condition.value.key_type
          attribute = condition.value.key_attribute
        }
        tech {
          negate   = condition.value.tech_negate
          operator = condition.value.tech_operator
          value {
            type = condition.value.tech_value_type
          }
        }
      }
    }

    dynamic "condition" {
      for_each = each.value.string_conditions
      content {
        process_metadata {
          attribute   = condition.value.attribute
          dynamic_key = condition.value.dynamic_key
        }
        string {
          case_sensitive = condition.value.case_sensitive
          negate         = condition.value.negate
          operator       = condition.value.operator
          value          = condition.value.value
        }
      }
    }
  }
}

resource "dynatrace_processgroup_naming_order" "this" {
  naming_rule_ids = var.pg_naming_order
}
