

##  dynatrace_automation_controller_connections

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- `url`: Obtain from your Ansible Automation Controller instance (e.g., `https://ansible.yourdomain.com/api/v2/`)
- `token`: Generate an API token from the Ansible Automation Controller.

**Schema:**
- **Required:**
  - `name` (String): Unique connection name.
  - `type` (String): Must be `api-token`.
  - `url` (String): API endpoint URL.
- **Optional:**
  - `token` (String, Sensitive): API access token.
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
Use the `terraform-provider-dynatrace -export` command to retrieve existing connections.

---

##  dynatrace_db_app_feature_flags

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- Only configure under guidance from Dynatrace ONE.
- `name`, `type`, and value fields should be based on the feature flag configuration in Dynatrace.

**Schema:**
- **Required:**
  - `name` (String)
  - `type` (String): `Boolean`, `Number`, or `String`
- **Optional:**
  - `boolean_value` (Boolean)
  - `number_value` (Number)
  - `string_value` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
Use `terraform-provider-dynatrace -export` to retrieve existing feature flag configurations.

---

## dyatrace_discovery_default_rules

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- Review existing discovery rules in Dynatrace UI under Discovery & Coverage.

**Schema:**
- **Required:**
  - `rule` (Block List)
    - `category` (String)
    - `description` (String)
    - `environment_scope` (Boolean)
    - `id` (String)
    - `priority` (String)
    - `query` (String)
    - `title` (String)
- **Optional:**
  - `rule.actions` (Block List)
    - `action`
      - `name` (String)
      - `instant_action` (Boolean)
      - `parameters`
        - `parameter`
          - `name` (String)
          - `value` (String)
  - `rule.zero_rated` (Boolean)
- **Required:**
  - `settings`
    - `muted` (Boolean)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
Use `terraform-provider-dynatrace -export` to retrieve existing discovery rules.

---

## dynatrace_discovery_feature_flags

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- Check the Discovery & Coverage section in Dynatrace for available feature flags.

**Schema:**
- **Required:**
  - `name` (String)
  - `type` (String): `Boolean`, `Number`, or `String`
- **Optional:**
  - `boolean_value` (Boolean)
  - `number_value` (Number)
  - `string_value` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
Use `terraform-provider-dynatrace -export` to retrieve existing feature flags.

---

##  dynatrace_event_driven_ansible_connections

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- `url`: Get from your Event-Driven Ansible source plugin webhook.
- `token`: Generate from the Event-Driven Ansible Controller.

**Schema:**
- **Required:**
  - `name` (String)
  - `type` (String): Must be `api-token`
  - `url` (String)
- **Optional:**
  - `token` (String, Sensitive)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
Use `terraform-provider-dynatrace -export` to retrieve existing connections.

---

## dynatrace_infraops_app_feature_flags

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- Only configure under guidance from Dynatrace ONE.
- Check Infrastructure & Operations section in Dynatrace.

**Schema:**
- **Required:**
  - `name` (String)
  - `type` (String): `Boolean`, `Number`, or `String`
- **Optional:**
  - `boolean_value` (Boolean)
  - `number_value` (Number)
  - `string_value` (String)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
Use `terraform-provider-dynatrace -export` to retrieve existing feature flags.

---

##  dynatrace_infraops_app_settings

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- Review Infrastructure & Operations settings in Dynatrace.

**Schema:**
- **Required:**
  - `show_monitoring_candidates` (Boolean)
  - `show_standalone_hosts` (Boolean)
- **Optional:**
  - `interface_saturation_threshold` (Number)
- **Read-Only:**
  - `id` (String)

**Data Block Usage:**
Use `terraform-provider-dynatrace -export` to retrieve existing app settings.

---

