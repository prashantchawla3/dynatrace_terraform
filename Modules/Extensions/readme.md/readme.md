
# Terraform Dynatrace Resources

## dynatrace_extension_execution_controller

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**Dynatrace Documentation:**
- Extensions 2.0: https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/extensions-concepts  
- Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings (schemaId: builtin:eec.local)

**Schema:**

- **Required:**
  - `enabled` (Boolean): This setting is enabled (`true`) or disabled (`false`)

- **Optional:**
  - `ingest_active` (Boolean): Enable local HTTP Metric, Log and Event Ingest API
  - `performance_profile` (String): Possible values: `DEFAULT`, `HIGH`
  - `scope` (String): The scope of this setting (`HOST`, `HOST_GROUP`). Omit to cover the whole environment.
  - `statsd_active` (Boolean): Enable Dynatrace StatsD

- **Read-Only:**
  - `id` (String): The ID of this resource

---

## dynatrace_extension_execution_remote

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**Dynatrace Documentation:**
- Extension Execution Controller: https://www.dynatrace.com/support/help/extend-dynatrace/extensions20/extensions-concepts#eec  
- Settings API: https://www.dynatrace.com/support/help/dynatrace-api/environment-api/settings (schemaId: builtin:eec.remote)

**Schema:**

- **Required:**
  - `performance_profile` (String): Select performance profile for Extension Execution Controller
  - `scope` (String): The scope of this setting (`ENVIRONMENT_ACTIVE_GATE`)

- **Read-Only:**
  - `id` (String): The ID of this resource

---

## dynatrace_hub_extension_active_version

**Required API Token Scopes:**
- `extensions.write`
- `extensionEnvironment.write`
- `extension.read`
- `extensionEnvironment.read`

**Dynatrace Documentation:**
- Extensions API: https://docs.dynatrace.com/docs/dynatrace-api/environment-api/extensions-20

**Schema:**

- **Required:**
  - `name` (String): The fully qualified name of the extension (e.g., `com.dynatrace.extension.jmx-liberty-cp`)
  - `version` (String): The version that should be active

- **Read-Only:**
  - `id` (String): The ID of this resource

---

## dynatrace_hub_extension_config

**Required API Token Scopes:**
- `extensions.write`
- `extension.read`
- `hub.read`

**Dynatrace Documentation:**
- Extensions API: https://docs.dynatrace.com/docs/dynatrace-api/environment-api/extensions-20

**Schema:**

- **Required:**
  - `name` (String): The fully qualified name of the extension (e.g., `com.dynatrace.extension.jmx-liberty-cp`)
  - `value` (String): The JSON encoded value for this monitoring configuration

- **Optional:**
  - `active_gate_group` (String): The name of the Active Gate Group this configuration applies to
  - `host` (String): The ID of the host this configuration applies to
  - `host_group` (String): The ID of the host group this configuration applies to
  - `management_zone` (String): The name of the Management Zone this configuration applies to

- **Read-Only:**
  - `id` (String): The ID of this resource

---
