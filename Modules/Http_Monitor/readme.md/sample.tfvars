http_monitor_cookies = [
  {
    enabled = true
    scope   = "HTTP_CHECK-1234567890000000"
    cookies = [
      {
        name   = "SampleName"
        domain = "google.com"
        value  = "SampleValue"
      }
    ]
  }
]

enable_outage_monitoring = true
global_consecutive_outage_count_threshold = 3
global_outages = true
local_consecutive_outage_count_threshold = 5
local_location_outage_count_threshold = 1
local_outages = true
outage_scope = "environment"

performance_monitors = [
  {
    enabled = true
    scope   = "HTTP_CHECK-1234567890000000"
    thresholds = [
      {
        event     = "HTTP_CHECK-1234567890000000"
        threshold = 10
      }
    ]
  }
]

scripts = [
  {
    http_id = "dynatrace_http_monitor.monitor.id"
    requests = [
      {
        description = "request1"
        method      = "GET"
        url         = "http://httpstat.us/200"
        configuration = {
          accept_any_certificate = true
        }
      },
      {
        description = "request2"
        method      = "GET"
        url         = "http://httpstat.us/400"
        configuration = {
          accept_any_certificate = true
        }
      }
    ]
  }
]

monitors = [
  {
    name      = "example-monitor"
    frequency = 1
    locations = ["GEOLOCATION-F3E06A526BE3B4C4"]
    no_script = true
    anomaly_detection = {
      loading_time_thresholds = {}
      outage_handling = {
        global_outage = true
        global_outage_policy = {
          consecutive_runs = 1
        }
      }
    }
    script = null
  }
]
