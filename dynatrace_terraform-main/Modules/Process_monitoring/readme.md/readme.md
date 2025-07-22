# Dynatrace Process Monitoring Modules

This Terraform configuration contains multiple reusable modules for managing **process monitoring** in **Dynatrace**. Each module encapsulates specific Dynatrace functionality such as enabling built-in process monitoring, configuring process visibility, setting availability rules, and more.

---

##  Modules Overview

### 1. `dynatrace_builtin_process_monitoring`

This module configures built-in process detection for various common technologies within a Dynatrace host group.

#### Resources:

* `dynatrace_builtin_process_monitoring`

#### Variables:

| Variable            | Description                                                     | Type     | Example         | Default         |
| ------------------- | --------------------------------------------------------------- | -------- | --------------- | --------------- |
| `host_group_id`     | Host group within Dynatrace to apply built-in monitoring rules. | `string` | `"environment"` | `"environment"` |
| `aspnetcore`        | Enables detection of ASP.NET Core processes.                    | `bool`   | `true`          | `false`         |
| `cf_appsmanagerjs`  | Enables detection of Cloud Foundry Apps Manager JS.             | `bool`   | `true`          | `false`         |
| `container`         | Enables detection of container-based processes.                 | `bool`   | `true`          | `false`         |
| `docker_pauseamd64` | Enables detection of the `pause-amd64` process for Docker.      | `bool`   | `true`          | `false`         |
| `exe_bbs`           | Enables detection of the BBS process.                           | `bool`   | `true`          | `false`         |
| `exe_caddy`         | Enables detection of the Caddy web server process.              | `bool`   | `true`          | `false`         |
| `exe_schedular`     | Enables detection of custom scheduler executables.              | `bool`   | `true`          | `false`         |
| `exe_silkdaemon`    | Enables detection of Silk Daemon processes.                     | `bool`   | `true`          | `false`         |
| `go_static`         | Enables detection of Go static binary processes.                | `bool`   | `true`          | `false`         |
| `node_nodegyp`      | Enables detection of Node.js `node-gyp` processes.              | `bool`   | `true`          | `false`         |

#### Output:

* `builtin_process_monitoring_id`: ID of the created built-in process monitoring resource.

---

### 2. `dynatrace_process_availability`

This module configures availability monitoring for specific processes by defining rules and metadata.

#### Resources:

* `dynatrace_process_availability`

#### Variables:

| Variable                              | Description                                               | Type     | Example                  | Default                          |
| ------------------------------------- | --------------------------------------------------------- | -------- | ------------------------ | -------------------------------- |
| `process_availability_enabled`        | Whether to enable the process availability configuration. | `bool`   | `true`                   | `true`                           |
| `process_availability_name`           | The name of the availability rule.                        | `string` | `"My Availability Rule"` | `"example-process-availability"` |
| `process_availability_rule_property`  | Property type to monitor (e.g., `EXE`, `COMMAND_LINE`).   | `string` | `"EXE"`                  | `"EXE"`                          |
| `process_availability_rule_condition` | Value to match (e.g., executable name).                   | `string` | `"nginx"`                | `"nginx"`                        |
| `process_availability_metadata_key`   | Metadata key to tag the rule (e.g., `environment`).       | `string` | `"env"`                  | `"environment"`                  |
| `process_availability_metadata_value` | Metadata value to tag the rule (e.g., `production`).      | `string` | `"prod"`                 | `"production"`                   |

#### Output:

* `process_availability_id`: ID of the process availability resource.

---

### 3. `dynatrace_process_monitoring`

Enables or disables **automatic monitoring** for a Dynatrace host group.

#### Resources:

* `dynatrace_process_monitoring`

#### Variables:

| Variable                             | Description                                            | Type     | Example             | Default           |
| ------------------------------------ | ------------------------------------------------------ | -------- | ------------------- | ----------------- |
| `process_monitoring_host_group_id`   | Host group to apply the automatic monitoring settings. | `string` | `"HOST_GROUP-0000"` | `"HOST_GROUP_ID"` |
| `process_monitoring_auto_monitoring` | Enables automatic monitoring of processes.             | `bool`   | `true`              | `true`            |

#### Output:

* `process_monitoring_id`: ID of the process monitoring configuration.

---

### 4. `dynatrace_process_monitoring_rule`

This module defines a **custom rule** for enabling or disabling monitoring for specific processes based on conditions.

#### Resources:

* `dynatrace_process_monitoring_rule`

#### Variables:

| Variable                                     | Description                                              | Type     | Example                | Default                         |
| -------------------------------------------- | -------------------------------------------------------- | -------- | ---------------------- | ------------------------------- |
| `process_monitoring_rule_enabled`            | Enable or disable the rule.                              | `bool`   | `true`                 | `true`                          |
| `process_monitoring_rule_mode`               | Monitoring mode (`MONITORING_OFF`, `MONITORING_ON`).     | `string` | `"MONITORING_OFF"`     | `"MONITORING_OFF"`              |
| `process_monitoring_rule_host_group_id`      | Host group where this rule applies.                      | `string` | `"HOST_GROUP-0000"`    | `"HOST_GROUP-0000000000000000"` |
| `process_monitoring_rule_condition_item`     | Condition item to evaluate (e.g., `APACHE_CONFIG_PATH`). | `string` | `"APACHE_CONFIG_PATH"` | `"APACHE_CONFIG_PATH"`          |
| `process_monitoring_rule_condition_operator` | Operator for the rule (`STARTS`, `EQUALS`, etc.).        | `string` | `"STARTS"`             | `"STARTS"`                      |
| `process_monitoring_rule_condition_value`    | Value to compare with.                                   | `string` | `"/usr/bin/apache"`    | `"foo-bar-x"`                   |

#### Output:

* `process_monitoring_rule_id`: ID of the created process monitoring rule.

---

### 5. `dynatrace_process_visibility`

Configures how many processes Dynatrace should track for visibility.

#### Resources:

* `dynatrace_process_visibility`

#### Variables:

| Variable                           | Description                                                       | Type     | Example        | Default         |
| ---------------------------------- | ----------------------------------------------------------------- | -------- | -------------- | --------------- |
| `process_visibility_enabled`       | Enables process visibility.                                       | `bool`   | `true`         | `true`          |
| `process_visibility_max_processes` | Maximum number of tracked processes.                              | `number` | `100`          | `80`            |
| `process_visibility_scope`         | Scope where this visibility config applies (e.g., `environment`). | `string` | `"production"` | `"environment"` |

#### Output:

* `process_visibility_id`: ID of the process visibility configuration.

---

##  How to Use This Configuration

### 1. Clone the Repository

```bash
git clone https://github.com/your-org/dynatrace-terraform-modules.git
cd dynatrace-terraform-modules
```

### 2. Fill in the Variable Values

Edit or create a `.tfvars` file:

```hcl
host_group_id = "environment"
aspnetcore = false
cf_appsmanagerjs = false
...
```

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
##  Notes

* **No secrets** are stored or required in any module.
* Ensure that the Dynatrace provider is correctly configured before using these modules.
* Always validate configuration with `terraform plan` before applying changes to production.

---


##  Related Dynatrace Docs

* [Dynatrace Process Monitoring](https://docs.dynatrace.com/docs/observe/processes/process-monitoring)
* [Dynatrace Terraform Provider](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest)

---

##  Outputs Summary

| Module                       | Output Name                     | Description                                   |
| ---------------------------- | ------------------------------- | --------------------------------------------- |
| `builtin_process_monitoring` | `builtin_process_monitoring_id` | ID of the built-in monitoring config          |
| `process_availability`       | `process_availability_id`       | ID of the process availability rule           |
| `process_monitoring`         | `process_monitoring_id`         | ID of the monitoring status config            |
| `process_monitoring_rule`    | `process_monitoring_rule_id`    | ID of the rule created for process monitoring |
| `process_visibility`         | `process_visibility_id`         | ID of the visibility configuration            |

---

