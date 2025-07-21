

# Terraform Modules Documentation

## Resource: `dynatrace_default_launchpad`

###  Required API Token Scopes
- `settings.read`
- `settings.write`

###  How to Determine `tfvars` Values
- Use the Dynatrace UI or API to retrieve:
  - `launchpad_id`: ID of the launchpad to assign.
  - `user_group_id`: ID of the user group.
- Set `is_enabled` to `true` or `false` based on whether the launchpad should be active for the group.

###  Schema

#### Optional
- `group_launchpads` (Block List, Max: 1): Set default launchpads for user groups.

#### Read-Only
- `id` (String): The ID of this resource.

#### Nested Schema: `group_launchpads`
- **Required**
  - `group_launchpad` (Block Set, Min: 1)

#### Nested Schema: `group_launchpads.group_launchpad`
- **Required**
  - `is_enabled` (Boolean): Whether the launchpad is enabled.
  - `launchpad_id` (String): ID of the launchpad.
  - `user_group_id` (String): ID of the user group.

---

## Resource: `dynatrace_direct_shares`

###  Required API Token Scopes
- `document:direct-shares:read`
- `document:direct-shares:write`
- `document:direct-shares:delete`

###  How to Determine `tfvars` Values
- `document_id`: Reference the ID from a `dynatrace_document` resource.
- `access`: Choose between `"read"` or `"read-write"`.
- `recipients`: Provide a list of recipient IDs and their types (`user` or `group`).

###  Schema

#### Required
- `document_id` (String): ID of the document to share.
- `recipients` (Block List, Min: 1, Max: 1)

#### Optional
- `access` (String): Access level (`read`, `read-write`).

#### Read-Only
- `id` (String): The ID of this resource.

#### Nested Schema: `recipients`
- **Optional**
  - `recipient` (Block Set, Max: 1000)

#### Nested Schema: `recipients.recipient`
- **Required**
  - `id` (String): Identifier of the recipient.
- **Optional**
  - `type` (String): Type of recipient (`user`, `group`).

---

## Resource: `dynatrace_document`

###  Required API Token Scopes
- `document:documents:read`
- `document:documents:write`
- `document:documents:delete`

###  How to Determine `tfvars` Values
- `type`: Choose from `dashboard`, `launchpad`, or `notebook`.
- `name`: Provide a descriptive name for the document.
- `content`: JSON-encoded structure of the document layout and data.

### Schema

#### Required
- `type` (String): Type of the document.
- `name` (String): Name of the document.
- `content` (String): JSON content of the document.

#### Optional
- `actor` (String): User context for execution.
- `owner` (String): Owner ID of the document.
- `private` (Boolean): Whether the document is private.

#### Read-Only
- `id` (String): The ID of this resource.
- `version` (Number): Version of the document.

---

## Data Source: `dynatrace_documents`

### Required API Token Scopes
- `document:documents:read`

### How to Use
Use this data source to retrieve existing documents by type.

### Schema

#### Optional
- `type` (String): Filter by document type (`dashboard`, `notebook`).

#### Read-Only
- `id` (String): The ID of this data source.
- `values` (List of Object)

#### Nested Schema: `values`
- `id` (String)
- `name` (String)
- `owner` (String)
- `type` (String)

---

