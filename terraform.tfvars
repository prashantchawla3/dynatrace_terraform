
activegate_token_config = {
  auth_token_enforcement_manually_enabled = false
  expiring_token_notifications_enabled    = true
}

ag_token_config = {
  type            = "ENVIRONMENT"
  expiration_date = "now+3d"
  name            = "example_ag_token"
}

api_token_config = {
  name    = "example_api_token"
  enabled = false
  scopes  = ["geographicRegions.read"]
}

token_settings_config = {
  new_token_format = true
  personal_tokens  = true
}

#updates Values

auto_update      = true
scope_activegate = "environment"
scope_oneagent   = "environment"
target_version   = "latest"
update_mode      = "AUTOMATIC"

name                  = "example"
enabled               = true
recurrence            = "ONCE"
once_recurrence_start = "2023-02-15T02:00:00Z"
once_recurrence_end   = "2023-02-15T04:00:00Z"

#virtualization Values


vmware_configs = {
  "example1" = {
    enabled   = false
    ipaddress = "vcenter01"
    label     = "example"
    password  = "your-password-here"
    username  = "terraform"
    filter    = "$contains(Terraform)"
  }
}


#process monitoring Values

host_group_id = "environment"
aspnetcore = false
cf_appsmanagerjs = false
container = false
docker_pauseamd64 = false
exe_bbs = false
exe_caddy = false
exe_schedular = false
exe_silkdaemon = false
go_static = false
node_nodegyp = false

process_availability_enabled = true
process_availability_name = "Process Availability Rule"
process_availability_rule_property = "executable"
process_availability_rule_condition = "$contains(svc)"
process_availability_metadata_key = "foo"
process_availability_metadata_value = "bar"

process_monitoring_host_group_id = "HOST_GROUP-0000000000000000"
process_monitoring_auto_monitoring = true

process_monitoring_rule_enabled = true
process_monitoring_rule_mode = "MONITORING_OFF"
process_monitoring_rule_host_group_id = "HOST_GROUP-0000000000000000"
process_monitoring_rule_condition_item = "APACHE_CONFIG_PATH"
process_monitoring_rule_condition_operator = "STARTS"
process_monitoring_rule_condition_value = "foo-bar-x"

process_visibility_enabled = true
process_visibility_max_processes = 80
process_visibility_scope = "environment"


#Ownership Values


team_name                       = "example_team"
team_description                = "Created by Terraform"
team_identifier                 = "Terraform"
team_external_id                = "external-id-example"

responsibility_development      = true
responsibility_infrastructure   = false
responsibility_line_of_business = false
responsibility_operations       = true
responsibility_security         = false

additional_info_key   = "HashiCorp"
additional_info_value = "Terraform"
additional_info_url   = "https://www.terraform.io/"

contact_integration_type        = "JIRA"
contact_jira_default_assignee   = "example_assignee"
contact_jira_project            = "example_project"
contact_ms_teams                = "example_team@teams.microsoft.com"
contact_slack_channel           = "#example_team_channel"
contact_url                     = "https://www.example.com/contact"

link_type = "URL"
link_url  = "https://www.google.com"

supplementary_identifier = "supplementary-id-example"

#RUM Values

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


# monitored entities Values

custom_device_id = "customDeviceId"
display_name     = "customDevicename"
config_url       = "https://config.url"
dns_names        = ["dns1.example.com", "dns2.example.com"]
favicon_url      = "https://favicon.url/icon.png"
group            = "customGroup"
ip_addresses     = ["192.168.1.1", "192.168.1.2"]
listen_ports     = [80, 443]
props            = "key1=value1,key2=value2"
type             = "customType"
ui_based         = true

# Metric Values

custom_units_name        = "example_unit"
custom_units_description = "Created by Terraform"
custom_units_plural_name = "TerraformUnits"
custom_units_symbol      = "T/u"

histogram_metrics_enable_histogram_bucket_ingest = false

metric_metadata_display_name = "example_metric"
metric_metadata_metric_id    = "metric-func:slo.terraform-test"
metric_metadata_unit         = "percent"

metric_query_metric_id       = "metric-func:slo.terraform-test"
metric_query_metric_selector = "((100*(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())/(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())) - (95.0))"


#Grail Values

segment_name        = "example-segment"
segment_description = "Example description"
segment_is_public   = true

segment_query = <<-EOT
  fetch dt.entity.kubernetes_cluster
  | fields cluster = entity.name
  | sort cluster
EOT

includes_items = [
  {
    data_object = "_all_data_object"
    filter = <<EOT
{
  "children": [
    {
      "key": {
        "range": { "from": 0, "to": 16 },
        "textValue": "k8s.cluster.name",
        "type": "Key",
        "value": "k8s.cluster.name"
      },
      "operator": {
        "range": { "from": 17, "to": 18 },
        "textValue": "=",
        "type": "ComparisonOperator",
        "value": "="
      },
      "range": { "from": 0, "to": 27 },
      "type": "Statement",
      "value": {
        "range": { "from": 19, "to": 27 },
        "textValue": "$cluster",
        "type": "String",
        "value": "$cluster"
      }
    }
  ],
  "explicit": false,
  "logicalOperator": "AND",
  "range": { "from": 0, "to": 27 },
  "type": "Group"
}
EOT
    relationship = null
  },
  {
    data_object = "dt.entity.cloud_application"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.cloud_application_instance"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.cloud_application_namespace"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.container_group_instance"
    filter      = ""
    relationship = {
      name   = "belongs_to"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.host"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.kubernetes_cluster"
    filter = <<EOT
{
  "children": [
    {
      "key": {
        "range": { "from": 0, "to": 11 },
        "textValue": "entity.name",
        "type": "Key",
        "value": "entity.name"
      },
      "operator": {
        "range": { "from": 12, "to": 13 },
        "textValue": "=",
        "type": "ComparisonOperator",
        "value": "="
      },
      "range": { "from": 0, "to": 22 },
      "type": "Statement",
      "value": {
        "range": { "from": 14, "to": 22 },
        "textValue": "$cluster",
        "type": "String",
        "value": "$cluster"
      }
    }
  ],
  "explicit": false,
  "logicalOperator": "AND",
  "range": { "from": 0, "to": 22 },
  "type": "Group"
}
EOT
    relationship = null
  },
  {
    data_object = "dt.entity.kubernetes_node"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.kubernetes_service"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  },
  {
    data_object = "dt.entity.service"
    filter      = ""
    relationship = {
      name   = "clustered_by"
      target = "dt.entity.kubernetes_cluster"
    }
  }
]


# Management zone Values

zone_name        = "example_zone"
zone_description = "This is an example management zone"
zone_legacy_id   = "legacy-id-example"
entity_selector  = ""
