

## `dynatrace_builtin_process_monitoring`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`host_group_id`**: Set to `"environment"` or a specific host group ID.
- Enable or disable monitoring for specific built-in process types using Boolean flags (e.g., `aspnetcore`, `container`, `go_static`).

### Schema

#### Required
- `host_group_id` (String)

#### Optional (Boolean flags for process types)
- `aspnetcore`
- `cf_appsmanagerjs`
- `container`
- `docker_pauseamd64`
- `exe_bbs`
- `exe_caddy`
- `exe_schedular`
- `exe_silkdaemon`
- `go_static`
- `node_nodegyp`

---

## `dynatrace_process_availability`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Enable or disable the rule.
- **`name`**: Name of the availability rule.
- **`rules`**: Define conditions based on process properties.
- **`metadata`**: Add key-value metadata for the rule.

### Schema

#### Required
- `enabled` (Boolean)
- `name` (String)

#### Nested: `rules.rule`
- `property` (String)
- `condition` (String)

#### Nested: `metadata.item`
- `key` (String)
- `value` (String)

---

## `dynatrace_process_monitoring`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`host_group_id`**: Specify the host group.
- **`auto_monitoring`**: Enable or disable automatic monitoring.

### Schema

#### Required
- `host_group_id` (String)
- `auto_monitoring` (Boolean)

---

## `dynatrace_process_monitoring_rule`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Enable or disable the rule.
- **`mode`**: Set the monitoring mode (e.g., `MONITORING_OFF`).
- **`host_group_id`**: Specify the host group.
- **`condition`**: Define the condition for applying the rule.

### Schema

#### Required
- `enabled` (Boolean)
- `mode` (String)
- `host_group_id` (String)

#### Nested: `condition`
- `item` (String)
- `operator` (String)
- `value` (String)

---

## `dynatrace_process_visibility`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Enable or disable process visibility.
- **`max_processes`**: Set the maximum number of processes to monitor.
- **`scope`**: Use `"environment"` or a specific scope.

### Schema

#### Required
- `enabled` (Boolean)
- `max_processes` (Number)
- `scope` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

