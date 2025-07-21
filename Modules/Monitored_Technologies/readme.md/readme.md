

## Dynatrace Monitored Technologies Resources

Each of the following resources enables or disables monitoring for a specific technology on a host or across the environment.

### Common Required API Token Scopes
- `settings.read`
- `settings.write`

### Common tfvars Guidance
- **`enabled`**: Set to `true` to enable monitoring, or `false` to disable it.
- **`host_id`**: Use `"environment"` to apply the setting globally, or specify a specific host ID.

---

### `dynatrace_monitored_technologies_apache`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_dotnet`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `enabled_dot_net_core` (Boolean)
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_go`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `enabled_go_static_monitoring` (Boolean)
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_iis`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_java`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_nginx`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_nodejs`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_opentracing`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_php`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `enable_php_cli_server` (Boolean)
  - `enabled_fast_cgi` (Boolean)
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_python`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_varnish`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

### `dynatrace_monitored_technologies_wsmb`

#### Schema

- **Required**
  - `enabled` (Boolean)
- **Optional**
  - `host_id` (String)
- **Read-Only**
  - `id` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. Use the `terraform-provider-dynatrace -export` command to retrieve existing configurations for each monitored technology.

---
