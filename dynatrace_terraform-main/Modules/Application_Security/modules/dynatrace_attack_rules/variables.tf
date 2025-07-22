variable "attack_rules" {
  description = "List of attack rules"
  type = list(object({
    attack_type       = string
    enabled           = bool
    comment           = string
    blocking_strategy = string
  }))
  default = []
}