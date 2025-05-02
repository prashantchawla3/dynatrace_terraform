dynatrace_api_url = "https://your-dynatrace-instance/api"

dynatrace_api_token = "your-api-token"

dashboards = [
  {
    name            = "Sample Dashboard 1"
    description     = "This is a sample dashboard"
    dashboard_id    = "sample_dashboard_1"
    layout_type     = "GRID"
    sharing         = "PRIVATE"
    management_zone = "Zone 1" # Added management zone
    widgets = [
      {
        name     = "Widget 1"
        type     = "CHART"
        size     = "MEDIUM"
        position = "TOP_LEFT"
        settings = {
          "metric" = "cpu_usage"
          "type"   = "LINE"
        }
      }
    ]
  },
  {
    name            = "Sample Dashboard 2"
    description     = "Another dashboard"
    dashboard_id    = "sample_dashboard_2"
    layout_type     = "GRID"
    sharing         = "PUBLIC"
    management_zone = "Zone 2" # Added management zone
    widgets = [
      {
        name     = "Widget 2"
        type     = "TABLE"
        size     = "LARGE"
        position = "BOTTOM_RIGHT"
        settings = {
          "metric" = "memory_usage"
          "type"   = "TABLE"
        }
      }
    ]
  }
]
