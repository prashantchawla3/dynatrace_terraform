custom_services = [
  {
    name       = "java-first"
    technology = "java"
    enabled    = true
    queue_entry_point = false
    rules = [
      {
        enabled     = true
        class_name  = "com.example.Prefix"
        class_match = "EQUALS"
        annotations = ["com.example.ExampleAnnotation"]
        methods = [
          {
            name      = "methodA"
            arguments = ["java.lang.String", "java.lang.String"]
            returns   = "java.lang.String"
          },
          {
            name    = "methodB"
            returns = "void"
          }
        ]
      }
    ]
  }
]

custom_service_order = {
  dotnet = ["dynatrace_custom_service.dotnet-first.id", "dynatrace_custom_service.dotnet-second.id"]
  java   = ["dynatrace_custom_service.java-first.id", "dynatrace_custom_service.java-second.id"]
}

management_zones = [
  {
    name = "my-mgmz"
    rules = [
      {
        type            = "ME"
        enabled         = true
        entity_selector = ""
        entity_type     = "CLOUD_APPLICATION_NAMESPACE"
        condition = {
          case_sensitive = false
          key            = "KUBERNETES_CLUSTER_NAME"
          operator       = "EQUALS"
          string_value   = "extensions"
        }
      }
    ]
  }
]

external_web_requests = [
  {
    name            = "external-web-request-1"
    enabled         = false
    management_zone = "dynatrace_management_zone_v2.my-mgmz.id"
    conditions = [
      {
        attribute              = "ApplicationId"
        compare_operation_type = "StringEquals"
        ignore_case            = false
        text_values            = ["Terraform"]
      }
    ]
    id_contributors = {
      port_for_service_id = true
      application_id = {
        enable_id_contributor = true
        contribution_type     = "OriginalValue"
        value_override        = null
      }
      context_root = {
        enable_id_contributor = true
        contribution_type     = "OverrideValue"
        value_override        = "Terraform"
      }
      public_domain_name = {
        enable_id_contributor = true
        contribution_type     = "TransformValue"
        copy_from_host_name   = true
        transformations       = ["REMOVE_IPS"]
      }
    }
  }
]

full_web_requests = [
  {
    name            = "full-web-request-1"
    enabled         = false
    management_zone = "dynatrace_management_zone_v2.my-mgmz.id"
    conditions = [
      {
        attribute              = "UrlPath"
        compare_operation_type = "StringStartsWith"
        ignore_case            = true
        text_values            = ["Terraform"]
      }
    ]
    id_contributors = {
      application_id = {
        enable_id_contributor = true
        contribution_type     = "OverrideValue"
        value_override        = "Terraform"
      }
      context_root = {
        enable_id_contributor = true
        contribution_type     = "TransformURL"
        segment_count         = 2
        transformations = [
          {
            transformation_type   = "REMOVE_NUMBERS"
            include_hex_numbers  = true
            min_digit_count      = 1
          }
        ]
      }
      server_name = {
        enable_id_contributor = true
        contribution_type     = "OriginalValue"
      }
    }
  }
]

full_web_services = [
  {
    name            = "full-web-service-1"
    enabled         = true
    management_zone = "dynatrace_management_zone_v2.my-mgmz.id"
    conditions = [
      {
        attribute              = "HostName"
        compare_operation_type = "StringEndsWith"
        ignore_case            = true
        text_values            = ["Terraform"]
      }
    ]
    id_contributors = {
      detect_as_web_request_service = true
    }
  }
]

unified_services_metrics = [
  {
    enable_endpoint_metrics = true
    service_id              = "environment"
  }
]

unified_services_opentel = [
  {
    enabled = true
  }
]

service_detection_rules = {
  "example" = {
    enabled = false
    scope   = "environment"
    rules = [{
      description                   = "Example description"
      additional_required_attributes = ["attribute-1", "attribute-2"]
      condition                     = "matchesValue(k8s.cluster.name,\"terraform\")"
      rule_name                     = "example"
      service_name_template         = "{k8s.workload.name}"
    }]
  }
}

external_web_services = {
  "example" = {
    name             = "example"
    description      = "Created by Terraform"
    enabled          = false
    management_zones = ["dynatrace_management_zone_v2.my-mgmz.id"]
    conditions = [{
      condition = [{
        attribute              = "UrlPath"
        compare_operation_type = "StringContains"
        ignore_case            = true
        text_values            = ["Terraform"]
      }]
    }]
    id_contributors = {
      detect_as_web_request_service = false
      port_for_service_id           = true
      url_path = {
        enable_id_contributor = true
        service_id_contributor = {
          contribution_type = "OverrideValue"
          value_override = {
            value = "Terraform"
          }
        }
      }
    }
  }
}

service_splitting_rules = {
  "example" = {
    enabled = false
    scope   = "environment"
    rules = [{
      description   = "Example description"
      condition     = "matchesValue(k8s.cluster.name, \"terraform\")"
      rule_name     = "example"
      service_splitting_attributes = [
        { key = "Attribute-1" },
        { key = "Attribute-2" },
        { key = "Attribute-3" }
      ]
    }]
  }
}
