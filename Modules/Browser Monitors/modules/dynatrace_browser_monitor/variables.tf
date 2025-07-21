variable "browser_monitors" {
  description = "List of browser monitor configurations"
  type = list(object({
    name            = string
    enabled         = optional(bool)
    frequency       = number
    locations       = optional(list(string))
    load_action_kpm = optional(string)
    xhr_action_kpm  = optional(string)

    script_events = list(object({
      description = string
      navigate    = optional(object({ url = string }))
      click = optional(object({
        button = number
        target = object({
          locators = list(object({
            type  = string
            value = string
          }))
        })
      }))
      keystrokes = optional(object({
        text = string
        target = object({
          locators = list(object({
            type  = string
            value = string
          }))
        })
      }))
    }))

    global_outages                            = optional(bool)
    local_outages                             = optional(bool)
    retry_on_error                            = optional(bool)
    global_consecutive_outage_count_threshold = optional(number)
    local_consecutive_outage_count_threshold  = optional(number)
    local_location_outage_count_threshold     = optional(number)

    performance_enabled   = optional(bool)
    performance_event     = optional(string)
    performance_threshold = optional(number)
  }))
  default = [
    {
      name        = "HomePageMonitor"
      enabled     = true
      frequency   = 5
      locations   = ["GEOLOCATION-1", "GEOLOCATION-2"]
      load_action_kpm = "load_time"
      xhr_action_kpm  = "api_call"

      script_events = [
        {
          description = "Navigate to homepage"
          navigate = {
            url = "https://example.com"
          }
        },
        {
          description = "Click login"
          click = {
            button = 1
            target = {
              locators = [
                { type = "id", value = "login-button" }
              ]
            }
          }
        },
        {
          description = "Enter username"
          keystrokes = {
            text = "testuser"
            target = {
              locators = [
                { type = "id", value = "username-field" }
              ]
            }
          }
        }
      ]

      global_outages                            = true
      local_outages                             = true
      retry_on_error                            = true
      global_consecutive_outage_count_threshold = 3
      local_consecutive_outage_count_threshold  = 2
      local_location_outage_count_threshold     = 1

      performance_enabled   = true
      performance_event     = "load"
      performance_threshold = 2000
    }
  ]
}
