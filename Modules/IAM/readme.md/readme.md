

## `dynatrace_iam_group`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the IAM group.
- **`permissions`**: List of permissions with `name`, `type`, and `scope`.

### Schema

#### Required
- `name` (String)
- `permissions` (Block List)

#### Nested: `permissions.permission`
- `name` (String)
- `type` (String)
- `scope` (String)

---

## `dynatrace_iam_permission`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the permission.
- **`group`**: IAM group to assign the permission to.
- **`account`**: Account ID.

### Schema

#### Required
- `name` (String)
- `group` (String)
- `account` (String)

---

## `dynatrace_iam_policy`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the policy.
- **`statement_query`**: Policy statement.
- **`account`**: Account ID.
- **`description`**: Description of the policy.
- **`tags`**: List of tags.

### Schema

#### Required
- `name` (String)
- `statement_query` (String)
- `account` (String)

#### Optional
- `description` (String)
- `tags` (Set of String)

---

## `dynatrace_iam_policy_bindings`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`group`**: IAM group to bind policies to.
- **`account`**: Account ID.
- **`policies`**: List of policy names or IDs.

### Schema

#### Required
- `group` (String)
- `account` (String)
- `policies` (List of String)

---

## `dynatrace_iam_policy_bindings_v2`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`group`**: IAM group.
- **`account`**: Account ID.
- **`policy`**: List of policy blocks with `id`, `parameters`, and `metadata`.

### Schema

#### Required
- `group` (String)
- `account` (String)

#### Nested: `policy`
- `id` (String)
- `parameters` (Map of String)
- `metadata` (Map of String)

---

## `dynatrace_iam_policy_boundary`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the boundary.
- **`query`**: Boundary query.

### Schema

#### Required
- `name` (String)
- `query` (String)

---

## `dynatrace_iam_user`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`email`**: User email.
- **`groups`**: List of IAM groups.

### Schema

#### Required
- `email` (String)
- `groups` (List of String)

---

## `dynatrace_mgmz_permission`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`group`**: IAM group.
- **`environment`**: Environment ID.
- **`management_zone`**: Management zone ID.
- **`permissions`**: List of permissions.

### Schema

#### Required
- `group` (String)
- `environment` (String)
- `management_zone` (String)
- `permissions` (List of String)

---

## `dynatrace_policy`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Policy name.
- **`statement_query`**: Policy statement.
- **`cluster`**: Cluster ID.
- **`description`**: Description.
- **`tags`**: List of tags.

### Schema

#### Required
- `name` (String)
- `statement_query` (String)
- `cluster` (String)

#### Optional
- `description` (String)
- `tags` (Set of String)

---

## `dynatrace_policy_bindings`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`group`**: IAM group.
- **`cluster`**: Cluster ID.
- **`policies`**: List of policy names or IDs.

### Schema

#### Required
- `group` (String)
- `cluster` (String)
- `policies` (List of String)

---

## `dynatrace_user`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`email`**: User email.
- **`first_name`**, **`last_name`**, **`user_name`**: User details.
- **`groups`**: List of user groups.

### Schema

#### Required
- `email` (String)
- `first_name` (String)
- `last_name` (String)
- `user_name` (String)
- `groups` (List of String)

---

## `dynatrace_user_group`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Group name.
- **`ldap_groups`**, **`sso_groups`**: External group mappings.
- **`permissions`**: List of permission grants.

### Schema

#### Required
- `name` (String)

#### Optional
- `ldap_groups` (List of String)
- `sso_groups` (List of String)

#### Nested: `permissions.grant`
- `permission` (String)
- `environments` (List of String)

---

## Data Source Usage

These resources do not have dedicated data sources. Use the following command to retrieve existing configurations:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

