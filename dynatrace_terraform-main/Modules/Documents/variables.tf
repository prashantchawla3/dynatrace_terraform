variable "default_launchpads" {
  description = "Mapping of launchpad presets grouped by team or user group. Each launchpad entry includes visibility state, launchpad ID, and associated group."
  type = map(object({
    group_launchpads = list(object({
      is_enabled    = bool
      launchpad_id  = string
      user_group_id = string
    }))
  }))
  default = {
    operations = {
      group_launchpads = [
        { is_enabled = true,  launchpad_id = "lp-001", user_group_id = "ops-group" },
        { is_enabled = false, launchpad_id = "lp-002", user_group_id = "legacy-group" }
      ]
    },
    engineering = {
      group_launchpads = [
        { is_enabled = true, launchpad_id = "lp-003", user_group_id = "eng-group" }
      ]
    }
  }
}

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

variable "direct_shares" {
  description = "Mapping of document keys to direct sharing rules. Each rule specifies access level and recipient list with ID and type (e.g., user or group)."
  type = map(object({
    document_key = string
    access       = string
    recipients = list(object({
      id   = string
      type = string
    }))
  }))
  default = {
    sys_overview_share = {
      document_key = "sys_overview"
      access       = "read-only"
      recipients   = [
        { id = "alice", type = "user" },
        { id = "monitoring-team", type = "group" }
      ]
    }
  }
}
