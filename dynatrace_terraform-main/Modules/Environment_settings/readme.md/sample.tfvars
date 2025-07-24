app_monitoring_resources = [
  {
    name    = "app_monitoring_1"
    type    = "app_monitoring"
    settings = {
      app_monitoring = {
        default_log_level  = "off"
        default_trace_level = "off"
      }
    }
  }
]

audit_log_resources = [
  {
    name    = "audit_log_1"
    type    = "audit_log"
    settings = {
      audit_log = {
        enabled = false
      }
    }
  }
]

cloud_development_resources = [
  {
    name    = "cloud_envs_1"
    type    = "cloud_development_environments"
    settings = {
      cloud_development_environments = [
        "https://example1.my-company.my-cde-provider.com",
        "https://example2.my-company.my-cde-provider.com",
        "https://example3.my-company.my-cde-provider.com"
      ]
    }
  }
]

data_privacy_resources = [
  {
    name    = "data_privacy_1"
    type    = "data_privacy"
    settings = {
      data_privacy = {
        application_id = "environment"
        data_collection = {
          opt_in_mode_enabled = true
        }
        do_not_track = {
          comply_with_do_not_track = false
        }
        masking = {
          personal_data_uri_masking_enabled = true
          user_action_masking_enabled       = true
        }
        user_tracking = {
          persistent_cookie_enabled = true
        }
      }
    }
  }
]

disk_options_resources = [
  {
    name    = "disk_options_1"
    type    = "disk_options"
    settings = {
      disk_options = {
        disable_nfs_disk_monitoring = false
        nfs_show_all                = true
        scope                       = "HOST-1234567890000000"
        exclusions = [
          {
            filesystem = "ntfs"
            mountpoint = "C:\\"
            os         = "OS_TYPE_WINDOWS"
          }
        ]
      }
    }
  }
]

eula_settings_resources = [
  {
    name    = "eula_settings_1"
    type    = "eula_settings"
    settings = {
      eula_settings = {
        scope       = "environment"
        enable_eula = true
      }
    }
  }
]

hub_permissions_resources = [
  {
    name    = "hub_permissions_1"
    type    = "hub_permissions"
    settings = {
      hub_permissions = {
        email       = "terraform@dynatrace.com"
        description = "This is an example description"
      }
    }
  }
]

hub_subscriptions_resources = [
  {
    name    = "hub_subscriptions_1"
    type    = "hub_subscriptions"
    settings = {
      hub_subscriptions = {
        token_subscription = {
          name        = "example-subscription"
          description = "Description"
          enabled     = true
          token       = "123456789012345678901234567890123456"
        }
      }
    }
  }
]

ip_masking_resources = [
  {
    name    = "ip_masking_1"
    type    = "ip_address_masking"
    settings = {
      ip_address_masking = {
        scope   = "APPLICATION-1234567890000000"
        enabled = true
        type    = "public"
      }
    }
  }
]

outbound_connection_resources = [
  {
    name    = "outbound_connections_1"
    type    = "limit_outbound_connections"
    settings = {
      limit_outbound_connections = {
        allowed_outbound_connections = {
          enforced  = true
          host_list = ["www.dynatrace.com", "www.google.com"]
        }
      }
    }
  }
]

oneagent_default_mode_resources = [
  {
    name    = "oneagent_mode_1"
    type    = "oneagent_default_mode"
    settings = {
      oneagent_default_mode = {
        default_mode = "FULL_STACK"
      }
    }
  }
]

oneagent_features_resources = [
  {
    name    = "oneagent_features_1"
    type    = "oneagent_features"
    settings = {
      oneagent_features = {
        enabled        = true
        instrumentation = true
        key            = "SENSOR_DOTNET_ASPNET"
        scope          = "environment"
      }
    }
  }
]

oneagent_side_masking_resources = [
  {
    name    = "side_masking_1"
    type    = "oneagent_side_masking"
    settings = {
      oneagent_side_masking = {
        is_email_masking_enabled     = false
        is_financial_masking_enabled = true
        is_numbers_masking_enabled   = true
        is_query_masking_enabled     = false
      }
    }
  }
]
