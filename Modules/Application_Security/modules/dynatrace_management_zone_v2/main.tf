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
