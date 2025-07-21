

#  Resource: `dynatrace_ownership_config`

##  Required API Token Scopes
- `settings.read`
- `settings.write`

##  How to Determine Values for `tfvars`

To configure ownership identifiers in `tfvars`:
- Define a list of keys (e.g., `dt.owner`, `owner`) that represent ownership metadata or tags.
- Each key should be wrapped in an `ownership_identifier` block with `enabled = true`.

##  Full Schema

###  Required Fields
- **ownership_identifiers** (Block List, Min: 1, Max: 1):  
  Contains:
  - **ownership_identifier** (Block List, Min: 1):
    - **enabled** (Boolean): Whether this identifier is active.
    - **key** (String): Key for ownership metadata and tags.

###  Read-Only Fields
- **id** (String): The ID of this resource.

##  Using a `data` Block

To retrieve existing ownership configuration, use:

```bash
terraform-provider-dynatrace -export dynatrace_ownership_config
```

Refer to the Dynatrace Ownership Documentation and Settings API (schemaId: `builtin:ownership.config`).

---

#  Resource: `dynatrace_ownership_teams`

##  Required API Token Scopes
- `settings.read`
- `settings.write`

##  How to Determine Values for `tfvars`

To configure team ownership in `tfvars`:
- Provide a unique `identifier` and `name` for the team.
- Define `responsibilities` using boolean flags.
- Optionally include:
  - `description`, `external_id`
  - `additional_information` (key-value pairs with optional URLs)
  - `contact_details` (email, JIRA, MS Teams, Slack, etc.)
  - `links` to relevant resources
  - `supplementary_identifiers` for alternate references

##  Full Schema

###  Required Fields
- **identifier** (String): Unique team identifier.
- **name** (String): Team name.
- **responsibilities** (Block List, Min: 1, Max: 1):
  - **development** (Boolean)
  - **infrastructure** (Boolean)
  - **line_of_business** (Boolean)
  - **operations** (Boolean)
  - **security** (Boolean)

### 🔹 Optional Fields
- **description** (String)
- **external_id** (String)
- **additional_information** (Block List, Max: 1):
  - **additional_information** (Block List, Min: 1):
    - **key** (String)
    - **value** (String)
    - **url** (String, optional)
- **contact_details** (Block List, Max: 1):
  - **contact_detail** (Block List, Min: 1):
    - **integration_type** (String): `EMAIL`, `JIRA`, `MS_TEAMS`, `SLACK`
    - **email**, **ms_teams**, **slack_channel**, **url** (Optional)
    - **jira** (Block List, Max: 1):
      - **default_assignee** (String)
      - **project** (String)
- **links** (Block List, Max: 1):
  - **link** (Block List, Min: 1):
    - **link_type** (String): `DASHBOARD`, `DOCUMENTATION`, `HEALTH_APP`, `REPOSITORY`, `RUNBOOK`, `URL`, `WIKI`
    - **url** (String)
- **supplementary_identifiers** (Block List, Max: 1):
  - **supplementary_identifier** (Block Set, Min: 1):
    - **supplementary_identifier** (String)

###  Read-Only Fields
- **id** (String): The ID of this resource.

##  Using a `data` Block

To retrieve existing team configurations, use:

```bash
terraform-provider-dynatrace -export dynatrace_ownership_teams
```

Refer to the Dynatrace Ownership Documentation and Settings API (schemaId: `builtin:ownership.teams`).

