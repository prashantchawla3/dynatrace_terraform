browser_monitors = [
  {
    name       = "HomePage Availability Check"
    frequency  = 5
    enabled    = true
    locations  = ["GEOLOCATION-123456"]
    tags       = ["Env:Production","Team:Web"]
    device_profile = {
      screen_width  = 1366
      screen_height = 768
      user_agent    = "CustomUA/1.0"
    }
    key_performance_metrics = {
      load_action_kpm = "VISUALLY_COMPLETE"
      xhr_action_kpm  = "DOC_COMPLETE"
    }
    anomaly_detection = {
      enabled = true
      # ... other anomaly fields ...
    }
    script = [
      {
        type = "clickpath"
        events = [
          {
            description = "Load homepage"
            navigate = {
              url = "https://example.com"
              wait = {
                wait_for = "page_complete"
                timeout  = 30
              }
            }
          },
          {
            description = "Search for item"
            keystrokes = {
              text = "terraform"
              target = {
                locators = [{ type = "css", value = "#search-box" }]
              }
              validate = {
                type          = "text_match"
                fail_if_found = false
                ignore_case   = true
              }
            }
            wait = {
              wait_for = "page_complete"
              timeout  = 20
            }
          },
          {
            description = "Click search"
            click = {
              target = {
                locators = [{ type = "css", value = "#search-button" }]
              }
              wait = {
                wait_for = "page_complete"
                timeout  = 20
              }
            }
          }
        ]
      }
    ]
    outage = {
      global_outages                            = true
      local_outages                             = false
      retry_on_error                            = true
      global_consecutive_outage_count_threshold = 3
      local_consecutive_outage_count_threshold  = 1
      local_location_outage_count_threshold     = 1
    }
    performance = {
      enabled = true
      scope   = "SYNTHETIC_TEST"
      thresholds = [
        { event = "LOAD", threshold = 5.0 },
        { event = "XHR",  threshold = 3.0 }
      ]
    }
  },
  {
    name      = "Login Page Uptime"
    frequency = 10
    enabled   = true
    locations = ["GEOLOCATION-abcdef"]
    tags      = ["Env:Staging"]
    script = [
      {
        type   = "single-url"
        events = [
          {
            description = "Check login page"
            navigate = {
              url = "https://example.com/login"
            }
          }
        ]
      }
    ]
    # No outage/performance block means defaults (no custom alerts)
  }
]
