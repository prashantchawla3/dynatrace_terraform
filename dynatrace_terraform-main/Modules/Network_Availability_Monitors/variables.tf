variable "network_monitors" {
  description = "Map of synthetic network monitors with configuration for schedule, steps, thresholds, and tagging."
  type = map(object({
    name           = string
    description    = string
    type           = string
    enabled        = bool
    frequency_min  = number
    locations      = list(string)

    outage_handling = object({
      global_consecutive_outage_count_threshold = number
      global_outages                            = bool
    })

    performance_thresholds = object({
      enabled    = bool
      thresholds = list(object({
        aggregation        = string
        dealerting_samples = number
        samples            = number
        step_index         = number
        threshold          = number
        violating_samples  = number
      }))
    })

    steps = list(object({
      name               = string
      request_type       = string
      target_list        = list(string)
      properties         = map(string)

      constraints = list(object({
        type       = string
        properties = map(string)
      }))

      request_configurations = list(object({
        constraints = list(object({
          type       = string
          properties = map(string)
        }))
      }))
    }))

    tags = list(object({
      context = string
      key     = string
      source  = string
      value   = string
    }))
  }))
  default = {
    ping_global = {
      name          = "GlobalConnectivity"
      description   = "Monitors global network reachability"
      type          = "PING"
      enabled       = true
      frequency_min = 5
      locations     = ["GEO-US", "GEO-EU", "GEO-APAC"]

      outage_handling = {
        global_consecutive_outage_count_threshold = 3
        global_outages                            = true
      }

      performance_thresholds = {
        enabled    = true
        thresholds = [
          {
            aggregation        = "AVG"
            dealerting_samples = 2
            samples            = 5
            step_index         = 0
            threshold          = 800
            violating_samples  = 3
          }
        ]
      }

      steps = [
        {
          name         = "Ping Main Endpoint"
          request_type = "PING"
          target_list  = ["https://core.site.com", "https://backup.site.com"]
          properties   = {
            retries = "3"
            timeout = "1000"
          }
          constraints = [
            {
              type       = "STATUS_CODE"
              properties = {
                expected_code = "200"
              }
            }
          ]
          request_configurations = [
            {
              constraints = [
                {
                  type       = "CONTAINS"
                  properties = {
                    response_text = "pong"
                  }
                }
              ]
            }
          ]
        }
      ]

      tags = [
        {
          context = "SERVICE"
          key     = "env"
          source  = "USER"
          value   = "production"
        }
      ]
    }
  }
}

variable "network_monitor_outages" {
  description = "Map of outage thresholds scoped by monitor ID, including global and local conditions."
  type = map(object({
    global_outages                          = bool
    global_consecutive_outage_count_threshold = number
    local_outages                           = bool
    local_consecutive_outage_count_threshold = number
    local_location_outage_count_threshold   = number
  }))
  default = {
    ping_global = {
      global_outages                          = true
      global_consecutive_outage_count_threshold = 3
      local_outages                           = true
      local_consecutive_outage_count_threshold = 2
      local_location_outage_count_threshold   = 1
    }
  }
}
