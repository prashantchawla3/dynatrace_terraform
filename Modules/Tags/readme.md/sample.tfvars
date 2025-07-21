

autotag_name = "example_tag"
entity_selector = "entityId(\"HOST-123456789000000\")"

autotag_rules = [
  {
    type                        = "ME"
    enabled                     = true
    value_format                = "{ProcessGroup:Environment:keptn_stage}"
    value_normalization         = "Leave text as-is"
    entity_type                 = "SERVICE"
    service_to_host_propagation = false
    service_to_pgpropagation    = true
    conditions = [
      {
        dynamic_key        = "keptn_stage"
        dynamic_key_source = "ENVIRONMENT"
        key                = "PROCESS_GROUP_CUSTOM_METADATA"
        operator           = "EXISTS"
      }
    ]
  },
  {
    type                        = "ME"
    enabled                     = true
    value_format                = "prod"
    value_normalization         = "Leave text as-is"
    entity_type                 = "SYNTHETIC_TEST"
    service_to_host_propagation = false
    service_to_pgpropagation    = false
    conditions = [
      {
        key                = "BROWSER_MONITOR_TAGS"
        operator           = "TAG_KEY_EQUALS"
        dynamic_key        = ""
        dynamic_key_source = ""
        tag                = "prod"
      }
    ]
  }
]

autotag_selector_rules = [
  {
    type                = "SELECTOR"
    enabled             = true
    entity_selector     = "type(SERVICE),tag(sample)"
    value_format        = "disabled"
    value_normalization = "Leave text as-is"
  }
]

custom_tags = [
  { context = "CONTEXTLESS", key = "KeyExampleA" },
  { context = "CONTEXTLESS", key = "KeyExampleA", value = "ValueExample1" },
  { context = "CONTEXTLESS", key = "KeyExampleB" },
  { context = "CONTEXTLESS", key = "KeyExampleC", value = "ValueExample2" }
]
