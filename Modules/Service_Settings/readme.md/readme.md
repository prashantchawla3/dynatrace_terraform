

## `dynatrace_davis_copilot`

>  **Preview Notice**  
> Davis CoPilot is currently in **Preview** and only accessible to selected customers. For feedback or access, contact your Customer Success Manager or join the Dynatrace Community user group.

### Required API Token Scopes
- `settings.read`
- `settings.write`

---

### How to Determine tfvars Values

- **`enable_copilot`**: Set to `true` to activate Davis CoPilot. Note that enabling this does not automatically assign user permissions.
- **`enable_tenant_aware_data_mining`**: Set to `true` to allow Davis CoPilot to scan your Grail data and build a semantic index for environment-aware queries.
- **`blocklist_entries`**: Define a list of data buckets or tables to exclude from the semantic index.
  - **`name`**: Name of the blocklisted item.
  - **`type`**: Must be either `BUCKET` or `TABLE`.

---

### Schema

#### Required
- `enable_copilot` (Boolean)

#### Optional
- `enable_tenant_aware_data_mining` (Boolean)
- `blocklist_entries` (Block List, Max: 1)

#### Read-Only
- `id` (String)

---

### Nested Schema: `blocklist_entries.blocklist_entrie`

#### Required
- `name` (String)
- `type` (String) — Possible values: `BUCKET`, `TABLE`

---

### Data Source Usage

This resource does not have a dedicated data source. Use the following command to retrieve existing configurations:

```bash
terraform-provider-dynatrace -export dynatrace_davis_copilot
```

---
