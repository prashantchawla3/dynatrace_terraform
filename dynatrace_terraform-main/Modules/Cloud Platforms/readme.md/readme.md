
#  Dynatrace Platform Integrations: Cloud Foundry & Kubernetes

This Terraform module suite provisions platform monitoring integrations for Cloud Foundry and Kubernetes (including app-level and enrichment configurations) using Dynatrace APIs. It enables visibility across clusters, applications, and enriched entity metadata by combining monitoring controls and label-driven mappings.

---

##  Modules & What They Do

| Module Name                    | Resource Provisioned                        | Description |
|-------------------------------|---------------------------------------------|-------------|
| `cloud_foundry_module`        | `dynatrace_cloud_foundry`                  | Connects Dynatrace to a Cloud Foundry environment via ActiveGate |
| `k8s_monitoring_module`       | `dynatrace_k8s_monitoring`                 | Configures high-level K8s monitoring options, event patterns, metrics |
| `kubernetes_module`           | `dynatrace_kubernetes`                     | Sets up cluster-level Dynatrace integration for Kubernetes |
| `kubernetes_app_module`       | `dynatrace_kubernetes_app`                 | Enables app-level K8s monitoring scoped by namespace or workload |
| `kubernetes_enrichment_module`| `dynatrace_kubernetes_enrichment`          | Maps entity labels to environments or metadata for enriched observability |

---

##  Module: `cloud_foundry_module`

###  What It Does

Establishes a Cloud Foundry integration that allows Dynatrace to monitor CF foundations via ActiveGate and API credentials.

###  Variables

| Name              | Type    | Description |
|-------------------|---------|-------------|
| `enabled`         | `bool`  | Toggles the integration |
| `active_gate_group` | `string` | ActiveGate group to use |
| `api_url`         | `string` | Cloud Foundry API URL |
| `label`           | `string` | Display label in Dynatrace |
| `login_url`       | `string` | Cloud Foundry login endpoint |
| `username`        | `string` | Login username _(secret excluded)_ |

 Example:
```hcl
cloud_foundry = {
  default_cf = {
    enabled           = true
    active_gate_group = "cf-gate-group"
    api_url           = "https://api.cf.example.com"
    label             = "CF Integration"
    login_url         = "https://login.cf.example.com"
    username          = "admin"
  }
}
```

---

##  Module: `k8s_monitoring_module`

###  What It Does

Configures global Kubernetes monitoring options, including metric pipelines, event filters, and scope settings.

###  Variables

| Name | Type | Description |
|------|------|-------------|
| `cloud_application_pipeline_enabled` | `bool` | Enables cloud application pipeline |
| `event_processing_active`           | `bool` | Toggles event ingestion |
| `filter_events`                     | `bool` | Filters out non-essential events |
| `include_all_fdi_events`           | `bool` | Includes all FDI events |
| `open_metrics_builtin_enabled`     | `bool` | Toggles built-in OpenMetrics |
| `open_metrics_pipeline_enabled`    | `bool` | Enables pipeline processing of metrics |
| `scope`                            | `string` | Resource scope identifier |
| `event_patterns.active`            | `bool` | Enables custom event filter pattern |
| `event_patterns.label`             | `string` | Label for event pattern |
| `event_patterns.pattern`           | `string` | Regex or string matcher for event pattern |

 Example:
```hcl
k8s_monitoring = {
  default_k8s_monitoring = {
    cloud_application_pipeline_enabled = true
    event_processing_active            = true
    filter_events                      = true
    open_metrics_pipeline_enabled      = true
    scope                              = "monitoring-scope"
    event_patterns = {
      active  = true
      label   = "K8s Events"
      pattern = ".*"
    }
  }
}
```

---

##  Module: `kubernetes_module`

###  What It Does

Creates a full cluster-level integration between Dynatrace and Kubernetes, including certificate options and endpoint connection details.

###  Variables

| Name | Type | Description |
|------|------|-------------|
| `enabled` | `bool` | Toggles resource |
| `cluster_id` | `string` | Cluster identifier |
| `cluster_id_enabled` | `bool` | Whether ID is used or inferred |
| `label` | `string` | Display name |
| `scope` | `string` | Resource scope |
| `active_gate_group` | `string` | ActiveGate used for ingestion |
| `endpoint_url` | `string` | API server endpoint |
| `certificate_check_enabled` | `bool` | Enables TLS certificate validation |
| `hostname_verification_enabled` | `bool` | Controls host match checks |

 Example:
```hcl
kubernetes = {
  default_cluster = {
    enabled = true
    cluster_id = "k8s-cluster-01"
    label = "Production Cluster"
    scope = "cluster-scope"
    active_gate_group = "k8s-gate-group"
    endpoint_url = "https://k8s-api.example.com"
    certificate_check_enabled = true
    hostname_verification_enabled = true
  }
}
```

---

##  Module: `kubernetes_app_module`

###  What It Does

Enables focused monitoring on Kubernetes application workloads within a scope.

###  Variables

| Name | Type | Description |
|------|------|-------------|
| `scope` | `string` | Namespace or workload reference |
| `enable_kubernetes_app` | `bool` | Toggles the monitoring feature |

---

##  Module: `kubernetes_enrichment_module`

###  What It Does

Enriches monitored Kubernetes entities with metadata by applying label transformations.

###  Variables

| Name | Type | Description |
|------|------|-------------|
| `scope` | `string` | Logical scope for enrichment |
| `rules.type` | `string` | Type of rule (`label`, `annotation`) |
| `rules.source` | `string` | Metadata field to reference |
| `rules.target` | `string` | Target dimension or tag to enrich |

 Example:
```hcl
kubernetes_enrichment = {
  enrichment_rule = {
    scope = "enrichment-scope"
    rules = {
      type   = "label"
      source = "namespace"
      target = "environment"
    }
  }
}
```

---

##  Outputs

| Output Name | Description |
|-------------|-------------|
| `cloud_foundry_keys`         | Map keys used to configure Cloud Foundry resources |
| `k8s_monitoring_keys`        | Keys for Kubernetes monitoring entries |
| `kubernetes_keys`            | Cluster integration configuration keys |
| `kubernetes_app_keys`        | App-level configuration keys |
| `kubernetes_enrichment_keys` | Label enrichment configuration keys |

All outputs allow chaining to dashboards, validation checks, or dynamic Terraform references.

---

