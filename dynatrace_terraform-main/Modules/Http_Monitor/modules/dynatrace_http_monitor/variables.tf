variable "monitors" {
  description = "List of synthetic monitor definitions, each with optional script, frequency, locations, and outage handling policies."
  type = list(object({
    name      = string
    frequency = number
    locations = list(string)
    no_script = bool
    anomaly_detection = optional(object({
      loading_time_thresholds = optional(map(any))
      outage_handling = optional(object({
        global_outage = bool
        global_outage_policy = object({
          consecutive_runs = number
        })
      }))
    }))
    script = optional(object({
      requests = list(object({
        description     = string
        method          = string
        url             = string
        post_processing = optional(string)
        configuration = object({
          accept_any_certificate = bool
          follow_redirects       = optional(bool)
          headers = optional(list(object({
            name  = string
            value = string
          })))
        })
        validation = optional(object({
          rules = list(object({
            type  = string
            value = string
          }))
        }))
      }))
    }))
  }))
  default = [
    {
      name      = "Homepage Monitor"
      frequency = 5
      locations = ["GEO-US", "GEO-EU"]
      no_script = false
      anomaly_detection = {
        loading_time_thresholds = { TIME_TO_FIRST_BYTE = 800 }
        outage_handling = {
          global_outage = true
          global_outage_policy = { consecutive_runs = 3 }
        }
      }
      script = {
        requests = [
          {
            description = "Open Homepage"
            method      = "GET"
            url         = "https://example.com"
            configuration = {
              accept_any_certificate = true
              follow_redirects       = true
              headers = []
            }
            validation = {
              rules = [{ type = "STATUS_CODE", value = "200" }]
            }
          }
        ]
      }
    }
  ]
}
