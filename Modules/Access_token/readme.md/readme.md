
#  Dynatrace Token Management Modules

This Terraform module suite provisions and configures token entities within Dynatrace. It includes:

-  ActiveGate token policy enforcement and expiry handling
-  Creation of standard ActiveGate (AG) tokens
-  API tokens with scoped access control
-  Global token format and user token toggles


---

##  Module Breakdown

| Module Name              | Resource Provisioned                        | Purpose                                              |
|--------------------------|---------------------------------------------|------------------------------------------------------|
| `activegate_token`       | `dynatrace_activegate_token`                | Configures ActiveGate token behavior and expiry      |
| `ag_token`               | `dynatrace_ag_token`                        | Creates AG token with name and expiration            |
| `api_token`              | `dynatrace_api_token`                       | Generates API token with scopes                      |
| `token_settings`         | `dynatrace_token_settings`                  | Applies global token format and user token settings  |

---

##  Inputs & Examples

###  `activegate_token_config`

Configures behavior of token enforcement across ActiveGate agents.

| Field                                 | Type  | Description |
|--------------------------------------|-------|-------------|
| `auth_token_enforcement_manually_enabled` | `bool` | Enables manual enforcement of token policy |
| `expiring_token_notifications_enabled`    | `bool` | Enables email/UI warnings for expiring tokens |

 Example:
```hcl
activegate_token_config = {
  auth_token_enforcement_manually_enabled = true
  expiring_token_notifications_enabled    = true
}
```

---

###  `ag_token_config`

Creates a token used by ActiveGate agents to authenticate.

| Field            | Type    | Description |
|------------------|---------|-------------|
| `type`           | `string`| Typically `"AG"` or other AG token types |
| `expiration_date`| `string`| ISO-formatted expiration date |
| `name`           | `string`| Display name for the token |

 Example:
```hcl
ag_token_config = {
  type            = "AG"
  expiration_date = "2025-12-31"
  name            = "default-ag-token"
}
```

---

###  `api_token_config`

Declares API token with scope-based permission granularity.

| Field    | Type            | Description |
|----------|-----------------|-------------|
| `name`   | `string`        | Token identifier used in Dynatrace |
| `enabled`| `bool`          | Activates the token for use |
| `scopes` | `list(string)`  | List of permission scopes assigned to the token |
 Example:
```hcl
api_token_config = {
  name    = "default-api-token"
  enabled = true
  scopes  = [
    "DataExport",
    "ReadConfig",
    "WriteConfig"
  ]
}
```

>  Scope names must match valid Dynatrace API scope declarations (e.g. `LogViewer`, `UserManagement`, `EntityMetadataRead`).

---

###  `token_settings_config`

Controls token format consistency and user token allowances across environments.

| Field            | Type   | Description |
|------------------|--------|-------------|
| `new_token_format` | `bool` | Enables updated token format (UUID-based or structured) |
| `personal_tokens`  | `bool` | Enables/disables creation of personal tokens by users |

 Example:
```hcl
token_settings_config = {
  new_token_format = true
  personal_tokens  = false
}
```

---

##  Outputs

| Output Name          | Description                                      |
|----------------------|--------------------------------------------------|
| `activegate_token`   | Full resource object from ActiveGate token configuration |
| `ag_token`           | Sensitive token object from AG token creation         |
| `api_token`          | Sensitive token object containing API scopes        |
| `token_settings`     | Final token setting policy applied across the tenant |

All token objects can be used for authentication workflows, logging pipelines, or integrations — but be careful not to expose sensitive outputs in version-controlled files or CI logs.

---

##  Example Composition in `main.tf`

```hcl
module "activegate_token" {
  source = "./modules/dynatrace_activegate_token"
  config = var.activegate_token_config
}

module "ag_token" {
  source = "./modules/dynatrace_ag_token"
  config = var.ag_token_config
}

module "api_token" {
  source = "./modules/dynatrace_api_token"
  config = var.api_token_config
}

module "token_settings" {
  source = "./modules/dynatrace_token_settings"
  config = var.token_settings_config
}
```

