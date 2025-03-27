resource "dynatrace_management_zone_v2" "example_zone" {
  name        = var.zone_name
  description = var.zone_description
  legacy_id   = var.zone_legacy_id

  rules {
    rule {
      type            = "ME"
      enabled         = true
      entity_selector = var.entity_selector

      attribute_rule {
        entity_type = "CLOUD_APPLICATION_NAMESPACE"
        attribute_conditions {
          condition {
            case_sensitive = false
            key            = "KUBERNETES_CLUSTER_NAME"
            operator       = "EQUALS"
            string_value   = "aks-cluster"
          }
        }
      }
    }

    rule {
      type            = "ME"
      enabled         = true
      entity_selector = var.entity_selector

      attribute_rule {
        entity_type           = "HOST"
        host_to_pgpropagation = true
        attribute_conditions {
          condition {
            enum_value = "AZURE"
            key        = "HOST_CLOUD_TYPE"
            operator   = "EQUALS"
          }
        }
      }
    }

    rule {
      type            = "ME"
      enabled         = true
      entity_selector = var.entity_selector

      attribute_rule {
        entity_type = "WEB_APPLICATION"
        attribute_conditions {
          condition {
            case_sensitive = false
            key            = "WEB_APPLICATION_NAME"
            operator       = "CONTAINS"
            string_value   = "azure"
          }
        }
      }
    }

    rule {
      type            = "DIMENSION"
      enabled         = true
      entity_selector = var.entity_selector

      dimension_rule {
        applies_to = "METRIC"
        dimension_conditions {
          condition {
            condition_type = "METRIC_KEY"
            rule_matcher   = "BEGINS_WITH"
            value          = "cloud.azure."
          }
        }
      }
    }
  }
}