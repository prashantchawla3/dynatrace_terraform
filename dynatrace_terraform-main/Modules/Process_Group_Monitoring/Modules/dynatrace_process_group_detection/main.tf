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