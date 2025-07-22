

# environent_settings Modules

This repository contains modular Terraform configurations for key Dynatrace platform governance domains. Each module defines a resource type and its settings in a standardized list-object format, allowing flexible provisioning across environments.

Each module uses this convention:

```hcl
variable "<resource>_resources" {
  type = list(object({
    name     = string
    type     = string
    settings = object({ ... })
  }))
}
```

>  Each resource includes a `name` (logical identifier), `type` (should match the module), and `settings` block (specific to the module's purpose).

---

##  Modules Overview

### `dynatrace_app_monitoring`
**Purpose**: Configure default application monitoring levels (logs and traces).

**Resource Behavior**:
- Sets `default_log_level` and `default_trace_level` globally.

**Example Variable**:
```hcl
app_monitoring_resources = [
  {
    name = "core-app-monitoring"
    type = "app_monitoring"
    settings = {
      app_monitoring = {
        default_log_level   = "INFO"
        default_trace_level = "VERBOSE"
      }
    }
  }
]
```

---

### `dynatrace_audit_log`
**Purpose**: Enable or disable audit logging per scoped service or app.

**Resource Behavior**:
- Applies binary switch to audit logging (`enabled = true/false`).

**Example**:
```hcl
audit_log_resources = [
  {
    name = "user-access-audit"
    type = "audit_log"
    settings = {
      audit_log = {
        enabled = true
      }
    }
  }
]
```

---

### `dynatrace_cloud_development_environments`
**Purpose**: Declare cloud environments (e.g., GCP, Azure Dev) associated with each monitored service.

**Example**:
```hcl
cloud_development_resources = [
  {
    name = "team-dev-cloud"
    type = "cloud_development_environments"
    settings = {
      cloud_development_environments = ["GCP", "AzureDev"]
    }
  }
]
```

---

### `dynatrace_data_privacy`
**Purpose**: Configure comprehensive privacy controls including masking, opt-in rules, and cookie persistence.

**Capabilities**:
- Enables `do-not-track` compliance
- Controls masking for URI and user actions
- Defines application scoping via `application_id`

**Example**:
```hcl
data_privacy_resources = [
  {
    name = "privacy-rule-team-app"
    type = "data_privacy"
    settings = {
      data_privacy = {
        application_id = "APP1234"
        data_collection = {
          opt_in_mode_enabled = true
        }
        do_not_track = {
          comply_with_do_not_track = true
        }
        masking = {
          personal_data_uri_masking_enabled = true
          user_action_masking_enabled       = true
        }
        user_tracking = {
          persistent_cookie_enabled = false
        }
      }
    }
  }
]
```

---

### `dynatrace_disk_options`
**Purpose**: Manage disk monitoring including NFS detection and exclusion rules.

**Example**:
```hcl
disk_options_resources = [
  {
    name = "exclude-sensitive-disks"
    type = "disk_options"
    settings = {
      disk_options = {
        disable_nfs_disk_monitoring = true
        nfs_show_all                = false
        scope                       = "prod-linux"
        exclusions = [
          {
            filesystem = "/dev/sda1"
            mountpoint = "/data"
            os         = "Linux"
          }
        ]
      }
    }
  }
]
```

---

### `dynatrace_eula_settings`
**Purpose**: Enforce or disable EULA agreement enforcement per scope.

**Example**:
```hcl
eula_settings_resources = [
  {
    name = "eula-prod-agreement"
    type = "eula_settings"
    settings = {
      eula_settings = {
        scope       = "prod"
        enable_eula = true
      }
    }
  }
]
```

---

### `dynatrace_hub_permissions`
**Purpose**: Assign Hub-level permissions based on email identity.

**Example**:
```hcl
hub_permissions_resources = [
  {
    name = "hub-admin-access"
    type = "hub_permissions"
    settings = {
      hub_permissions = {
        email       = "admin@example.com"
        description = "Full Hub access for platform admins"
      }
    }
  }
]
```

---

### `dynatrace_hub_subscriptions`
**Purpose**: Manage hub token subscriptions for external integrations.

**Example**:
```hcl
hub_subscriptions_resources = [
  {
    name = "external-token"
    type = "hub_subscriptions"
    settings = {
      hub_subscriptions = {
        token_subscription = {
          name        = "integration-token"
          description = "Used for webhook integration"
          enabled     = true
          token       = "REDACTED"  # No secrets shown here
        }
      }
    }
  }
]
```

---

### `dynatrace_ip_address_masking`
**Purpose**: Configure IP masking rules for privacy enforcement.

**Example**:
```hcl
ip_masking_resources = [
  {
    name = "ip-masking-prod"
    type = "ip_address_masking"
    settings = {
      ip_address_masking = {
        scope   = "production"
        enabled = true
        type    = "LAST_OCTET"
      }
    }
  }
]
```

---

### `dynatrace_limit_outbound_connections`
**Purpose**: Restrict outbound connectivity by whitelisting specific hosts.

**Example**:
```hcl
outbound_connection_resources = [
  {
    name = "restrict-egress"
    type = "limit_outbound_connections"
    settings = {
      limit_outbound_connections = {
        allowed_outbound_connections = {
          enforced  = true
          host_list = ["example.com", "api.partner.com"]
        }
      }
    }
  }
]
```

---

### `dynatrace_oneagent_default_mode`
**Purpose**: Control default operation mode for OneAgent installation.

**Example**:
```hcl
oneagent_default_mode_resources = [
  {
    name = "agent-mode-control"
    type = "oneagent_default_mode"
    settings = {
      oneagent_default_mode = {
        default_mode = "INFRASTRUCTURE"
      }
    }
  }
]
```

---

### `dynatrace_oneagent_features`
**Purpose**: Toggle OneAgent features and instrumentation settings.

**Example**:
```hcl
oneagent_features_resources = [
  {
    name = "feature-enable-logs"
    type = "oneagent_features"
    settings = {
      oneagent_features = {
        enabled         = true
        instrumentation = true
        key             = "log-enhancement"
        scope           = "Linux-Hosts"
      }
    }
  }
]
```

---

### `dynatrace_oneagent_side_masking`
**Purpose**: Apply masking policies for sensitive data captured via OneAgent.

**Example**:
```hcl
oneagent_side_masking_resources = [
  {
    name = "masking-policy"
    type = "oneagent_side_masking"
    settings = {
      oneagent_side_masking = {
        is_email_masking_enabled     = true
        is_financial_masking_enabled = true
        is_numbers_masking_enabled   = true
        is_query_masking_enabled     = false
      }
    }
  }
]
```

---

##  Outputs

These outputs provide targeted views of resources provisioned via modules:

| Output Name                  | Description                                        |
|-----------------------------|----------------------------------------------------|
| `cloud_development_environments` | Returns environments configured for cloud development. |
| `disk_exclusions`               | Lists disk exclusion patterns used for monitoring.       |
| `hub_permissions_email`        | Returns email addresses configured with Hub permissions. |
| `ip_masking_status`            | Lists scope and type of IP masking per resource.         |

---

## How to Use

Each module is invoked via the root `main.tf` with the following pattern:

```hcl
module "<module_name>" {
  source = "./modules/<folder>"
  <variable_name> = var.<variable_name>
}
```

Each variable is a list of objects describing individual resource instances. You can add multiple entries with different names or scopes.

---


