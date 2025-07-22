browser_monitors = [
  {
    name      = "HomepageMonitor"
    enabled   = true
    frequency = 5
    locations = ["GEOLOCATION-B4B9167CAAA88F6A", "GEOLOCATION-03E96F97A389F96A"]

    load_action_kpm = "VISUALLY_COMPLETE"
    xhr_action_kpm  = "RESPONSE_END"

    script_events = [
      {
        description = "Navigate to homepage"
        navigate = {
          url = "https://example.com"
        }
      },
      {
        description = "Click login button"
        click = {
          button = 0
          target = {
            locators = [
              {
                type  = "css"
                value = "#login-button"
              }
            ]
          }
        }
      },
      {
        description = "Enter username"
        keystrokes = {
          text = "my-username"
          target = {
            locators = [
              {
                type  = "css"
                value = "#username"
              }
            ]
          }
        }
      }
    ]

    global_outages  = false
    local_outages   = false
    retry_on_error  = false

    performance_enabled   = true
    performance_event     = "LOAD"
    performance_threshold = 3000
  }
]
