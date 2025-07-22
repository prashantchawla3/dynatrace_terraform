network_monitors = {
  dns_test = {
    name          = "DNS Test"
    description   = "This is an example DNS test"
    type          = "MULTI_PROTOCOL"
    enabled       = false
    frequency_min = 15
    locations     = ["SYNTHETIC_LOCATION-39F97465BE7BF644"]

    outage_handling = {
      global_consecutive_outage_count_threshold = 1
      global_outages                            = true
    }

    performance_thresholds = {
      enabled = true
      thresholds = [
        {
          aggregation        = "AVG"
          dealerting_samples = 5
          samples            = 5
          step_index         = 0
          threshold          = 100
          violating_samples  = 3
        }
      ]
    }

    steps = [
      {
        name           = "DNS Test"
        request_type   = "DNS"
        target_list    = ["google.com", "yahoo.com"]
        properties     = {
          DNS_RECORD_TYPES   = "A"
          EXECUTION_TIMEOUT  = "PT2S"
        }
        constraints = [
          {
            type       = "SUCCESS_RATE_PERCENT"
            properties = {
              value    = "90"
              operator = ">="
            }
          }
        ]
        request_configurations = [
          {
            constraints = [
              {
                type       = "DNS_STATUS_CODE"
                properties = {
                  operator   = "="
                  statusCode = "0"
                }
              }
            ]
          }
        ]
      }
    ]

    tags = [
      {
        context = "CONTEXTLESS"
        key     = "Key1"
        source  = "USER"
        value   = "Value1"
      }
    ]
  }
}

network_monitor_outages = {
  default = {
    global_outages                          = true
    global_consecutive_outage_count_threshold = 5
    local_outages                           = true
    local_consecutive_outage_count_threshold = 3
    local_location_outage_count_threshold   = 1
  }
}
