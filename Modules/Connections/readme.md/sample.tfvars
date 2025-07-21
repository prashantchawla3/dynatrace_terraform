dynatrace_api_url   = "https://{your-env-id}.live.dynatrace.com/"
dynatrace_api_token = "YOUR_DYNATRACE_API_TOKEN"

jenkins_connections = [
  {
    name     = "jenkins-conn-1"
    url      = "https://jenkins.example.com/"
    username = "jenkins_user"
    password = "JENKINS_API_TOKEN"    # Sensitive: replace with actual secret
  }
]

github_connections = [
  {
    name  = "github-conn-1"
    type  = "Pat"
    token = "GITHUB_PERSONAL_ACCESS_TOKEN"  # Sensitive
  }
]

gitlab_connections = [
  {
    name  = "gitlab-conn-1"
    url   = "https://gitlab.com"
    token = "GITLAB_TOKEN"  # Sensitive
  }
]

ms365_email_connections = [
  {
    name         = "ms365-email-conn-1"
    client_id    = "YOUR_AZURE_APP_CLIENT_ID"
    tenant_id    = "YOUR_AZURE_TENANT_ID"
    from_address = "monitoring@example.com"
    type         = "client_secret"
    client_secret = "AZURE_APP_CLIENT_SECRET"  # Sensitive
  }
]

msentraid_connections = [
  {
    name           = "msentra-conn-1"
    application_id = "YOUR_AZURE_APP_CLIENT_ID"
    directory_id   = "YOUR_AZURE_TENANT_ID"
    client_secret  = "YOUR_AZURE_APP_CLIENT_SECRET"  # Sensitive
    description    = "Optional description"
  }
]



msteams_connections = [
  {
    name        = "msteams-conn-1"
    webhook     = "https://outlook.office.com/webhook/..."
    team_name   = "My Team"
    channel_name = "alerts"
  }
]

pagerduty_connections = [
  {
    name  = "pagerduty-conn-1"
    token = "PAGERDUTY_TOKEN"  # Sensitive
    url   = "https://api.pagerduty.com"
  }
]

servicenow_connections = [
  {
    name     = "servicenow-conn-1"
    url      = "https://instance.service-now.com"
    type     = "basic"
    user     = "sn_user"
    password = "SN_PASSWORD"  # Sensitive
  }
]
