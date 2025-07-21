
## `dynatrace_issue_tracking`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Set to `true` to activate the integration.
- **`issuelabel`**: A label to categorize issues (e.g., `release_blocker`).
- **`issuequery`**: Use placeholders like `{NAME}`, `{VERSION}` to dynamically populate issue content.
- **`issuetheme`**: Choose from `ERROR`, `INFO`, or `RESOLVED`.
- **`issuetrackersystem`**: Choose from `GITHUB`, `GITLAB`, `JIRA`, `JIRA_CLOUD`, `JIRA_ON_PREMISE`, `SERVICENOW`.
- **`url`**: Provide the appropriate URL based on the tracker system.
- **`username`**: Username for authentication.
- **`token`**: Authentication token (sensitive).
- **`insert_after`** and **`password`** are optional.

### Schema

#### Required
- `enabled` (Boolean)
- `issuelabel` (String)
- `issuequery` (String)
- `issuetheme` (String)
- `issuetrackersystem` (String)
- `url` (String)
- `username` (String)

#### Optional
- `insert_after` (String)
- `password` (String)
- `token` (String, Sensitive)

#### Read-Only
- `id` (String)

### Data Source Usage
This resource does not have a dedicated data source. Use the `terraform-provider-dynatrace -export` command to retrieve existing configurations.

---

## `dynatrace_remote_environments`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: A unique name for the remote environment.
- **`network_scope`**: Choose from `CLUSTER`, `EXTERNAL`, or `INTERNAL`.
- **`token`**: A valid token from the remote environment.
- **`uri`**: Full URI of the remote Dynatrace environment.

### Schema

#### Required
- `name` (String)
- `network_scope` (String)
- `token` (String, Sensitive)
- `uri` (String)

#### Read-Only
- `id` (String)

### Data Source: `dynatrace_remote_environments`

#### How to Use
Use this data source to retrieve a list of all configured remote environments.

#### Schema

##### Read-Only
- `id` (String)
- `remote_environments` (List of Object)
  - `name` (String)
  - `network_scope` (String)
  - `token` (String)
  - `uri` (String)

---
