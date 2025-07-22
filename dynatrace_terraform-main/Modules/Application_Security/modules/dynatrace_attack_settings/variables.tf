variable "attack_settings" {
  description = "List of attack settings"
  type = list(object({
    enabled                = bool
    blocking_strategy_java = string
  }))
  default = []
}