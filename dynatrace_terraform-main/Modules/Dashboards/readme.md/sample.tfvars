allowlist_urlpatterns = [
  {
    rule     = "equals"
    template = "https://www.terraform.io/"
  },
  {
    rule     = "startsWith"
    template = "https://www.google.com/"
  }
]

enable_public_sharing = false

default_dashboards = [
  {
    dashboard  = "d902df65-2a3e-4c0a-b898-bd4869f224d6"
    user_group = "admin-group"
  }
]

enable_dashboard_presets = true

dashboard_presets = [
  {
    dashboard_preset = "95465fe6-a2c2-1b87-305b-3ec688c32e3b"
    user_group       = "devops-group"
  }
]



json_dashboards = [
  {
    dashboardMetadata = {
      name  = "dashboard-a"
      owner = "me@home.com"
    }
    tiles = [
      {
        bounds = {
          height = 152
          left   = 0
          top    = 0
          width  = 304
        }
        configured = true
        markdown   = "## This is a reference to Dashboard B"
        name       = "Markdown"
        tileType   = "MARKDOWN"
      }
    ]
  },
  {
    dashboardMetadata = {
      name  = "dashboard-b"
      owner = "me@home.com"
    }
    tiles = [
      {
        bounds = {
          height = 152
          left   = 0
          top    = 0
          width  = 304
        }
        configured = true
        markdown   = "## This is a reference to Dashboard A"
        name       = "Markdown"
        tileType   = "MARKDOWN"
      }
    ]
  }
]
