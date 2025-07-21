

# Terraform Dynatrace Infrastructure Modules

---

## dynatrace_cloud_foundry

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`api_url`**: Use the Cloud Foundry API endpoint (e.g., `https://api.cf.example.com`).
- **`login_url`**: Use the Cloud Foundry login endpoint (e.g., `https://login.cf.example.com`).
- **`username` / `password`**: Use credentials with access to the Cloud Foundry environment.
- **`active_gate_group`**: Optional. Use the name of the ActiveGate group configured in Dynatrace.

### Schema

#### Required
- `api_url` (String)
- `enabled` (Boolean)
- `label` (String)
- `login_url` (String)
- `password` (String, Sensitive)
- `username` (String)

#### Optional
- `active_gate_group` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_k8s_monitoring

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`scope`**: Use the Kubernetes cluster ID (e.g., `KUBERNETES_CLUSTER-xxxxxxxx`).
- **`event_patterns`**: Define filters using Kubernetes field selectors (e.g., `involvedObject.kind=Node`).
- **`open_metrics_*`**: Enable or disable based on your monitoring strategy and resource usage.

### Schema

#### Required
- `cloud_application_pipeline_enabled` (Boolean)
- `event_processing_active` (Boolean)
- `open_metrics_builtin_enabled` (Boolean)
- `open_metrics_pipeline_enabled` (Boolean)

#### Optional
- `event_patterns` (Block)
- `filter_events` (Boolean)
- `include_all_fdi_events` (Boolean)
- `pvc_monitoring_enabled` (Boolean, Deprecated)
- `scope` (String)

#### Read-Only
- `id` (String)

#### Nested Schema for `event_patterns`
- `event_pattern` (Block)
  - `active` (Boolean)
  - `label` (String)
  - `pattern` (String)

---

## dynatrace_kubernetes

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`cluster_id`**: Use the unique ID of the Kubernetes cluster.
- **`endpoint_url`**: Use the Kubernetes API server URL.
- **`auth_token`**: Use a bearer token with access to the Kubernetes API.
- **`scope`**: Use the cluster scope (e.g., `KUBERNETES_CLUSTER-xxxxxx`).

### Schema

#### Required
- `cluster_id_enabled` (Boolean)
- `enabled` (Boolean)
- `label` (String)

#### Optional
- `active_gate_group` (String)
- `auth_token` (String, Sensitive)
- `certificate_check_enabled` (Boolean)
- `cloud_application_pipeline_enabled` (Boolean, Deprecated)
- `cluster_id` (String)
- `endpoint_url` (String)
- `event_patterns` (Block, Deprecated)
- `event_processing_active` (Boolean, Deprecated)
- `filter_events` (Boolean, Deprecated)
- `hostname_verification_enabled` (Boolean)
- `include_all_fdi_events` (Boolean, Deprecated)
- `open_metrics_builtin_enabled` (Boolean, Deprecated)
- `open_metrics_pipeline_enabled` (Boolean, Deprecated)
- `pvc_monitoring_enabled` (Boolean, Deprecated)
- `scope` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_kubernetes_app

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`scope`**: Use the Kubernetes cluster scope (e.g., `KUBERNETES_CLUSTER-xxxxxx`).
- **`enable_kubernetes_app`**: Set to `true` to enable the new Kubernetes experience.

### Schema

#### Required
- `kubernetes_app_options` (Block)
  - `enable_kubernetes_app` (Boolean)

#### Optional
- `scope` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_kubernetes_enrichment

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`rules`**: Define rules to map Kubernetes labels or annotations to Dynatrace metadata fields.
  - **`type`**: Use `LABEL` or `ANNOTATION`
  - **`source`**: Use a valid Kubernetes label or annotation key
  - **`target`**: Use one of `dt.cost.product`, `dt.cost.costcenter`, or `dt.security_context`

### Schema

#### Optional
- `rules` (Block)
  - `rule` (Block)
    - `source` (String)
    - `target` (String)
    - `type` (String)
    - `enabled` (Boolean, Deprecated)
- `scope` (String)

#### Read-Only
- `id` (String)

---

## Using Data Blocks to Retrieve Existing Information

To retrieve existing configuration from Dynatrace, use Terraform `data` blocks. For example:

```hcl
data "dynatrace_kubernetes" "existing" {
  label = "Production Cluster"
}
```

This allows you to reference existing resources and use their attributes in other modules or resources.

---
