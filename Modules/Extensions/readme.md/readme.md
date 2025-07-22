
# Dynatrace Extension & Hub Configuration Modules

This Terraform package provides modular resources for managing Dynatrace execution controllers, remote endpoints, extension versions, and extension configurations. These modules allow platform teams to declaratively control feature enablement, ingestion routing, performance profiles, and hub extension lifecycle.


## 🔧 Modules Overview

### 1. `dynatrace_extension_execution_controller`

####  Purpose
Manages execution controllers which govern data ingestion and StatsD metric flows. Each controller defines a performance profile, scope (e.g. host or environment), and ingestion toggles.

####  Resource
Provisioned via `dynatrace_extension_execution_controller.this`

####  Variables

| Variable            | Type    | Description |
|---------------------|---------|-------------|
| `enabled`           | `bool`  | Whether the execution controller should be active |
| `ingest_active`     | `bool`  | If true, enables data ingestion into Dynatrace |
| `performance_profile` | `string` | Named throughput profile (e.g., `high-throughput`, `balanced`) |
| `scope`             | `string` | Target entity scope (e.g., `host:prod-controller-01`, `env:prod`) |
| `statsd_active`     | `bool`  | Enables StatsD metric collection for the controller |

#### Example
```hcl
execution_controllers = [
  {
    enabled             = true
    ingest_active       = true
    performance_profile = "high-throughput"
    scope               = "host:prod-controller-01"
    statsd_active       = true
  }
]
```

#### Outputs
```hcl
output "execution_controller_ids" {
  value = [for r in dynatrace_extension_execution_controller.this : r.id]
}
```

---

### 2. `dynatrace_extension_execution_remote`

#### Purpose
Defines remote endpoints used by Dynatrace extensions (such as edge processors or regional collectors). Each remote references a performance profile and scope.

####  Resource
Provisioned via `dynatrace_extension_execution_remote.this`

####  Variables

| Variable            | Type    | Description |
|---------------------|---------|-------------|
| `performance_profile` | `string` | Throughput setting for the remote endpoint (`edge-cache`, `balanced`) |
| `scope`             | `string` | Target scope like `env:staging` or `host:remote-node` |

####  Example
```hcl
execution_remotes = [
  {
    performance_profile = "edge-cache"
    scope               = "env:staging"
  }
]
```

#### Outputs
```hcl
output "execution_remote_ids" {
  value = [for r in dynatrace_extension_execution_remote.this : r.id]
}
```

---

### 3. `dynatrace_hub_extension_active_version`

####  Purpose
Tracks the active version of extensions in the Dynatrace Hub for enforcement and compatibility validation.

#### Resource
Provisioned via `dynatrace_hub_extension_active_version.this`

####  Variables

| Variable   | Type     | Description |
|------------|----------|-------------|
| `name`     | `string` | Extension name, e.g. `aws-cloudwatch`, `prometheus-exporter` |
| `version`  | `string` | Required version of the extension in SemVer format |

####  Example
```hcl
hub_extension_versions = [
  { name = "aws-cloudwatch", version = "1.2.0" },
  { name = "prometheus-exporter", version = "2.0.1" }
]
```

####  Outputs
```hcl
output "hub_extension_versions" {
  value = [for r in dynatrace_hub_extension_active_version.this : r.version]
}
```

---

### 4. `dynatrace_hub_extension_config`

####  Purpose
Controls Dynatrace extension configurations including enablement flags, version, description, and associated feature sets (e.g. logs, metrics, custom-metrics).

####  Resource
Provisioned via `dynatrace_hub_extension_config.this`

####  Variables

| Variable     | Type              | Description |
|--------------|-------------------|-------------|
| `name`       | `string`          | Hub extension identifier |
| `enabled`    | `bool`            | Flag to turn the extension on or off |
| `description`| `string`          | Human-readable description of extension purpose |
| `version`    | `string`          | Installed or expected version of the extension |
| `featureSets`| `list(string)`    | Enabled features such as `logs`, `metrics`, `custom-metrics` |

####  Example
```hcl
hub_extension_configs = [
  {
    name        = "aws-cloudwatch"
    enabled     = true
    description = "Monitors CloudWatch metrics and AWS tags"
    version     = "1.2.0"
    featureSets = ["logs", "metrics"]
  },
  {
    name        = "prometheus-exporter"
    enabled     = false
    description = "Exports Prometheus data to Dynatrace"
    version     = "2.0.1"
    featureSets = ["custom-metrics"]
  }
]
```

####  Outputs
```hcl
output "hub_extension_config_names" {
  value = [for r in dynatrace_hub_extension_config.this : r.name]
}
```

---

##  How to Use

Include any module in your root `main.tf` using:

```hcl
module "execution_controllers" {
  source = "./modules/dynatrace_extension_execution_controller"
  execution_controllers = var.execution_controllers
}
```

All module inputs support multiple instances via `list(object({ ... }))`, allowing flexible scaling across environments and zones.

---
