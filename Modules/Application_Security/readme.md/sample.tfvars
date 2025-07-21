notifications = [
  {
    type                   = "WEBHOOK"
    enabled                = true
    display_name           = "Security Notification Webhook"
    alerting_profile       = "builtin:appsec.notification-alerting-profile"
    trigger                = "SECURITY_PROBLEM"
    payload                = "{\"DavisSecurityScore\":\"{DavisSecurityScore}\",\"SecurityProblemId\":\"{SecurityProblemId}\",\"SecurityProblemUrl\":\"{SecurityProblemUrl}\",\"Severity\":\"{Severity}\"}"
    accept_any_certificate = false
    url                    = "https://example.com/webhook"
  }
]

attack_alerting_names = [
  "Default Attack Alerting"
]

attack_alerting_enabled = true

enabled_attack_mitigations = [
  "NONE_ALLOWLISTED",
  "BLOCKED_WITH_EXCEPTION",
  "NONE_BLOCKING_DISABLED"
]

attack_allowlists = [
  {
    enabled           = true
    insert_after      = ""
    rule_name         = "Allowlist Rule 1"
    blocking_strategy = "MONITOR"
    comment           = "Allowlist for known safe IPs"
    conditions = [
      {
        matcher = "EQUALS"
        key     = "HOST_GROUP"
        value   = "frontend"
      }
    ]
    rules = [
      {
        key     = "ACTOR_IP"
        matcher = "EQUALS"
        value   = "192.168.1.1"
      }
    ]
  }
]

attack_rules = [
  {
    attack_type       = "ANY"
    enabled           = true
    comment           = "Monitor all attacks"
    blocking_strategy = "MONITOR"
  }
]

attack_settings = [
  {
    enabled                = true
    blocking_strategy_java = "MONITOR"
  }
]

kubernetes_spm = [
  {
    scope                             = "environment"
    configuration_dataset_pipeline_enabled = true
  }
]

management_zones = [
  {
    name            = "Frontend Zone"
    type            = "ME"
    enabled         = true
    entity_selector = ""
    entity_type     = "SERVICE"
    case_sensitive  = false
    key             = "SERVICE_NAME"
    operator        = "EQUALS"
    string_value    = "frontend-service"
  }
]

vulnerability_alerting = [
  {
    name                   = "Critical Vulnerability Alert"
    enabled                = true
    enabled_risk_levels    = ["LOW", "MEDIUM", "HIGH", "CRITICAL"]
    enabled_trigger_events = ["SECURITY_PROBLEM_OPENED"]
  }
]

vulnerability_code = [
  {
    enabled         = true
    comment         = "Disable code-level detection for legacy services"
    monitoring_mode = "MONITORING_OFF"
  }
]

vulnerability_settings = [
  {
    enable_code_level_vulnerability_detection = false
    enable_runtime_vulnerability_detection    = true
    global_monitoring_mode_java               = "MONITORING_OFF"
    enable_dot_net         = true
    enable_dot_net_runtime = true
    enable_go              = true
    enable_java            = true
    enable_java_runtime    = true
    enable_kubernetes      = true
    enable_node_js         = true
    enable_node_js_runtime = true
    enable_php             = true
  }
]

vulnerability_third_party = [
  {
    enabled  = true
    mode     = "MONITORING_OFF"
    operator = "EQUALS"
    property = "PROCESS_TAG"
    value    = "third-party-lib"
  }
]
