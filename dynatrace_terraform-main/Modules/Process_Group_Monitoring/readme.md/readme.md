# Dynatrace Terraform Modules - Detailed README

This folder contains multiple Terraform modules for configuring various Dynatrace resources, especially around process group detection, workload detection, monitoring, naming, and alerting.

## Table of Contents

* [Overview](#overview)
* [Modules](#modules)

  * [Cloud App Workload Detection](#cloud-app-workload-detection)
  * [Declarative Grouping](#declarative-grouping)
  * [Process Group Alerting](#process-group-alerting)
  * [Process Group Detection](#process-group-detection)
  * [Process Group Detection Flags](#process-group-detection-flags)
  * [Process Group Monitoring](#process-group-monitoring)
  * [Process Group Simple Detection](#process-group-simple-detection)
  * [Process Group Naming](#process-group-naming)
  * [Process Group Naming Order](#process-group-naming-order)

---

## Overview

Each module encapsulates a specific aspect of Dynatrace monitoring and alerting configuration. The modules are designed to be flexible and reusable.

All variables are well-structured using maps and objects, with sample/default configurations provided. Secrets or sensitive data must **never** be hardcoded into Terraform files. Use `.tfvars` or environment variables to inject values securely.

---

## Modules

### Cloud App Workload Detection

**Path:** `Modules/dynatrace_cloudapp_workloaddetection`

This module configures workload detection in Dynatrace for:

* Cloud Foundry
* Docker
* Kubernetes (with fine-grained filters)

#### Example Input

```hcl
cloudapp_workloaddetection = {
  example = {
    cloud_foundry_enabled = false
    docker_enabled        = true
    kubernetes_enabled    = true
    kubernetes_filters = [
      {
        enabled        = false
        inc_basepod    = false
        inc_container  = true
        inc_namespace  = true
        inc_product    = true
        inc_stage      = true
        match_operator = "EXISTS"
      }
    ]
  }
}
```

#### Variables

* `cloudapp_workloaddetection`: Map of detection configurations

  * `cloud_foundry_enabled` (bool): Enable detection in Cloud Foundry
  * `docker_enabled` (bool): Enable Docker-based workload detection
  * `kubernetes_enabled` (bool): Enable Kubernetes workload detection
  * `kubernetes_filters`: List of filter objects

    * `enabled`, `inc_basepod`, `inc_container`, etc.: Control metadata matching
    * `match_operator`: e.g., `EXISTS`, `EQUALS`

#### Output

* `cloudapp_workloaddetection_ids`: List of detected resource IDs

---

### Declarative Grouping

**Path:** `Modules/dynatrace_declarative_grouping`

Defines process groups using metadata rules.

#### Example Input

```hcl
declarative_groupings = {
  sample_group = {
    enabled = true
    scope = "environment"
    id = "PGIdentifierSample"
    process_group_name = "PGDisplayNameSample"
    report = "always"
    rules = [
      { condition = "$contains(TFExecutableSample)", property = "executable" },
      { condition = "$contains(TFCommandSample)", property = "commandLine" }
    ]
  }
}
```

#### Variables

* `declarative_groupings`: Map of declarative group rules

  * `enabled`: Toggle rule
  * `scope`: e.g., `environment`
  * `id`: Unique rule identifier
  * `process_group_name`: Display name
  * `report`: e.g., `always`
  * `rules`: Metadata conditions

#### Output

* `declarative_grouping_names`: List of defined group names

---

### Process Group Alerting

**Path:** `Modules/dynatrace_pg_alerting`

Defines alerting thresholds for process groups.

#### Example Input

```hcl
pg_alertings = {
  alert1 = {
    enabled = true
    alerting_mode = "ON_INSTANCE_COUNT_VIOLATION"
    minimum_instance_threshold = 5
    process_group = "PROCESS_GROUP-1234567890000000"
  }
}
```

#### Variables

* `pg_alertings`

  * `enabled`: Enable/disable alerting
  * `alerting_mode`: e.g., `ON_INSTANCE_COUNT_VIOLATION`
  * `minimum_instance_threshold`: Number of instances to trigger alert
  * `process_group`: ID of the group to monitor

#### Output

* `pg_alerting_ids`: List of created alerting resource IDs

---

### Process Group Detection

**Path:** `Modules/dynatrace_process_group_detection`

Advanced group detection based on metadata and arguments.

#### Variables

* `pg_detections`

  * `enabled`: Enable rule
  * `group_property`, `instance_property`, `process_property`: What to extract
  * `group_standalone_rule`, `group_remove_ids`, `instance_remove_ids`: Toggles
  * `contained_string`: Key matching value
  * `restrict_to_process_type`: e.g., `PROCESS_TYPE_APACHE_HTTPD`

#### Output

* `pg_detection_ids`: IDs of defined rules

---

### Process Group Detection Flags

**Path:** `Modules/dynatrace_process_group_detection_flags`

Fine-tune detection behavior using feature flags.

#### Variables

* `pg_detection_flags`

  * Multiple toggles for enabling specific detection logic like:

    * `auto_detect_spring_boot`
    * `short_lived_processes_monitoring`
    * `use_docker_container_name`
  * `scope`: Where to apply (e.g., `environment`)

---

### Process Group Monitoring

**Path:** `Modules/dynatrace_process_group_monitoring`

Toggle monitoring state for specific process groups.

#### Variables

* `pg_monitorings`

  * `monitoring_state`: `MONITORING_ON`, `MONITORING_OFF`
  * `process_group_id`: Target group

#### Output

* `pg_monitoring_ids`: Monitored group IDs

---

### Process Group Simple Detection

**Path:** `Modules/dynatrace_process_group_simple_detection`

Simplified process group detection based on identifier and process type.

#### Variables

* `pg_simple_detections`

  * `enabled`
  * `group_identifier`, `instance_identifier`
  * `process_type`: e.g., `PROCESS_TYPE_GO`
  * `rule_type`: Rule category

---

### Process Group Naming

**Path:** `Modules/dynatrace_processgroup_naming`

Custom naming rules for process groups based on technology and metadata.

#### Variables

* `pg_namings`

  * `enabled`
  * `format`: Naming format string
  * `conditions`: Technology-based rules

    * `key_type`, `key_attribute`, `tech_operator`, `tech_value_type`
  * `string_conditions`: Match strings from process metadata

#### Output

* `pg_naming_ids`: List of naming resource IDs

---

### Process Group Naming Order

**Path:** `Modules/dynatrace_processgroup_naming_order`

Controls evaluation order for naming rules.

#### Variables

* `pg_naming_order`: List of naming rule resource IDs

---

## How to Use

1. Update or use the provided `sample.tfvars` file in the root directory to supply values for the modules.
2. All modules are already called in the `main.tf` file in the root.
3. You only need to run the following commands to deploy:

```bash
terraform init
terraform plan -var-file="readme.md/sample.tfvars"
terraform apply -var-file="readme.md/sample.tfvars"
```

---

## Best Practices

* Use `.tfvars` to keep config clean
* Never store sensitive information directly in `.tf` files
* Use meaningful names for keys in each module input map
* Run `terraform-docs` to keep documentation in sync with actual code

