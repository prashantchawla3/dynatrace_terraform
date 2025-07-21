

## dynatrace_automation_business_calendar

**Required API Token Scopes:**
- `automation:calendars:read`
- `automation:calendars:write`

**How to determine tfvars values:**
- You can find or create business calendars in the Dynatrace UI under *Workflows > Calendars*. Use the calendar name, valid date ranges, and holiday definitions from your organization's calendar policies.

**Schema:**
- **Required:**
  - `title` (String): The title/name of the Business Calendar.
- **Optional:**
  - `description` (String): An optional description for the Business Calendar.
  - `holidays` (Block List): A list of holidays valid in this calendar.
  - `valid_from` (String): Start date of the calendar (e.g., `2023-07-04`).
  - `valid_to` (String): End date of the calendar.
  - `week_days` (Set of Number): Days considered as weekdays (1=Monday, ..., 7=Sunday).
  - `week_start` (Number): First day of the week (1=Monday, 7=Sunday).
- **Read-Only:**
  - `id` (String): The ID of this resource.
- **Nested:**
  - `holidays.holiday`:
    - `date` (String): Date of the holiday (e.g., `2023-12-25`).
    - `title` (String): Name of the holiday.

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_automation_business_calendar` to retrieve existing calendar configurations.

---


## dynatrace_automation_scheduling_rule

**Required API Token Scopes:**
- `automation:rules:read`
- `automation:rules:write`

**How to determine tfvars values:**
- You can define scheduling rules in Dynatrace under *Workflows > Scheduling Rules*. Use the calendar ID, recurrence patterns, and offsets based on your organization's scheduling needs.

**Schema:**
- **Required:**
  - `title` (String): The title/name of the scheduling rule.
- **Optional:**
  - `business_calendar` (String): ID of the associated business calendar.
  - `description` (String): Optional description of the rule.
  - `fixed_offset` (Block): Defines a rule offset by a number of days.
  - `grouping` (Block): Combines, intersects, or subtracts other rules.
  - `recurrence` (Block): Defines recurrence patterns.
  - `relative_offset` (Block): Defines a rule relative to other rules.
- **Read-Only:**
  - `id` (String): The ID of this resource.
- **Nested:**
  - `fixed_offset`:
    - `offset` (Number): Number of days to offset.
    - `rule` (String): ID of the base rule.
  - `grouping`:
    - `combine` (Set of String): IDs of rules to combine.
    - `intersect` (Set of String): IDs of rules to intersect.
    - `subtract` (Set of String): IDs of rules to subtract.
  - `recurrence`:
    - **Required:**
      - `datestart` (String): Start date of recurrence.
      - `frequency` (String): Frequency type (e.g., DAILY, WEEKLY).
      - `workdays` (String): Type of days (e.g., WORKING, HOLIDAYS).
    - **Optional:**
      - `days_in_month` (Set of Number)
      - `days_in_year` (Set of Number)
      - `easter` (Set of Number)
      - `interval` (Number)
      - `months` (Set of Number)
      - `weekdays` (Set of String)
      - `weeks` (Set of Number)
  - `relative_offset`:
    - `direction` (String): Direction of offset (e.g., previous).
    - `source_rule` (String): ID of the source rule.
    - `target_rule` (String): ID of the target rule.

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_automation_scheduling_rule` to retrieve existing scheduling rule configurations.

---


## dynatrace_automation_workflow_aws_connections

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- You can configure AWS connections in Dynatrace under *Workflows > AWS Integrations*. Use the AWS IAM role ARN and any optional policy ARNs as needed for your environment.

**Schema:**
- **Required:**
  - `name` (String): Name of the AWS connection.
  - `type` (String): Must be `webIdentity`.
- **Optional:**
  - `web_identity` (Block): Configuration for web identity authentication.
- **Read-Only:**
  - `id` (String): The ID of this resource.
- **Nested:**
  - `web_identity`:
    - **Required:**
      - `role_arn` (String, Sensitive): ARN of the AWS role to assume.
    - **Optional:**
      - `policy_arns` (List of String, Sensitive): Optional list of policy ARNs to restrict the role.

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_automation_workflow_aws_connections` to retrieve existing AWS connection configurations.

---


## dynatrace_automation_workflow_jira

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- You can configure Jira connections in Dynatrace under *Workflows > Jira Integrations*. Use your Jira server URL, authentication type (e.g., basic, cloud token, or PAT), and corresponding credentials.

**Schema:**
- **Required:**
  - `name` (String): The name of the Jira connection.
  - `type` (String): Authentication type. Possible values: `Basic`, `Cloud_token`, `Pat`.
  - `url` (String): URL of the Jira server.
- **Optional:**
  - `insert_after` (String, Deprecated): Used for ordering resource instances.
  - `password` (String, Sensitive): Password of the Jira user.
  - `token` (String, Sensitive): Token for the selected authentication type.
  - `user` (String): Username or email address.
- **Read-Only:**
  - `id` (String): The ID of this resource.

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_automation_workflow_jira` to retrieve existing Jira connection configurations.



## dynatrace_automation_workflow_k8s_connections

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- You can configure Kubernetes connections in Dynatrace under *Workflows > Kubernetes Integrations*. Use the namespace and UID of the `kube-system` namespace from your Kubernetes cluster, and generate a token for authentication.

**Schema:**
- **Required:**
  - `name` (String): The name of the EdgeConnect deployment.
  - `namespace` (String): The namespace where EdgeConnect is deployed.
  - `token` (String, Sensitive): Authentication token.
  - `uid` (String): UID of the `kube-system` namespace.
- **Optional:**
  - `insert_after` (String, Deprecated): Used for ordering resource instances.
- **Read-Only:**
  - `id` (String): The ID of this resource.

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_automation_workflow_k8s_connections` to retrieve existing Kubernetes connection configurations.

---


## dynatrace_automation_workflow_slack

**Required API Token Scopes:**
- `settings.read`
- `settings.write`

**How to determine tfvars values:**
- You can configure Slack connections in Dynatrace under *Workflows > Slack Integrations*. The token is obtained from the Slack App Management UI after installing the Slack for Workflows app from the Dynatrace Hub.

**Schema:**
- **Required:**
  - `name` (String): The name of the Slack connection.
  - `token` (String, Sensitive): The bot token from Slack.
- **Optional:**
  - `insert_after` (String, Deprecated): Used for ordering resource instances.
- **Read-Only:**
  - `id` (String): The ID of this resource.

**Data Block Usage:**
- Use `terraform-provider-dynatrace -export dynatrace_automation_workflow_slack` to retrieve existing Slack connection configurations.

---


