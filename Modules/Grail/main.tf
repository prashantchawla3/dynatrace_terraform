resource "dynatrace_segment" "example" {
  count       = length(var.segments)
  
  name        = var.segments[count.index].name
  description = var.segments[count.index].description
  is_public   = var.segments[count.index].is_public

  includes {
    items {
      data_object = each.value.data_object
      filter      = each.value.filter
      relationship {
        name   = each.value.relationship_name
        target = each.value.relationship_target
      }
    }
  }

  variables {
    type  = var.variables_type
    value = var.variables_value
  }
}
