

# Terraform Dynatrace Managed Cluster Modules

---

## dynatrace_environment

### Required API Token Scopes
- `ServiceProviderAPI`

### How to Determine `tfvars` Values
- **`name`**: Choose a unique display name for the environment.
- **`state`**: Use `"ENABLED"` or `"DISABLED"`.
- **`storage`**: Define limits and retention settings based on your license and monitoring needs.
- **`tags`**: Provide a list of tags (max 100 characters each).
- **`trial`**: Set to `true` only if your license allows trial environments.

### Schema

#### Required
- `name` (String)
- `state` (String)
- `storage` (Block)

#### Optional
- `quotas` (Block)
- `tags` (Set of String)
- `trial` (Boolean)

#### Read-Only
- `id` (String)

#### Nested Blocks
- `storage`
  - `transactions` (Number)
  - `user_actions` (Number)
  - `limits` (Block)
    - `logs`, `session_replay`, `symbol_files`, `transactions` (Number)
  - `retention` (Block)
    - `rum`, `service_code_level`, `service_request_level`, `session_replay`, `synthetic`, `logs` (Number)

- `quotas`
  - `host_units` (Number)
  - `ddus`, `dem_units`, `logs`, `synthetic`, `user_sessions` (Block)
    - `annual`, `monthly` (Number)

---

## dynatrace_managed_backup

**Note:** HTTP DELETE method not available. Terraform will no longer manage this resource on destroy, but the configuration will remain on the Dynatrace cluster.

### Required API Token Scopes
- `ServiceProviderAPI`

### How to Determine `tfvars` Values
- **`datacenter`**: Specify the datacenter name.
- **`include_*`**: Set to `true` to include RUM, LMv2, or time series data.
- **`bandwidth_limit_mbits`**: Set a bandwidth limit for Cassandra backups.
- **`cassandra_scheduled_time`**: Set the hour (0–23) for daily backups.

### Schema

#### Required
- `cassandra_scheduled_time` (Number)

#### Optional
- `bandwidth_limit_mbits`, `current_state`, `datacenter`, `enabled`, `include_lm20_data`, `include_rum_data`, `include_ts_metric_data`, `max_es_snapshots_to_clean`, `pause_backups`, `storage_path` (Various types)

#### Read-Only
- `id` (String)

---

## dynatrace_managed_internet_proxy

### Required API Token Scopes
- One of: `ControlManagement`, `ServiceProviderAPI`, `UnattendedInstall`

### How to Determine `tfvars` Values
- **`server`**: Use the proxy server address.
- **`port`**: Use the proxy port number.
- **`user` / `password`**: Provide credentials if required.
- **`non_proxy_hosts`**: List of hosts to bypass the proxy.

### Schema

#### Required
- `port` (Number)
- `scheme` (String)
- `server` (String)

#### Optional
- `non_proxy_hosts` (Set of String)
- `password` (String, Sensitive)
- `user` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_managed_network_zones

### Required API Token Scopes
- `ServiceProviderAPI`

### How to Determine `tfvars` Values
- **`name`**: Unique name for the network zone.
- **`description`**: Optional description.
- **`alternative_zones`**: List of fallback zones.
- **`fallback_mode`**: Choose from `ANY_ACTIVE_GATE`, `NONE`, `ONLY_DEFAULT_ZONE`.

### Schema

#### Optional
- `alternative_zones` (List of String)
- `description` (String)
- `fallback_mode` (String)
- `name` (String)
- `num_of_configured_activegates`, `num_of_configured_oneagents`, `num_of_oneagents_from_other_zones`, `num_of_oneagents_using` (Number)

#### Read-Only
- `id` (String)

---

## dynatrace_managed_preferences

**Note:** HTTP DELETE method not available. Terraform will no longer manage this resource on destroy, but the configuration will remain on the Dynatrace cluster.

### Required API Token Scopes
- `ServiceProviderAPI`

### How to Determine `tfvars` Values
- Set preferences for monitoring, support, telemetry, and remote access according to your organization’s policies.

### Schema

#### Required
- `ruxit_monitors_ruxit`, `support_send_billing`, `support_send_cluster_health`, `suppress_non_billing_relevant_data` (Boolean)

#### Optional
- `certificate_management_enabled`, `certificate_management_possible`, `community_create_user`, `community_external_search`, `help_chat_enabled`, `read_only_remote_access_allowed`, `remote_access_on_demand_only`, `support_allow_remote_access`, `support_send_events`, `telemetry_sharing` (Boolean)

#### Read-Only
- `id` (String)

---

## dynatrace_managed_public_endpoints

**Note:** HTTP DELETE method not available. Terraform will no longer manage this resource on destroy, but the configuration will remain on the Dynatrace cluster.

### Required API Token Scopes
- `ServiceProviderAPI`

### How to Determine `tfvars` Values
- Provide the main and additional web UI addresses, beacon forwarder, and CDN addresses used in your cluster.

### Schema

#### Optional
- `additional_web_ui_addresses` (Set of String)
- `beacon_forwarder_address`, `cdn_address`, `web_ui_address` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_managed_remote_access

**Note:** HTTP DELETE method not available. Terraform will no longer manage this resource on destroy, but the configuration will remain on the Dynatrace cluster.

### Required API Token Scopes
- `ServiceProviderAPI`

### How to Determine `tfvars` Values
- **`user_id`**: Email of the user requesting access.
- **`reason`**: Justification for access.
- **`requested_days`**: Duration of access.
- **`role`**: Role to be assigned (e.g., `devops-admin`).

### Schema

#### Required
- `reason`, `requested_days`, `role`, `user_id` (Various types)

#### Optional
- `state` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_managed_smtp

**Note:** HTTP DELETE method not available. Terraform will no longer manage this resource on destroy, but the configuration will remain on the Dynatrace cluster.

### Required API Token Scopes
- `ServiceProviderAPI`

### How to Determine `tfvars` Values
- Provide SMTP server details including host, port, credentials, and sender address.

### Schema

#### Required
- `host_name`, `password`, `sender_email_address`, `user_name` (Various types)

#### Optional
- `allow_fallback_via_mission_control`, `connection_security`, `is_password_configured`, `port`, `use_smtp_server` (Various types)

#### Read-Only
- `id` (String)

---

## Using Data Blocks to Retrieve Existing Information

To retrieve existing configuration from Dynatrace, use Terraform `data` blocks. For example:

```hcl
data "dynatrace_tenant" "tenant" {}
```

This allows you to dynamically reference the current environment ID, which can be used in other resources like:

```hcl
scope = data.dynatrace_tenant.tenant.id
```

---

