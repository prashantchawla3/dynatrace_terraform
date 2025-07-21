

# Dynatrace Alerting and Notification Resources

Each resource below configures a specific type of alerting or notification integration in Dynatrace.

---

## `dynatrace_alerting`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Name of the alerting profile.

### Schema

- **Required**
  - `name` (String)

---

## `dynatrace_ansible_tower_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set values for:
  - `active`, `name`, `profile`, `insecure`, `job_template_url`, `username`, `password`, `custom_message`

### Schema

- **Required**
  - `active` (Boolean)
  - `name` (String)
  - `profile` (String)
  - `job_template_url` (String)
  - `username` (String)
  - `password` (String)

- **Optional**
  - `insecure` (Boolean)
  - `custom_message` (String)

---

## `dynatrace_email_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set values for:
  - `active`, `name`, `profile`, `subject`, `to`, `cc`, `bcc`, `notify_closed_problems`, `body`

### Schema

- **Required**
  - `active`, `name`, `profile`, `subject`, `to`

- **Optional**
  - `cc`, `bcc`, `notify_closed_problems`, `body`

---

## `dynatrace_jira_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set values for:
  - `active`, `name`, `profile`, `url`, `username`, `api_token`, `project_key`, `issue_type`, `summary`, `description`

### Schema

- **Required**
  - All fields listed above

---

## `dynatrace_mobile_notifications`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `enabled` (Boolean)

---

## `dynatrace_ops_genie_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `domain`, `message`, `api_key`

---

## `dynatrace_pager_duty_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `account`, `service`, `api_key`

---

## `dynatrace_service_now_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `instance`, `username`, `password`, `message`, `incidents`, `events`

---

## `dynatrace_slack_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `url`, `channel`, `message`

---

## `dynatrace_trello_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `application_key`, `board_id`, `list_id`, `resolved_list_id`, `text`, `description`, `authorization_token`

---

## `dynatrace_victor_ops_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `api_key`, `routing_key`, `message`

---

## `dynatrace_webhook_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `url`

- **Optional**
  - `insecure`, `notify_event_merges`, `notify_closed_problems`, `payload`, `headers`, `use_oauth_2`, `oauth_2_credentials`

- **Nested: `headers.header`**
  - `name`, `value`, `secret_value`

- **Nested: `oauth_2_credentials`**
  - `access_token_url`, `client_id`, `client_secret`

---

## `dynatrace_xmatters_notification`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### Schema

- **Required**
  - `active`, `name`, `profile`, `url`

- **Optional**
  - `insecure`, `payload`, `headers`

- **Nested: `headers.header`**
  - `name`, `value`, `secret_value`

---

## Data Source Usage

These resources do not have dedicated data sources. Use the following command to retrieve existing configurations:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

