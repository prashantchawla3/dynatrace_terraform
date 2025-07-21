

## `dynatrace_user_settings`

>  **Note**:  
> This resource is excluded by default in the export utility because it is scoped to an individual user and requires a personal access token.

### Required API Token Scopes
- `settings.read`
- `settings.write`

---

### How to Determine tfvars Values

- **`scope`**: Set to the user email or identifier (e.g., `user-terraform@dynatrace.com`).
- **`auto_language`**, **`auto_region`**, **`auto_theme`**, **`auto_timezone`**: Set to `true` to use browser defaults.
- **`language`**: Optional override. Use `"en"` for English or `"ja"` for Japanese.
- **`region`**: Optional override for region.
- **`theme`**: Optional override. Use `"dark"` or `"light"`.
- **`timezone`**: Optional override for timezone (e.g., `"UTC"`).

---

### Schema

#### Required
- `auto_language` (Boolean)
- `auto_region` (Boolean)
- `auto_theme` (Boolean)
- `auto_timezone` (Boolean)
- `scope` (String)

#### Optional
- `language` (String) — Possible values: `en`, `ja`
- `region` (String)
- `theme` (String) — Possible values: `dark`, `light`
- `timezone` (String)

#### Read-Only
- `id` (String)

---

### Data Source Usage

This resource does not have a dedicated data source. To retrieve existing user settings, use:

```bash
terraform-provider-dynatrace -export dynatrace_user_settings
```

Note that export requires a personal access token and is scoped per user.

---

