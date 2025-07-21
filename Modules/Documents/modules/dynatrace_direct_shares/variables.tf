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
