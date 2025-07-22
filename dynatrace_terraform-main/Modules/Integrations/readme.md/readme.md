
#  Dynatrace Issue Tracking Configuration Module

This Terraform module provisions Dynatrace issue tracking integrations by connecting your Dynatrace environment to external issue tracking systems such as JIRA, GitHub, Azure DevOps, and others.

It enables automatic issue creation, synchronization, and visibility into external tickets that relate to observability signals detected within Dynatrace.

---

##  What This Module Does

Each input variable represents part of the issue tracking configuration. The module binds these inputs into a single Dynatrace resource definition (such as a JIRA integration block), wiring authentication, filters, and issue formatting.

| Module Block                      | Purpose                                                  |
|----------------------------------|----------------------------------------------------------|
| `issue_tracking_enabled`         | Turns the issue tracking feature on or off              |
| `issue_tracking_issuelabel`      | Adds labels/tags for issues created or fetched          |
| `issue_tracking_issuequery`      | Filters the scope of visible or synchronized issues     |
| `issue_tracking_issuetheme`      | Categorizes issues by theme or business domain          |
| `issue_tracking_issuetrackersystem` | Specifies integration system name (e.g., JIRA, GitHub) |
| `issue_tracking_token`           | API access token (used securely)                        |
| `issue_tracking_url`             | API base URL of your issue tracking system              |
| `issue_tracking_username`        | Integration username                                    |
| `issue_tracking_insert_after`    | Optional insert ordering metadata for sequencing        |
| `issue_tracking_password`        | Password for systems using basic authentication         |

---

##  Variable Reference 
###  `issue_tracking_enabled`

- **Description**: Globally enables or disables issue tracking in Dynatrace.
- **Type**: `bool`
- **Default**: `true`


---

###  `issue_tracking_issuelabel`

- **Description**: Tag applied to issues, useful for classification and filtering.
- **Type**: `string`
- **Default**: `"dynatrace-issue"`



---

###  `issue_tracking_issuequery`

- **Description**: Query string used to pull relevant issues from the tracker.
- **Type**: `string`
- **Default**: `"project = SRE AND status != Done"`



---

###  `issue_tracking_issuetheme`

- **Description**: Logical category/theme applied to the issue.
- **Type**: `string`
- **Default**: `"observability"`



---

###  `issue_tracking_issuetrackersystem`

- **Description**: External tracking system being integrated.
- **Type**: `string`
- **Default**: `"JIRA"`



---

###  `issue_tracking_token`

- **Description**: API token for authenticating with the issue tracker.
- **Type**: `string` (sensitive)
- **Default**: `"fake-token"`


---

###  `issue_tracking_url`

- **Description**: Base API URL used for connection.
- **Type**: `string`
- **Default**: `"https://jira.company.com"`



---

###  `issue_tracking_username`

- **Description**: Username used to authenticate with issue tracking system.
- **Type**: `string`
- **Default**: `"sre_bot"`



---

###  `issue_tracking_insert_after`

- **Description**: Used to control ordering when creating multiple integrations.
- **Type**: `string`
- **Default**: `null`


---

###  `issue_tracking_password`

- **Description**: Password for integrations requiring basic auth.
- **Type**: `string` (sensitive)
- **Default**: `null`



---

##  Outputs

These outputs expose the IDs of created resources for downstream modules or debugging.

| Output Name              | Description                                                 |
|--------------------------|-------------------------------------------------------------|
| `issue_tracking_id`      | Unique ID of the configured issue tracking resource         |
| `remote_environment_id`  | ID of the associated remote environment (if created)        |

---


##  Usage

Here is how you can wire it in `main.tf`:

```hcl
module "issue_tracking_enabled" {
  source                 = "./modules/dynatrace_issue_tracking"
  issue_tracking_enabled = true
}

module "issue_tracking_issuetrackersystem" {
  source                        = "./modules/dynatrace_issue_tracking"
  issue_tracking_issuetrackersystem = "JIRA"
}
```

Each variable maps directly to its respective field in Dynatrace’s issue tracking resource.

---

