variable "documents" {
  description = "Mapping of documents by key, including type, name, and arbitrary content structure (markdown, HTML, JSON, etc.)."
  type = map(object({
    type    = string
    name    = string
    content = any
  }))
  default = {
    sys_overview = {
      type    = "markdown",
      name    = "System Overview",
      content = "# System Overview\nThis dashboard covers performance KPIs and alerts."
    },
    team_intro = {
      type    = "html",
      name    = "Team Introduction",
      content = "<h1>Welcome</h1><p>Meet the team behind the monitoring stack.</p>"
    }
  }
}
