variable "attack_allowlists" {
  description = "List of attack allowlist configurations"
  type = list(object({
    enabled           = bool
    insert_after      = string
    rule_name         = string
    blocking_strategy = string
    comment           = string
    conditions = list(object({
      matcher = string
      key     = string
      value   = string
    }))
    rules = list(object({
      key     = string
      matcher = string
      value   = string
    }))
  }))
}