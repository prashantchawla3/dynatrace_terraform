#  Dynatrace Application Security, Vulnerability, and Monitoring Modules

This Terraform module suite configures and integrates Dynatrace security rules, vulnerability monitoring, webhook notifications, and runtime protection for Kubernetes environments and other services. It enables fine-grained defense customization, alerting automation, and secure observability pipelines.

---

##  Module Overview

| Module                                | Resource(s) Provisioned                           | Description |
|---------------------------------------|---------------------------------------------------|-------------|
| `dynatrace_appsec_notification`       | Webhook-based security event notifications        | Sends alerts to external systems via HTTP |
| `dynatrace_attack_alerting`           | Attack alerting toggles and mitigations           | Enables detection and mitigation triggers |
| `dynatrace_atack_allowlist`           | Custom allowlist rules                            | Bypasses specified traffic or entities |
| `dynatrace_attack_rules`              | Rule-based detection logic                        | Filters or blocks events using matchers |
| `dynatrace_attack_settings`           | Global attack prevention strategy                 | Controls Java blocking and feature toggle |
| `dynatrace_kubernetes_spm`            | Kubernetes Smartscape Pipeline Monitoring         | Enables dataset-level tracking |
| `dynatrace_management_zone_v2`        | Management zone definitions                       | Segments monitored entities logically |
| `dynatrace_vulnerability_alerting`    | Vulnerability alerting profiles                   | Triggers alerts based on risk level and event type |
| `dynatrace_vulnerability_code`        | Code-level vulnerability tracking                 | Enables per-application monitoring |
| `dynatrace_vulnerability_settings`    | Global vulnerability scanner config               | Language and runtime support toggles |
| `dynatrace_vulnebality_third_party`   | 3rd-party vulnerability matching                  | Detects risky external libraries |

---

##  Key Variables

###  `notifications` (Webhook Configuration)

| Field | Type | Description |
|-------|------|-------------|
| `type` | `string` | Webhook type, e.g. `"WEBHOOK"` |
| `enabled` | `bool` | Enables delivery |
| `display_name` | `string` | Name shown in UI |
| `alerting_profile` | `string` | Associated alerting profile |
| `trigger` | `string` | Event trigger condition |
| `payload` | `string` | Webhook JSON content |
| `accept_any_certificate` | `bool` | If true, skips TLS validation |
| `url` | `string` | Target endpoint |

 Example:
```hcl
notifications = [
  {
    type = "WEBHOOK"
    enabled = true
    display_name = "Security Webhook"
    alerting_profile = "HighRisk"
    trigger = "SECURITY_PROBLEM_OPENED"
    payload = "{\"summary\":\"Security Alert\"}"
    accept_any_certificate = true
    url = "https://hooks.example.com/dynatrace"
  }
]
