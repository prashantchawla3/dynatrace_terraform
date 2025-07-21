generic_settings = {
  abc = {
    schema = "app:my.booking.analytics:connection"
    scope  = "environment"
    value = {
      client_id     = "asdfhh"
      client_secret = "mysecret"
      name          = "ABC"
      tenant_id     = "asdf"
      type          = "client_secret"
      user_id       = "asdf"
    }
  }
}

grail_allowall = {
  default = {
    allow_all = true
  }
}

grail_allowlist = {
  default = {
    allow_rules = [
      {
        enabled    = false
        metric_key = "terraform"
        pattern    = "CONTAINS"
      }
    ]
  }
}

platform_buckets = {
  logs_bucket = {
    display_name = "Custom logs bucket playground"
    retention    = 67
    table        = "logs"
  }
}

problem_fields = {
  example = {
    enabled       = false
    event_field   = "example_event"
    problem_field = "example_problem"
  }
}

problem_propagation_rules = {
  rule1 = {
    enabled              = false
    source_attribute_key = "terraformSource"
    target_attribute_key = "terraformTarget"
  }
}

security_contexts = {
  context1 = {
    enabled = true
  }
}
