
variable "activegate_token_config" {
  description = "Configuration for ActiveGate token"
  type = object({
    auth_token_enforcement_manually_enabled = bool
    expiring_token_notifications_enabled    = bool
  })
}

variable "ag_token_config" {
  description = "Configuration for AG token"
  type = object({
    type            = string
    expiration_date = string
    name            = string
  })
}

variable "api_token_config" {
  description = "Configuration for API token"
  type = object({
    name    = string
    enabled = bool
    scopes  = list(string)
  })
}

variable "token_settings_config" {
  description = "Configuration for token settings"
  type = object({
    new_token_format = bool
    personal_tokens  = bool
  })
}


#update Variables
variable "auto_update" {
  description = "Enable ActiveGate auto update"
  type        = bool
}

variable "scope_activegate" {
  description = "Scope for ActiveGate updates"
  type        = string
}

variable "scope_oneagent" {
  description = "Scope for OneAgent updates"
  type        = string
}

variable "target_version" {
  description = "Target OneAgent version"
  type        = string
}

variable "update_mode" {
  description = "OneAgent update mode"
  type        = string
}

variable "name" {
  description = "Update window name"
  type        = string
}

variable "enabled" {
  description = "Enable update window"
  type        = bool
}

variable "recurrence" {
  description = "Recurrence type"
  type        = string
}

variable "once_recurrence_end" {
  description = "One-time window end"
  type        = string
}

variable "once_recurrence_start" {
  description = "One-time window start"
  type        = string
}

#virtualization Variables
variable "vmware_configs" {
  description = "Map of VMware configurations for Dynatrace"
  type = map(object({
    enabled   = bool
    ipaddress = string
    label     = string
    password  = string
    username  = string
    filter    = string
  }))
}


#process monitoring variables

variable "host_group_id" { type = string }
variable "aspnetcore" { type = bool }
variable "cf_appsmanagerjs" { type = bool }
variable "container" { type = bool }
variable "docker_pauseamd64" { type = bool }
variable "exe_bbs" { type = bool }
variable "exe_caddy" { type = bool }
variable "exe_schedular" { type = bool }
variable "exe_silkdaemon" { type = bool }
variable "go_static" { type = bool }
variable "node_nodegyp" { type = bool }

variable "process_availability_enabled" { type = bool }
variable "process_availability_name" { type = string }
variable "process_availability_rule_property" { type = string }
variable "process_availability_rule_condition" { type = string }
variable "process_availability_metadata_key" { type = string }
variable "process_availability_metadata_value" { type = string }

variable "process_monitoring_host_group_id" { type = string }
variable "process_monitoring_auto_monitoring" { type = bool }

variable "process_monitoring_rule_enabled" { type = bool }
variable "process_monitoring_rule_mode" { type = string }
variable "process_monitoring_rule_host_group_id" { type = string }
variable "process_monitoring_rule_condition_item" { type = string }
variable "process_monitoring_rule_condition_operator" { type = string }
variable "process_monitoring_rule_condition_value" { type = string }

variable "process_visibility_enabled" { type = bool }
variable "process_visibility_max_processes" { type = number }
variable "process_visibility_scope" { type = string }

#Ownership variables
variable "team_name" {
  description = "Team name"
  type        = string
}

variable "team_description" {
  description = "Description of the team"
  type        = string
}

variable "team_identifier" {
  description = "The team identifier"
  type        = string
}

variable "team_external_id" {
  description = "External ID for automation purposes"
  type        = string
}

variable "responsibility_development" {
  type = bool
}

variable "responsibility_infrastructure" {
  type = bool
}

variable "responsibility_line_of_business" {
  type = bool
}

variable "responsibility_operations" {
  type = bool
}

variable "responsibility_security" {
  type = bool
}

variable "additional_info_key" {
  type = string
}

variable "additional_info_value" {
  type = string
}

variable "additional_info_url" {
  type = string
}

variable "contact_integration_type" {
  type = string
}

variable "contact_jira_default_assignee" {
  type = string
}

variable "contact_jira_project" {
  type = string
}

variable "contact_ms_teams" {
  type = string
}

variable "contact_slack_channel" {
  type = string
}

variable "contact_url" {
  type = string
}

variable "link_type" {
  type = string
}

variable "link_url" {
  type = string
}

variable "supplementary_identifier" {
  type = string
}



#RUM variables

variable "geolocation" {
  type = map(object({
    display_worldmap = bool
    scope            = string
  }))
}

variable "process_group_rum" {
  type = map(object({
    enable           = bool
    process_group_id = string
  }))
}

variable "rum_advanced_correlation" {
  type = map(object({
    matcher = string
    pattern = string
  }))
}

variable "rum_host_headers" {
  type = map(object({
    header_name = string
  }))
}

variable "rum_ip_determination" {
  type = map(object({
    header_name = string
  }))
}

variable "rum_ip_locations" {
  type = map(object({
    country_code = string
    ip           = string
    ip_to        = string
    region_code  = string
  }))
}

variable "rum_overload_prevention" {
  type = map(object({
    overload_prevention_limit = number
  }))
}

variable "rum_provider_breakdown" {
  type = map(object({
    report_public_improvement = bool
    resource_name             = string
    resource_type             = string
    domain_name_pattern_list  = list(object({
      domain_name_pattern = list(object({
        pattern = string
      }))
    }))
  }))
}

variable "usability_analytics" {
  type = map(object({
    detect_rage_clicks = bool
    application_id     = optional(string)
  }))
}

variable "user_action_metrics" {
  type = map(object({
    enabled    = bool
    dimensions = list(string)
    metric_key = string
    filters    = list(object({
      filter = list(object({
        field_name = string
        operator   = string
        value      = string
      }))
    }))
    value = object({
      type = string
    })
  }))
}

variable "user_experience_score" {
  type = map(object({
    consider_last_action                   = bool
    consider_rage_click                    = bool
    max_frustrated_user_actions_threshold = number
    min_satisfied_user_actions_threshold  = number
  }))
}

variable "user_session_metrics" {
  type = map(object({
    enabled    = bool
    metric_key = string
    filters    = list(object({
      filter = list(object({
        field_name = string
        operator   = string
        value      = string
      }))
    }))
    value = object({
      type = string
    })
  }))
}

#Monitored entities variables

variable "custom_device_id" {
  description = "The unique ID of the custom device"
  type        = string
}

variable "display_name" {
  description = "Display name of the custom device"
  type        = string
}

variable "config_url" {
  description = "Configuration URL for the device"
  type        = string
}

variable "dns_names" {
  description = "DNS names of the device"
  type        = list(string)
}

variable "favicon_url" {
  description = "URL of the favicon to show for the custom device"
  type        = string
}

variable "group" {
  description = "Custom group the device belongs to"
  type        = string
}

variable "ip_addresses" {
  description = "IP addresses of the device"
  type        = list(string)
}

variable "listen_ports" {
  description = "Ports the device listens on"
  type        = list(number)
}

variable "props" {
  description = "Custom properties in key=value format"
  type        = string
}

variable "type" {
  description = "Device type identifier"
  type        = string
}

variable "ui_based" {
  description = "Whether the device was created via UI"
  type        = bool
}


# metric variables

variable "custom_units_name" {
  description = "Unit name has to be unique and is used as identifier"
  type        = string
}

variable "custom_units_description" {
  description = "Unit description should provide additional information about the new unit"
  type        = string
}

variable "custom_units_plural_name" {
  description = "Unit plural name represents the plural form of the unit name"
  type        = string
}

variable "custom_units_symbol" {
  description = "Unit symbol has to be unique"
  type        = string
}

variable "histogram_metrics_enable_histogram_bucket_ingest" {
  description = "Enable histogram bucket ingest"
  type        = bool
}

variable "metric_metadata_display_name" {
  description = "Display name"
  type        = string
}

variable "metric_metadata_metric_id" {
  description = "The scope of this setting (metric)"
  type        = string
}

variable "metric_metadata_unit" {
  description = "Unit"
  type        = string
}

variable "metric_query_metric_id" {
  description = "The scope of this setting (metric)"
  type        = string
}

variable "metric_query_metric_selector" {
  description = "Query"
  type        = string
}


# Grail variables

variable "segment_name" {
  description = "Name of the Dynatrace segment"
  type        = string
}

variable "segment_description" {
  description = "Description of the Dynatrace segment"
  type        = string
}

variable "segment_is_public" {
  description = "Whether the segment is public"
  type        = bool
}

variable "segment_query" {
  description = "Query used in the segment variables block"
  type        = string
}

variable "includes_items" {
  description = "List of items inside the includes block"
  type = list(object({
    data_object = string
    filter      = string
    relationship = optional(object({
      name   = string
      target = string
    }))
  }))
}

#Management zone variables

variable "zone_name" {
  description = "The name of the management zone"
  type        = string
}

variable "zone_description" {
  description = "The description of the management zone"
  type        = string
  default     = ""
}

variable "zone_legacy_id" {
  description = "The legacy ID of the management zone"
  type        = string
  default     = ""
}

variable "entity_selector" {
  description = "The entity selector for the management zone rules"
  type        = string
  default     = ""
}

