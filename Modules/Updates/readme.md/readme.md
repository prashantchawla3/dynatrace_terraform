

#  Dynatrace Updates Terraform Modules

This folder contains Terraform modules that manage **Dynatrace ActiveGate updates**, **OneAgent update configurations**, and **OneAgent update windows**.

Each module is structured for reusability and clarity, ensuring that users can easily understand what each module does and how to use it.

---

##  Module: `dynatrace_activegate_updates`

This module enables or disables **automatic updates for ActiveGate** components in a specific Dynatrace environment or host group.

###  Terraform Resource Used

```hcl
resource "dynatrace_activegate_updates" "this" { ... }
```

###  What It Does

Enables automatic updates for ActiveGate components based on the defined scope (environment, host group, etc.).

###  Input Variables

| Name               | Type     | Default                 | Description                                                                              | Example                 |
| ------------------ | -------- | ----------------------- | ---------------------------------------------------------------------------------------- | ----------------------- |
| `auto_update`      | `bool`   | `true`                  | Whether to enable (`true`) or disable (`false`) ActiveGate auto-updates.                 | `true`                  |
| `scope_activegate` | `string` | `"environment:default"` | The scope for applying the auto-update settings. Can be an environment, host group, etc. | `"environment:default"` |

###  Output

| Name                    | Description                                        |
| ----------------------- | -------------------------------------------------- |
| `activegate_updates_id` | ID of the ActiveGate updates resource in Dynatrace |

---

##  Module: `dynatrace_oneagent_updates`

This module manages **OneAgent update configuration**, such as targeting a specific version and update mode (AUTO, MANUAL, etc.).

###  Terraform Resource Used

```hcl
resource "dynatrace_oneagent_updates" "this" { ... }
```

###  What It Does

Defines how Dynatrace OneAgent updates are rolled out to a specific environment, host, or tag. You can specify a target version and whether updates are applied automatically or manually.

###  Input Variables

| Name             | Type     | Default                 | Description                                                                            | Example                 |
| ---------------- | -------- | ----------------------- | -------------------------------------------------------------------------------------- | ----------------------- |
| `scope_oneagent` | `string` | `"environment:default"` | The scope (environment, host group, tag, etc.) where the OneAgent update should apply. | `"environment:default"` |
| `target_version` | `string` | `"1.287.0.202"`         | The specific OneAgent version to install, or `"latest"` to always use the most recent. | `"latest"`              |
| `update_mode`    | `string` | `"SCHEDULED"`           | Defines how updates are applied. Possible values: `AUTO`, `MANUAL`, `SCHEDULED`.       | `"AUTOMATIC"`           |

###  Output

| Name                  | Description                                      |
| --------------------- | ------------------------------------------------ |
| `oneagent_updates_id` | ID of the OneAgent updates resource in Dynatrace |

---

## Module: `dynatrace_update_windows`

This module defines **time-based update windows** for OneAgent updates. These windows help ensure updates are only applied during approved maintenance periods.

### Terraform Resource Used

```hcl
resource "dynatrace_update_windows" "this" { ... }
```

###  What It Does

Configures when OneAgent updates are allowed to occur. For example, you might restrict updates to a specific weekend maintenance window.

###  Input Variables

| Name                    | Type     | Default                      | Description                                                                  | Example                  |
| ----------------------- | -------- | ---------------------------- | ---------------------------------------------------------------------------- | ------------------------ |
| `name`                  | `string` | `"oneagent-weekend-updates"` | Name of the update window.                                                   | `"prod-saturday-window"` |
| `enabled`               | `bool`   | `true`                       | Whether the update window is active.                                         | `true`                   |
| `recurrence`            | `string` | `"ONCE"`                     | Type of recurrence. Supported: `ONCE`, `DAILY`, `WEEKLY`.                    | `"ONCE"`                 |
| `once_recurrence_start` | `string` | `"2025-08-02T01:00:00Z"`     | Start time of the update window in **RFC3339** format (for ONCE recurrence). | `"2025-08-02T01:00:00Z"` |
| `once_recurrence_end`   | `string` | `"2025-08-02T03:00:00Z"`     | End time of the update window in **RFC3339** format (for ONCE recurrence).   | `"2025-08-02T03:00:00Z"` |

 **Note**: The `once_recurrence_start` and `once_recurrence_end` are only used when `recurrence` is set to `"ONCE"`.

###  Output

| Name                | Description                                   |
| ------------------- | --------------------------------------------- |
| `update_windows_id` | ID of the update window resource in Dynatrace |

---

##  Example Usage

Here’s how to use all three modules together in your Terraform project:

```hcl
module "activegate_update" {
  source           = "./modules/dynatrace_activegate_updates"
  auto_update      = true
  scope_activegate = "environment"
}

module "oneagent_update" {
  source         = "./modules/dynatrace_oneagent_updates"
  scope_oneagent = "environment"
  target_version = "latest"
  update_mode    = "AUTOMATIC"
}

module "update_window" {
  source                  = "./modules/dynatrace_update_windows"
  name                    = "example"
  enabled                 = true
  recurrence              = "ONCE"
  once_recurrence_start   = "2023-02-15T02:00:00Z"
  once_recurrence_end     = "2023-02-15T04:00:00Z"
}
```

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



##  Best Practices

* Always define update windows for production environments to avoid downtime during peak hours.
* Use `update_mode = "MANUAL"` for mission-critical services and apply updates during maintenance.
* Keep your `target_version` up to date or use `"latest"` only after careful consideration and testing.

---



##  References

* [Dynatrace Terraform Provider Documentation](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs)

