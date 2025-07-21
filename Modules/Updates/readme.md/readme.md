

# Dynatrace Update Management Resources

This README documents the Terraform resources used to manage ActiveGate and OneAgent updates, as well as update windows in Dynatrace.

---

## `dynatrace_activegate_updates`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`auto_update`**: Set to `true` to enable automatic updates for ActiveGates.
- **`scope`**: Use `"environment"` or specify a specific scope.

### Schema

#### Required
- `auto_update` (Boolean)
- `scope` (String)

---

## `dynatrace_oneagent_updates`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`scope`**: Use `"environment"` or specify a specific scope.
- **`target_version`**: Specify the desired OneAgent version (e.g., `"latest"`).
- **`update_mode`**: Choose update mode (e.g., `"AUTOMATIC"`).

### Schema

#### Required
- `scope` (String)
- `target_version` (String)
- `update_mode` (String)

---

## `dynatrace_update_windows`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the update window.
- **`enabled`**: Set to `true` to enable the window.
- **`recurrence`**: Set to `"ONCE"` or another supported recurrence type.
- **`once_recurrence_start`** and **`once_recurrence_end`**: Define the start and end of the update window if recurrence is `"ONCE"`.

### Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `recurrence` (String)

#### Optional (when `recurrence = "ONCE"`)
- `once_recurrence.recurrence_range.start` (String)
- `once_recurrence.recurrence_range.end` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

