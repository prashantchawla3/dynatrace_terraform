
resource "dynatrace_autotag_v2" "example" {
  name                         = var.autotag_name
  rules_maintained_externally = true

  rules {
    rule {
      type                = "ME"
      enabled             = true
      value_format        = "{ProcessGroup:Environment:keptn_stage}"
      value_normalization = "Leave text as-is"
      attribute_rule {
        entity_type                  = "SERVICE"
        service_to_host_propagation = false
        service_to_pgpropagation    = true
        conditions {
          condition {
            dynamic_key        = "keptn_stage"
            dynamic_key_source = "ENVIRONMENT"
            key                = "PROCESS_GROUP_CUSTOM_METADATA"
            operator           = "EXISTS"
          }
        }
      }
    }

    rule {
      type                = "ME"
      enabled             = true
      value_format        = "prod"
      value_normalization = "Leave text as-is"
      attribute_rule {
        entity_type = "SYNTHETIC_TEST"
        conditions {
          condition {
            key      = "BROWSER_MONITOR_TAGS"
            operator = "TAG_KEY_EQUALS"
            tag      = "prod"
          }
        }
      }
    }
  }
}

resource "dynatrace_autotag_rules" "example" {
  auto_tag_id = dynatrace_autotag_v2.example.id

  rules {
    rule {
      type                = "SELECTOR"
      enabled             = true
      entity_selector     = "type(SERVICE),tag(sample)"
      value_format        = "disabled"
      value_normalization = "Leave text as-is"
    }
  }
}

resource "dynatrace_custom_tags" "example" {
  entity_selector = var.entity_selector

  tags {
    filter {
      context = "CONTEXTLESS"
      key     = "KeyExampleA"
    }
    filter {
      context = "CONTEXTLESS"
      key     = "KeyExampleA"
      value   = "ValueExample1"
    }
    filter {
      context = "CONTEXTLESS"
      key     = "KeyExampleB"
    }
    filter {
      context = "CONTEXTLESS"
      key     = "KeyExampleC"
      value   = "ValueExample2"
    }
  }
}
