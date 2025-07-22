geolocation = {
  geo1 = {
    display_worldmap = true
    scope            = "environment"
  }
}

process_group_rum = {
  pgr1 = {
    enable           = false
    process_group_id = "PROCESS_GROUP-1234567890000000"
  }
}

rum_advanced_correlation = {
  rac1 = {
    matcher = "STARTS_WITH"
    pattern = "Server-Timing-Terraform-2"
  }
}

rum_host_headers = {
  rhh1 = {
    header_name = "example-header"
  }
}

rum_ip_determination = {
  rid1 = {
    header_name = "X-Header-Example3"
  }
}

rum_ip_locations = {
  ril1 = {
    country_code = "ZA"
    ip           = "192.168.3.1"
    ip_to        = "192.168.3.100"
    region_code  = "05"
  }
}

rum_overload_prevention = {
  rop1 = {
    overload_prevention_limit = 4000
  }
}

rum_provider_breakdown = {
  rpb1 = {
    report_public_improvement = false
    resource_name             = "example"
    resource_type             = "ThirdParty"
    domain_name_pattern_list = [
      {
        domain_name_pattern = [
          { pattern = "Terraform3rdPartyExample.com" }
        ]
      }
    ]
  }
}

usability_analytics = {
  ua1 = {
    detect_rage_clicks = true
  }
  ua2 = {
    detect_rage_clicks = false
    application_id     = "APPLICATION-EA7C4B59F27D43EB"
  }
}

user_action_metrics = {
  uam1 = {
    enabled    = true
    dimensions = ["application"]
    metric_key = "uacm.TerraformTest"
    filters = [
      {
        filter = [
          {
            field_name = "type"
            operator   = "EQUALS"
            value      = "Xhr"
          }
        ]
      }
    ]
    value = {
      type = "COUNTER"
    }
  }
}

user_experience_score = {
  ues1 = {
    consider_last_action                   = false
    consider_rage_click                    = false
    max_frustrated_user_actions_threshold = 20
    min_satisfied_user_actions_threshold  = 60
  }
}

user_session_metrics = {
  usm1 = {
    enabled    = false
    metric_key = "uscm.TerraformTest"
    filters = [
      {
        filter = [
          {
            field_name = "useraction.application"
            operator   = "EQUALS"
            value      = "www.terraform.io/"
          },
          {
            field_name = "useraction.name"
            operator   = "EQUALS"
            value      = "Loading of page /"
          }
        ]
      }
    ]
    value = {
      type = "COUNTER"
    }
  }
}
