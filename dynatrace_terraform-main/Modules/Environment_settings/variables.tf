
variable "app_monitoring_resources" {
  description = "App monitoring configuration resources."
  type = list(object({
    name = string
    type = string
    settings = object({
      app_monitoring = object({
        default_log_level   = string
        default_trace_level = string
      })
    })
  }))
  default = []
}


variable "audit_log_resources" {
  description = "Audit log settings and toggle per resource."
  type = list(object({
    name = string
    type = string
    settings = object({
      audit_log = object({
        enabled = bool
      })
    })
  }))
  default = []
}


variable "cloud_development_resources" {
  description = "Supported cloud development environments per resource."
  type = list(object({
    name = string
    type = string
    settings = object({
      cloud_development_environments = list(string)
    })
  }))
  default = []
}


variable "data_privacy_resources" {
  description = "Data privacy settings including masking and tracking controls."
  type = list(object({
    name = string
    type = string
    settings = object({
      data_privacy = object({
        application_id = string
        data_collection = object({
          opt_in_mode_enabled = bool
        })
        do_not_track = object({
          comply_with_do_not_track = bool
        })
        masking = object({
          personal_data_uri_masking_enabled = bool
          user_action_masking_enabled       = bool
        })
        user_tracking = object({
          persistent_cookie_enabled = bool
        })
      })
    })
  }))
  default = []
}


variable "disk_options_resources" {
  description = "Disk monitoring configurations including exclusions and NFS settings."
  type = list(object({
    name = string
    type = string
    settings = object({
      disk_options = object({
        disable_nfs_disk_monitoring = bool
        nfs_show_all                = bool
        scope                       = string
        exclusions = list(object({
          filesystem = string
          mountpoint = string
          os         = string
        }))
      })
    })
  }))
  default = []
}


variable "eula_settings_resources" {
  description = "End-user license agreement acceptance settings."
  type = list(object({
    name = string
    type = string
    settings = object({
      eula_settings = object({
        scope       = string
        enable_eula = bool
      })
    })
  }))
  default = []
}


variable "hub_permissions_resources" {
  description = "Hub permissions for user access management."
  type = list(object({
    name = string
    type = string
    settings = object({
      hub_permissions = object({
        email       = string
        description = string
      })
    })
  }))
  default = []
}


variable "hub_subscriptions_resources" {
  description = "Hub subscription tokens used for integrations."
  type = list(object({
    name = string
    type = string
    settings = object({
      hub_subscriptions = object({
        token_subscription = object({
          name        = string
          description = string
          enabled     = bool
          token       = string
        })
      })
    })
  }))
  default = []
}


variable "ip_masking_resources" {
  description = "IP masking configuration for privacy compliance."
  type = list(object({
    name = string
    type = string
    settings = object({
      ip_address_masking = object({
        scope   = string
        enabled = bool
        type    = string
      })
    })
  }))
  default = []
}


variable "outbound_connection_resources" {
  description = "List of allowed outbound hosts and enforcement settings."
  type = list(object({
    name = string
    type = string
    settings = object({
      limit_outbound_connections = object({
        allowed_outbound_connections = object({
          enforced  = bool
          host_list = list(string)
        })
      })
    })
  }))
  default = []
}


variable "oneagent_default_mode_resources" {
  description = "OneAgent default operation mode settings."
  type = list(object({
    name = string
    type = string
    settings = object({
      oneagent_default_mode = object({
        default_mode = string
      })
    })
  }))
  default = []
}


variable "oneagent_features_resources" {
  description = "List of OneAgent feature toggles and scope."
  type = list(object({
    name = string
    type = string
    settings = object({
      oneagent_features = object({
        enabled         = bool
        instrumentation = bool
        key             = string
        scope           = string
      })
    })
  }))
  default = []
}


variable "oneagent_side_masking_resources" {
  description = "Side masking rules for sensitive data monitoring in OneAgent."
  type = list(object({
    name = string
    type = string
    settings = object({
      oneagent_side_masking = object({
        is_email_masking_enabled     = bool
        is_financial_masking_enabled = bool
        is_numbers_masking_enabled   = bool
        is_query_masking_enabled     = bool
      })
    })
  }))
  default = []
}
