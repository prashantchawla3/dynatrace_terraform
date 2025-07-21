
#  Dynatrace Terraform Modules Documentation

This document provides an overview of various Dynatrace Terraform resources and their associated documentation. Configuration examples are excluded as per request.

---

## Resources Overview

---

### `dynatrace_app_monitoring` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Dynatrace App Monitoring: https://developer.dynatrace.com/develop/troubleshooting/self-monitoring/#accessing-app-function-logs
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:dt-javascript-runtime.app-monitoring)
- **Schema**:
  - Required:
    - `default_log_level (String)` — Possible values: `debug`, `error`, `info`, `off`, `warn`
  - Optional:
    - `app_monitoring (Block List, Max: 1)`
    - `default_trace_level (String)` — Possible values: `off`, `on`
  - Read-Only:
    - `id (String)`
  - Nested Schema:
    - `app_monitoring (Block Set, Min: 1)`
      - `app_id (String)`
      - `custom_log_level (String)` — Possible values: `debug`, `error`, `info`, `off`, `useDefault`, `warn`
      - `custom_trace_level (String)` — Possible values: `off`, `on`, `useDefault`

---

### `dynatrace_audit_log` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Audit Logs: https://www.dynatrace.com/support/help/manage/data-privacy-and-security/configuration/audit-logs
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:audit-log)
- **Schema**:
  - Required:
    - `enabled (Boolean)`
  - Read-Only:
    - `id (String)`

---

### `dynatrace_cloud_development_environments` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - AppEngine: https://docs.dynatrace.com/docs/platform/appengine
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:app-engine-registry.cloud-development-environments)
- **Schema**:
  - Optional:
    - `cloud_development_environments (Set of String)`
  - Read-Only:
    - `id (String)`

---

### `dynatrace_data_privacy` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Data Privacy: https://www.dynatrace.com/support/help/manage/data-privacy-and-security
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:preferences.privacy)
- **Schema**:
  - Required:
    - `data_collection (Block List, Min: 1, Max: 1)`
    - `do_not_track (Block List, Min: 1, Max: 1)`
    - `masking (Block List, Min: 1, Max: 1)`
    - `user_tracking (Block List, Min: 1, Max: 1)`
  - Optional:
    - `application_id (String)`
  - Read-Only:
    - `id (String)`
  - Nested Schema:
    - `data_collection`:
      - `opt_in_mode_enabled (Boolean)`
    - `do_not_track`:
      - `comply_with_do_not_track (Boolean)`
      - `do_not_track (String)` — Possible values: `Anonymous`, `Disable_rum`
    - `masking`:
      - `personal_data_uri_masking_enabled (Boolean)`
      - `user_action_masking_enabled (Boolean)`
    - `user_tracking`:
      - `persistent_cookie_enabled (Boolean)`

---

### `dynatrace_disk_options` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Exclude Disks: https://www.dynatrace.com/support/help/platform-modules/infrastructure-monitoring/hosts/configuration/exclude-disks-and-network-traffic#exclude-disks
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:disk.options)
- **Schema**:
  - Optional:
    - `disable_nfs_disk_monitoring (Boolean)`
    - `nfs_show_all (Boolean)`
    - `scope (String)`
    - `exclusions (Block List, Max: 1)`
  - Read-Only:
    - `id (String)`
  - Nested Schema:
    - `exclusion (Block List, Min: 1)`
      - `os (String)` — Possible values: `OS_TYPE_AIX`, `OS_TYPE_DARWIN`, `OS_TYPE_HPUX`, `OS_TYPE_LINUX`, `OS_TYPE_SOLARIS`, `OS_TYPE_UNKNOWN`, `OS_TYPE_WINDOWS`, `OS_TYPE_ZOS`
      - `filesystem (String)`
      - `mountpoint (String)`

---


### `dynatrace_limit_outbound_connections` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Allow Outbound Connections: https://developer.dynatrace.com/develop/functions/allow-outbound-connections/
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:dt-javascript-runtime.allowed-outbound-connections)
- **Schema**:
  - Required:
    - `allowed_outbound_connections (Block List, Min: 1, Max: 1)`
  - Read-Only:
    - `id (String)`
  - Nested Schema:
    - `enforced (Boolean)`
    - `host_list (Set of String)`

---

### `dynatrace_network_zone` (Resource)

- **Required API Token Scopes**: `networkZones.read`, `networkZones.write`
- **Documentation**:
  - Network Zones: https://www.dynatrace.com/support/help/setup-and-configuration/network-zones
  - Network Zones API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/network-zones
- **Schema**:
  - Optional:
    - `alternative_zones (List of String)`
    - `description (String)`
    - `fallback_mode (String)`
    - `name (String)`
    - `num_of_configured_activegates (Number)`
    - `num_of_configured_oneagents (Number)`
    - `num_of_oneagents_from_other_zones (Number)`
    - `num_of_oneagents_using (Number)`
  - Read-Only:
    - `id (String)`

---

### `dynatrace_network_zones` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Network Zones: https://www.dynatrace.com/support/help/setup-and-configuration/network-zones
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:networkzones)
- **Schema**:
  - Required:
    - `enabled (Boolean)`
  - Read-Only:
    - `id (String)`

---

### `dynatrace_oneagent_default_mode` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Monitoring Modes: https://docs.dynatrace.com/docs/platform-modules/application-security/getting-started/monitoring-modes
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:deployment.oneagent.default-mode)
- **Schema**:
  - Required:
    - `default_mode (String)`
  - Read-Only:
    - `id (String)`

---

### `dynatrace_oneagent_features` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - OneAgent Features: https://www.dynatrace.com/support/help/setup-and-configuration/dynatrace-oneagent/oneagent-features#configuration-via-web-ui
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:oneagent.features)
- **Schema**:
  - Required:
    - `enabled (Boolean)`
    - `key (String)`
  - Optional:
    - `forcible (Boolean)`
    - `instrumentation (Boolean)`
    - `scope (String)`
  - Read-Only:
    - `_restore_ (String)`
    - `id (String)`

---

### `dynatrace_oneagent_side_masking` (Resource)

- **Required API Token Scopes**: `settings.read`, `settings.write`
- **Documentation**:
  - Data Privacy: https://www.dynatrace.com/support/help/manage/data-privacy-and-security
  - Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings  
    (schemaId: builtin:oneagent.side.masking.settings)
- **Schema**:
  - Required:
    - `is_email_masking_enabled (Boolean)`
    - `is_financial_masking_enabled (Boolean)`
    - `is_numbers_masking_enabled (Boolean)`
    - `is_query_masking_enabled (Boolean)`
  - Optional:
    - `process_group_id (String)`
  - Read-Only:
    - `id (String)`

---

