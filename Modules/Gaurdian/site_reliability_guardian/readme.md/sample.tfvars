
environment_url         = "https://your-env.live.dynatrace.com"
dynatrace_client_id     = "your-client-id"
dynatrace_client_secret = "your-client-secret"
guardian_name           = "My Guardian"
guardian_tags           = ["team:devops", "env:prod"]

objectives = [
  {
    name                = "Error rate"
    objective_type      = "DQL"
    dql_query           = <<-EOT
      fetch logs
      | fieldsAdd errors = toLong(loglevel == "ERROR")
      | summarize errorRate = sum(errors)/count() * 100
    EOT
    comparison_operator = "LESS_THAN_OR_EQUAL"
    target              = 10
    warning             = 8
  }
]
