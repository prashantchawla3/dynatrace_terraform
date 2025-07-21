

## dynatrace_appsec_notification

**Required API Token Scopes:**
- `securityProblems.read`
- `securityProblems.write`

**How to determine tfvars values:**
- Check Dynatrace under *Application Security > Security Notifications* to find or configure alerting profiles, webhook URLs, and payload formats.

**Schema:**
- **Required:**
  - `display_name` (String)
  - `enabled` (Boolean)
  - `trigger` (String)
  - `type` (String)
- **Optional:**
  - `attack_candidate_based_alerting_profile` (String)
  - `attack_candidate_based_email_payload` (Block)
  - `attack_candidate_based_jira_payload` (Block)
  - `attack_candidate_based_webhook_payload` (Block)
  - `email_configuration` (Block)
  - `jira_configuration` (Block)
  - `security_problem_based_alerting_profile` (String)
  - `security_problem_based_email_payload` (Block)
  - `security_problem_based_jira_payload` (Block)
  - `security_problem_based_webhook_payload` (Block)
  - `webhook_configuration` (Block)
- **Read-Only:**
  - `id` (String)
- **Nested:**
  - `webhook_configuration.headers.header`
  - `email_payload`, `jira_payload`, `webhook_payload` for both attack and security problem triggers

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_appsec_notification` to retrieve existing configurations.

---

## dynatrace_attack_alerting

**Required API Token Scopes:**
- `securityProblems.read`
- `securityProblems.write`

**How to determine tfvars values:**
- Navigate to *Application Security > Runtime Application Protection > Alerting Profiles* in Dynatrace.

**Schema:**
- **Required:**
  - `enabled` (Boolean)
  - `name` (String)
- **Optional:**
  - `enabled_attack_mitigations` (Set of String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
- Use `data "dynatrace_attack_alerting"` with `name` to retrieve the profile ID.

---

## dynatrace_attack_allowlist

**Required API Token Scopes:**
- `attacks.read`
- `attacks.write`

**How to determine tfvars values:**
- Review allowlist rules in *Application Security > Runtime Application Protection > Allowlist*.

**Schema:**
- **Required:**
  - `attack_handling` (Block)
  - `enabled` (Boolean)
  - `metadata` (Block)
  - `rules` (Block)
- **Optional:**
  - `criteria` (Deprecated Block)
  - `insert_after` (String)
  - `resource_attribute_conditions` (Block)
  - `rule_name` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_attack_allowlist` to retrieve existing allowlist configurations.

---

## dynatrace_attack_rules

**Required API Token Scopes:**
- `attacks.read`
- `attacks.write`

**How to determine tfvars values:**
- Check *Application Security > Runtime Application Protection > Monitoring Rules*.

**Schema:**
- **Required:**
  - `attack_handling` (Block)
  - `criteria` (Block)
  - `enabled` (Boolean)
  - `metadata` (Block)
- **Optional:**
  - `insert_after` (String)
  - `resource_attribute_conditions` (Block)
  - `rule_name` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_attack_rules` to retrieve existing rules.

---

## dynatrace_attack_settings

**Required API Token Scopes:**
- `attacks.read`
- `attacks.write`

**How to determine tfvars values:**
- Review global settings in *Application Security > Runtime Application Protection > Settings*.

**Schema:**
- **Required:**
  - `default_attack_handling` (Block)
  - `enabled` (Boolean)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_attack_settings` to retrieve current settings.

---

## dynatrace_kubernetes_spm

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- Use the Kubernetes cluster ID from Dynatrace under *Security Posture Management*.

**Schema:**
- **Required:**
  - `configuration_dataset_pipeline_enabled` (Boolean)
- **Optional:**
  - `scope` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_kubernetes_spm` to retrieve existing configurations.

---

## dynatrace_vulnerability_alerting

**Required API Token Scopes:**
- `securityProblems.read`
- `securityProblems.write`

**How to determine tfvars values:**
- Check alerting profiles in *Application Security > Vulnerability Analytics*.

**Schema:**
- **Required:**
  - `enabled` (Boolean)
  - `name` (String)
- **Optional:**
  - `enabled_risk_levels` (Set of String)
  - `enabled_trigger_events` (Set of String)
  - `management_zone` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
- Use `data "dynatrace_vulnerability_alerting"` with `name` to retrieve the profile ID.

---


## dynatrace_vulnerability_code

**Required API Token Scopes:**
- `securityProblems.read`
- `securityProblems.write`

**How to determine tfvars values:**
- Review code-level vulnerability rules in *Application Security > Vulnerability Analytics*.

**Schema:**
- **Required:**
  - `enabled` (Boolean)
  - `metadata` (Block)
  - `vulnerability_detection_control` (Block)
- **Optional:**
  - `criteria` (Deprecated Block)
  - `insert_after` (String)
  - `resource_attribute_conditions` (Block)
  - `rule_name` (String)
- **Read-Only:**
  - `id` (String)
- **Nested:**
  - `metadata.comment`
  - `vulnerability_detection_control.monitoring_mode`
  - `resource_attribute_conditions.resource_attribute_condition`

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_vulnerability_code` to retrieve existing rules.

---

## dynatrace_vulnerability_settings

**Required API Token Scopes:**
- `securityProblems.read`
- `securityProblems.write`

**How to determine tfvars values:**
- Review global vulnerability settings in *Application Security > Vulnerability Analytics*.

**Schema:**
- **Required:**
  - `enable_code_level_vulnerability_detection` (Boolean)
  - `enable_runtime_vulnerability_detection` (Boolean)
  - `global_monitoring_mode_java` (String)
  - `technologies` (Block)
- **Optional:**
  - `enable_resource_attribute_rules` (Boolean)
  - `global_monitoring_mode_dot_net` (String)
  - `global_monitoring_mode_go` (String)
  - `global_monitoring_mode_tpv` (String)
- **Read-Only:**
  - `id` (String)
- **Nested:**
  - `technologies` includes:
    - `enable_dot_net`, `enable_go`, `enable_java`, `enable_kubernetes`, `enable_node_js`, `enable_php` (Required)
    - `enable_dot_net_runtime`, `enable_java_runtime`, `enable_node_js_runtime`, `enable_python`, `enable_python_runtime` (Optional)

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_vulnerability_settings` to retrieve current settings.

---

## dynatrace_vulnerability_third_party

**Required API Token Scopes:**
- `securityProblems.read`
- `securityProblems.write`

**How to determine tfvars values:**
- Define rules for third-party vulnerability detection based on tags or zones in Dynatrace.

**Schema:**
- **Required:**
  - `enabled` (Boolean)
  - `mode` (String)
  - `operator` (String)
  - `property` (String)
  - `value` (String)
- **Optional:**
  - `insert_after` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_vulnerability_third_party` to retrieve existing rules.

---
