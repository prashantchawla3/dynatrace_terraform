variable "notifications" {
  description = "List of webhook notifications"
  type = list(object({
    type                   = string
    enabled                = bool
    display_name           = string
    alerting_profile       = string
    trigger                = string
    payload                = string
    accept_any_certificate = bool
    url                    = string
  }))
}

variable "attack_alerting_names" {
  description = "List of attack alerting configuration names"
  type        = list(string)
}

variable "attack_alerting_enabled" {
  description = "Enable or disable attack alerting"
  type        = bool
}

variable "enabled_attack_mitigations" {
  description = "List of enabled attack mitigations"
  type        = list(string)
}

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

variable "attack_rules" {
  description = "List of attack rules"
  type = list(object({
    attack_type       = string
    enabled           = bool
    comment           = string
    blocking_strategy = string
  }))
}

variable "attack_settings" {
  description = "List of attack settings"
  type = list(object({
    enabled                = bool
    blocking_strategy_java = string
  }))
}

variable "kubernetes_spm" {
  description = "List of Kubernetes SPM configurations"
  type = list(object({
    scope                                  = string
    configuration_dataset_pipeline_enabled = bool
  }))
}

variable "management_zones" {
  description = "List of management zones"
  type = list(object({
    name            = string
    type            = string
    enabled         = bool
    entity_selector = string
    entity_type     = string
    case_sensitive  = bool
    key             = string
    operator        = string
    string_value    = string
  }))
}

variable "vulnerability_alerting" {
  description = "List of vulnerability alerting configurations"
  type = list(object({
    name                   = string
    enabled                = bool
    enabled_risk_levels    = list(string)
    enabled_trigger_events = list(string)
  }))
}

variable "vulnerability_code" {
  description = "List of vulnerability code configurations"
  type = list(object({
    enabled         = bool
    comment         = string
    monitoring_mode = string
  }))
}

variable "vulnerability_settings" {
  description = "List of vulnerability settings"
  type = list(object({
    enable_code_level_vulnerability_detection = bool
    enable_runtime_vulnerability_detection    = bool
    global_monitoring_mode_java               = string
    enable_dot_net                            = bool
    enable_dot_net_runtime                    = bool
    enable_go                                 = bool
    enable_java                               = bool
    enable_java_runtime                       = bool
    enable_kubernetes                         = bool
    enable_node_js                            = bool
    enable_node_js_runtime                    = bool
    enable_php                                = bool
  }))
}

variable "vulnerability_third_party" {
  description = "List of third-party vulnerability configurations"
  type = list(object({
    enabled  = bool
    mode     = string
    operator = string
    property = string
    value    = string
  }))
}
