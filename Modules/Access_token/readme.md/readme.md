

# Terraform Dynatrace Resources Reference

---

## `dynatrace_activegate_token`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Provide Values in `tfvars`
You can determine the values for this resource based on your organization's ActiveGate token policy. These settings are typically configured by Dynatrace administrators or security teams.

Use the following structure in your `tfvars` file:
```hcl
activegate_token_config = {
  auth_token_enforcement_manually_enabled = <true_or_false>
  expiring_token_notifications_enabled    = <true_or_false>
}
```

### Schema

**Required**
- `auth_token_enforcement_manually_enabled` (Boolean): Manually enforce ActiveGate token authentication.
- `expiring_token_notifications_enabled` (Boolean): Enable notifications for expiring tokens.

**Read-Only**
- `id` (String): The ID of this resource.

---

## `dynatrace_ag_token`

### Required API Token Scopes
- `activeGateTokenManagement.create`
- `activeGateTokenManagement.read`
- `activeGateTokenManagement.write`

### How to Provide Values in `tfvars`
These values are defined when creating a new ActiveGate token. You can choose the type (`ENVIRONMENT` or `CLUSTER`), set a name, and define an expiration policy.

Use the following structure in your `tfvars` file:
```hcl
ag_token_config = {
  type            = "ENVIRONMENT"
  expiration_date = "now+3d"
  name            = "your_token_name"
}
```

### Schema

**Required**
- `name` (String): The name of the token.
- `type` (String): Type of ActiveGate. Values: `ENVIRONMENT`, `CLUSTER`.

**Optional**
- `expiration_date` (String): Token expiration in UTC timestamp, ISO 8601, or relative format (e.g., `now+3d`).
- `seed` (Boolean): Whether the token is a seed token.

**Read-Only**
- `id` (String): The ID of this resource.
- `tenant_token` (String, Sensitive): Tenant token (requires `InstallerDownload` permission).
- `token` (String, Sensitive): The secret of the token.

---

## `dynatrace_api_token`

### Required API Token Scopes
- `apiTokens.read`
- `apiTokens.write`

### How to Provide Values in `tfvars`
You can define the name, scopes, and enablement status of the API token. Scopes should match the permissions required for your use case.

Use the following structure in your `tfvars` file:
```hcl
api_token_config = {
  name    = "your_token_name"
  enabled = true
  scopes  = ["scope1", "scope2"]
}
```

### Schema

**Required**
- `name` (String): The name of the token.
- `scopes` (Set of String): List of scopes assigned to the token.

**Optional**
- `creation_date` (String): ISO 8601 format.
- `enabled` (Boolean): Whether the token is enabled.
- `expiration_date` (String): Expiration date in ISO 8601.
- `last_used_date` (String): Last used date.
- `last_used_ip_address` (String): Last used IP.
- `modified_date` (String): Last modified date.
- `owner` (String): Owner of the token.
- `personal_access_token` (Boolean): Whether it's a personal access token.

**Read-Only**
- `id` (String): The ID of this resource.
- `token` (String, Sensitive): The secret of the token.

---

## `dynatrace_token_settings`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Provide Values in `tfvars`
These settings are typically managed by Dynatrace administrators to enforce token policies.

Use the following structure in your `tfvars` file:
```hcl
token_settings_config = {
  new_token_format = true
  personal_tokens  = true
}
```

### Schema

**Required**
- `new_token_format` (Boolean): Enable new Dynatrace API token format.
- `personal_tokens` (Boolean): Allow generation of personal access tokens.

**Read-Only**
- `id` (String): The ID of this resource.

---

## `dynatrace_api_token` (Data Source)

### How to Provide Values in `tfvars`
Specify the name of the token you want to retrieve. This is useful for referencing existing tokens.

### Schema

**Required**
- `name` (String): Name of the token to retrieve.

**Read-Only**
- `creation_date` (String)
- `enabled` (Boolean)
- `expiration_date` (String)
- `id` (String)
- `owner` (String)
- `personal_access_token` (Boolean)
- `scopes` (Set of String)

---

## `dynatrace_api_tokens` (Data Source)

### How to Provide Values in `tfvars`
No input is required. This data source retrieves all tokens available in the environment.

### Schema

**Read-Only**
- `api_tokens` (List of Object):
  - `creation_date` (String)
  - `enabled` (Boolean)
  - `expiration_date` (String)
  - `last_used_date` (String)
  - `last_used_ip_address` (String)
  - `modified_date` (String)
  - `name` (String)
  - `owner` (String)
  - `personal_access_token` (Boolean)
  - `scopes` (Set of String)
  - `token` (String)
- `id` (String)

---
