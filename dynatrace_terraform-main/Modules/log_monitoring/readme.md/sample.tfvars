resources = {
  log_agent_feature_flags = {
    example = {
      scope = "HOST-1234567890000000"
      new_container_log_detector = true
    }
  }

  log_buckets = {
    example = {
      enabled     = true
      bucket_name = "default_logs"
      matcher     = "matchesPhrase(content, \"error\")"
      rule_name   = "example"
    }
  }

  log_custom_attribute = {
    example = {
      sidebar = false
      key     = "example"
    }
  }

  log_custom_source = {
    example = {
      name    = "example"
      enabled = false
      scope   = "HOST_GROUP-1234567890000000"
      custom_log_source = {
        type = "WINDOWS_EVENT_LOG"
        values_and_enrichment = [
          {
            custom_log_source_with_enrichment = {
              path = "/terraform"
              enrichment = [
                { type = "attribute", key = "key1", value = "value1" },
                { type = "attribute", key = "key2", value = "value2" }
              ]
            }
          }
        ]
      }
    }
  }

  log_debug_settings = {
    example = {
      enabled = false
    }
  }

  log_events = {
    example = {
      enabled = false
      query   = "matchesPhrase(content, \"terratest\")"
      summary = "Created by Terraform"
      event_template = {
        description = "Created by Terraform"
        event_type  = "INFO"
        title       = "{content}"
        metadata = {
          items = [
            {
              metadata_key   = "terraform.key"
              metadata_value = "terraform.value"
            }
          ]
        }
      }
    }
  }

  log_metrics = {
    example = {
      enabled           = true
      dimensions        = ["dt.os.type", "dt.entity.process_group"]
      key               = "log.terraformexample3"
      measure           = "ATTRIBUTE"
      measure_attribute = "dt.entity.host"
      query             = "matchesPhrase(content, \"terratest\")"
    }
  }

  log_oneagent = {
    example = {
      container_timezone_heuristic_enabled = true
      containers_logs_detection_enabled    = true
      date_search_limit_bytes              = 64
      default_timezone                     = "Local time zone"
      event_log_query_timeout_sec          = 5
      iisdetection_enabled                 = true
      log_scanner_linux_nfs_enabled        = false
      max_lgis_per_entity_count            = 200
      min_binary_detection_limit_bytes     = 512
      monitor_own_logs_enabled             = false
      open_log_files_detection_enabled     = true
      scope                                = "environment"
      severity_detection_limit_bytes       = 100
      severity_detection_lines_limit       = 2
      system_logs_detection_enabled        = true
    }
  }

  log_processing = {
    example = {
      enabled   = false
      query     = "matchesPhrase(content, \"terratest\")"
      rule_name = "example"
      processor_definition = {
        rule = <<-EOT
          PARSE(content,"LD 'total: ' INT:total '; failed: ' INT:failed")
          FIELDS_ADD(failed.percentage: 100.0 * failed / total + '%')
          FIELDS_REMOVE(total, failed)
        EOT
      }
      rule_testing = {
        sample_log = "{\"content\": \"\"}"
      }
    }
  }

  log_security_context = {
    example = {
      security_context_rule = {
        query              = "matchesPhrase(content, \"example\")"
        rule_name          = "example"
        value_source_field = "example"
        value_source       = "FIELD"
      }
    }
  }

  log_sensitive_data_masking = {
    example = {
      name    = "example"
      enabled = true
      scope   = "environment"
      masking = [
        {
          type       = "SHA1"
          expression = "FOO"
        }
      ]
      matchers = [
        {
          matcher = [
            {
              attribute = "container.name"
              operator  = "MATCHES"
              values    = ["jlkjk"]
            }
          ]
        }
      ]
    }
  }

  log_storage = {
    example = {
      name            = "example"
      enabled         = false
      scope           = "HOST_GROUP-1234567890000000"
      send_to_storage = false
      matchers = [
        {
          matcher = [
            {
              attribute = "container.name"
              operator  = "MATCHES"
              values    = ["TerraformTest"]
            }
          ]
        }
      ]
    }
  }

  log_timestamp = {
    example = {
      enabled           = false
      config_item_title = "example"
      date_time_pattern = "%m/%d/%Y %I:%M:%S %p"
      scope             = "environment"
      timezone          = "America/Detroit"
      matchers = [
        {
          matcher = [
            {
              attribute = "container.name"
              operator  = "MATCHES"
              values    = ["terraform"]
            }
          ]
        }
      ]
    }
  }
}
