

# Terraform Modules Documentation

## dynatrace_devobs_agent_optin

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`agent_optin_scope`**: Use the identifier of the scope you want to apply the setting to (e.g., `PROCESS_GROUP-1234567890000000`). This can be retrieved using the Dynatrace API or UI.
- **`agent_optin_enabled`**: Set to `true` or `false` depending on whether you want to enable or disable the setting.

### Schema

- **Required**
  - `enabled` (Boolean): This setting is enabled (`true`) or disabled (`false`).

- **Optional**
  - `scope` (String): The scope of this setting. Possible values include:
    - `PROCESS_GROUP`
    - `CLOUD_APPLICATION_NAMESPACE`
    - `KUBERNETES_CLUSTER`
    - Omit to apply to the entire environment.

- **Read-Only**
  - `id` (String): The ID of this resource.

### Using Data Block
To retrieve existing Developer Observability agent opt-in configurations, use:

```hcl
data "dynatrace_devobs_agent_optin" "example" {
  # configuration to match existing settings
}
```

---

## dynatrace_devobs_data_masking

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`data_masking_enabled`**: Set to `true` or `false`.
- **`data_masking_replacement_pattern`**: Define the pattern to replace sensitive data.
- **`data_masking_replacement_type`**: Choose from `SHA256` or `STRING`.
- **`data_masking_rule_name`**: Provide a name for the rule.
- **`data_masking_rule_type`**: Choose from `REGEX` or `VAR_NAME`.
- **`data_masking_rule_var_name`**: Specify the variable name if using `VAR_NAME`.

### Schema

- **Required**
  - `enabled` (Boolean)
  - `replacement_type` (String): `SHA256`, `STRING`
  - `rule_name` (String)
  - `rule_type` (String): `REGEX`, `VAR_NAME`

- **Optional**
  - `insert_after` (String): ID of the resource to insert after in order.
  - `replacement_pattern` (String)
  - `rule_regex` (String)
  - `rule_var_name` (String)

- **Read-Only**
  - `id` (String)

### Using Data Block
To retrieve existing sensitive data masking configurations, use:

```hcl
data "dynatrace_devobs_data_masking" "example" {
  # configuration to match existing settings
}
```

---

## dynatrace_devobs_git_onprem

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`git_onprem_provider`**: Choose from `AzureOnPrem`, `BitbucketOnPrem`, `GithubOnPrem`, `GitlabOnPrem`.
- **`git_onprem_url`**: Provide the HTTP/HTTPS URL of your on-prem Git server.

### Schema

- **Required**
  - `git_provider` (String): `AzureOnPrem`, `BitbucketOnPrem`, `GithubOnPrem`, `GitlabOnPrem`
  - `url` (String): HTTP/HTTPS URL of your Git server

- **Optional**
  - `include_credentials` (Boolean): If `true`, credentials will be included in requests.

- **Read-Only**
  - `id` (String)

### Using Data Block
To retrieve existing Git on-premise server configurations, use:

```hcl
data "dynatrace_devobs_git_onprem" "example" {
  # configuration to match existing settings
}
```

---
