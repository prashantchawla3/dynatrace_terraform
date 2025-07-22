jenkins_connections = [
  {
    name     = "jenkins-conn-1"
    url      = "https://jenkins.example.com/"
    username = "jenkins_user"
    password = ""  # Injected securely
  }
]

github_connections = [
  {
    name  = "github-conn-1"
    type  = "Pat"
    token = ""  # Injected securely
  }
]

gitlab_connections = [
  {
    name  = "gitlab-conn-1"
    url   = "https://gitlab.com"
    token = ""  # Injected securely
  }
]

ms365_email_connections = [
  {
    name          = "ms365-email-conn-1"
    client_id     = ""  # Injected securely
    tenant_id     = ""  # Injected securely
    from_address  = "monitoring@example.com"
    type          = "client_secret"
    client_secret = ""  # Injected securely
  }
]

msentraid_connections = [
  {
    name           = "msentra-conn-1"
    application_id = ""  # Injected securely
    directory_id   = ""  # Injected securely
    client_secret  = ""  # Injected securely
    description    = "Optional description"
  }
]

msteams_connections = [
  {
    name         = "msteams-conn-1"
    webhook      = ""  # Injected securely
    team_name    = "My Team"
    channel_name = "alerts"
  }
]

pagerduty_connections = [
  {
    name  = "pagerduty-conn-1"
    token = ""  # Injected securely
    url   = "https://api.pagerduty.com"
  }
]

servicenow_connections = [
  {
    name     = "servicenow-conn-1"
    url      = "https://instance.service-now.com"
    type     = "basic"
    user     = ""  # Injected securely
    password = ""  # Injected securely
  }
]
