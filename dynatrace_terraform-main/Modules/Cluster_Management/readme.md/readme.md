
#  Dynatrace Environment Provisioning Module

This Terraform module provisions a Dynatrace environment in a managed cluster. It defines the environment's state, tags, trial status, data storage allocations, retention policies, and feature quotas. It can be paired with other managed configurations such as preferences, internet proxy settings, SMTP endpoints, and remote access.


---

##  What This Module Provisions

| Resource                          | Description                                                |
|----------------------------------|------------------------------------------------------------|
| `dynatrace_environment`          | Main environment instance created via Dynatrace Managed    |
| `dynatrace_managed_preferences`  | Global preferences applied to the environment              |
| `dynatrace_managed_backup`       | Backup status and configuration                           |
| `dynatrace_managed_internet_proxy` | Proxy configuration for outbound communication          |
| `dynatrace_managed_network_zones` | Network zone definition for traffic routing              |
| `dynatrace_managed_public_endpoints` | Public UI endpoints for access                        |
| `dynatrace_managed_remote_access` | Remote access user configuration                        |
| `dynatrace_managed_smtp`         | SMTP server configuration for alerting/email              |

---

##  Core Environment Inputs

### `environment_name`  
- **Type**: `string`  
- **Description**: Unique identifier for the Dynatrace environment  
- **Example**: `"prod-environment"`

### `environment_state`  
- **Type**: `string`  
- **Description**: Status of environment lifecycle (`active`, `paused`)  
- **Example**: `"active"`

### `environment_trial`  
- **Type**: `bool`  
- **Description**: Flags whether environment is a trial instance  
- **Example**: `false`

### `environment_tags`  
- **Type**: `set(string)`  
- **Description**: Set of metadata tags assigned to the environment  
- **Example**: `["monitoring", "cloud"]`

---

##  Storage Allocation

### `storage_transactions`  
- **Description**: Allocated GB for transactional tracing storage  
- **Example**: `100`

### `storage_user_actions`  
- **Description**: GB allocated for real user monitoring (RUM) data  
- **Example**: `50`

### `storage_limits`  
Structured optional limits for other data types:

```hcl
storage_limits = {
  logs           = 500
  session_replay = 200
  symbol_files   = 100
  transactions   = 300
}
```

---

##  Retention Policies

Defines how long data is retained (in days).

```hcl
storage_retention = {
  rum                   = 30
  service_code_level    = 14
  service_request_level = 14
  session_replay        = 7
  synthetic             = 30
  logs                  = 90
}
```

---

##  Quotas Configuration

Specifies annual and monthly limits for key Dynatrace capabilities:

```hcl
quotas = {
  host_units = 10
  ddus = {
    annual  = 12000
    monthly = 1000
  }
  dem_units = {
    annual  = 6000
    monthly = 500
  }
  logs = {
    annual  = 3000
    monthly = 250
  }
  synthetic = {
    annual  = 1200
    monthly = 100
  }
  user_sessions = {
    annual  = 24000
    monthly = 2000
  }
}
```

These quotas reflect limits for licensing and data ingestion.

---

##  Outputs

| Output Name         | Description                                           |
|---------------------|-------------------------------------------------------|
| `environment_id`    | ID of the provisioned Dynatrace environment           |
| `preferences_id`    | ID of global preferences applied                      |
| `backup_enabled`    | Backup feature toggle status                          |
| `proxy_server`      | Hostname or address of the internet proxy             |
| `network_zone_name` | Name of the network zone used                         |
| `web_ui_address`    | Public URL for accessing Dynatrace UI                 |
| `remote_access_user`| User ID configured for remote access                  |
| `smtp_host`         | Hostname of SMTP server for outbound communication    |

---


##  Example Usage

```hcl
module "dynatrace_environment" {
  source = "./modules/dynatrace_environment"

  environment_name     = "prod-env"
  environment_state    = "active"
  environment_trial    = false
  environment_tags     = ["monitoring", "region:us"]

  storage_transactions = 150
  storage_user_actions = 60

  storage_limits = {
    logs           = 600
    session_replay = 250
    symbol_files   = 120
    transactions   = 350
  }

  storage_retention = {
    rum                   = 45
    service_code_level    = 14
    service_request_level = 14
    session_replay        = 7
    synthetic             = 30
    logs                  = 90
  }

  quotas = {
    host_units = 12
    ddus = {
      annual  = 15000
      monthly = 1250
    }
    ...
  }
}
```

---
