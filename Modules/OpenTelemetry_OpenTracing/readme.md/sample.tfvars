attribute_allow_list = {
  example = {
    enabled = true
    key     = "attribute.example"
  }
}

attribute_block_list = {
  example = {
    enabled = true
    key     = "attribute.example"
  }
}

attribute_masking = {
  example = {
    enabled = true
    key     = "attribute.example"
    masking = "MASK_ENTIRE_VALUE"
  }
}

opentelemetry_metrics = {
  example = {
    additional_attributes_to_dimension_enabled = true
    meter_name_to_dimension_enabled           = true
    scope                                     = "environment"
    additional_attributes = [
      { enabled = true, attribute_key = "terraform.test.add" },
      { enabled = true, attribute_key = "service.name" },
      { enabled = true, attribute_key = "host.id" }
    ]
    to_drop_attributes = [
      { enabled = true, attribute_key = "terraform.test.drop" }
    ]
  }
}

span_capture_rules = {
  example = {
    action = "IGNORE"
    matches = [
      {
        comparison = "EQUALS"
        source     = "SPAN_NAME"
        value      = "foo"
      }
    ]
  }
}

span_context_propagation = {
  example = {
    action = "PROPAGATE"
    matches = [
      {
        comparison = "EQUALS"
        source     = "SPAN_NAME"
        value      = "asdf"
      }
    ]
  }
}

span_entry_points = {
  example = {
    action = "DONT_CREATE_ENTRYPOINT"
    matches = [
      {
        case_sensitive = true
        comparison     = "DOES_NOT_CONTAIN"
        source         = "SPAN_NAME"
        value          = "foo"
      }
    ]
  }
}

attributes_preferences = {
  example = {
    persistence_mode = "BLOCK_ALL_ATTRIBUTES"
  }
}
