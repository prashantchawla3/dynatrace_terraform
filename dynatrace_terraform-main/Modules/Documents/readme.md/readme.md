# Dynatrace Terraform Modules Documentation

This repository provides modular Terraform configurations for managing Dynatrace resources, including Launchpads, Documents, and Direct Shares. Each module is reusable, simple, and designed for consistency and clarity. This README provides comprehensive descriptions and examples for each module and variable.

> **Note:** No secrets, tokens, or credentials are stored or referenced in this folder. Ensure you securely configure provider authentication as appropriate.

---

## Modules Overview

### 1. `dynatrace_default_launchpad`

This module provisions default launchpad configurations for user groups.

#### Resources Used

* `dynatrace_default_launchpad`: Configures launchpad visibility and access per user group.

#### Variables

* `default_launchpads` *(map)*: A mapping of group names to lists of launchpads to enable or disable per group.

##### Structure

```hcl
variable "default_launchpads" {
  type = map(object({
    group_launchpads = list(object({
      is_enabled    = bool
      launchpad_id  = string
      user_group_id = string
    }))
  }))
}
```

##### Example

```hcl
default_launchpads = {
  example = {
    group_launchpads = [
      {
        is_enabled    = false
        launchpad_id  = "bbfbffa1-3cce-49a9-bc8f-c892c626f034"
        user_group_id = "ed8db894-e13f-43e8-8916-dd30b8e37e92"
      }
    ]
  }
}
```

#### Outputs

* `launchpad_statuses`: Map of launchpad configuration statuses per group.

---

### 2. `dynatrace_document`

This module provisions documents in Dynatrace such as dashboards, markdown content, or HTML snippets.

#### Resources Used

* `dynatrace_document`: Creates a document in Dynatrace with a specific format and structure.

#### Variables

* `documents` *(map)*: Map of document keys to document definitions including type, name, and content.

##### Structure

```hcl
variable "documents" {
  type = map(object({
    type    = string
    name    = string
    content = any
  }))
}
```

##### Example

```hcl
documents = {
  dashboard1 = {
    type = "dashboard"
    name = "Example Dashboard"
    content = {
      version = 13
      variables = []
      tiles = {
        "0" = {
          type    = "markdown"
          title   = ""
          content = "!Image of a Dashboard"
        }
      }
      layouts = {
        "0" = { x = 0, y = 0, w = 24, h = 14 }
      }
    }
  }
}
```

#### Outputs

* `document_ids`: Returns a map of document keys to their generated Dynatrace document IDs.

---

### 3. `dynatrace_direct_shares`

This module manages direct sharing rules for Dynatrace documents.

#### Resources Used

* `dynatrace_direct_shares`: Defines who can access documents and at what access level.

#### Variables

* `direct_shares` *(map)*: Mapping of document keys to sharing rules, including access level and list of recipients.

##### Structure

```hcl
variable "direct_shares" {
  type = map(object({
    document_key = string
    access       = string
    recipients = list(object({
      id   = string
      type = string
    }))
  }))
}
```

##### Example

```hcl
direct_shares = {
  share1 = {
    document_key = "dashboard1"
    access       = "read-write"
    recipients = [
      { id = "441664f0-23c9-40ef-b344-18c02c23d787", type = "user" },
      { id = "441664f0-23c9-40ef-b344-18c02c23d788", type = "group" }
    ]
  }
}
```

#### Outputs

* `shared_documents`: A mapping of document keys to their shared Dynatrace document IDs.

---

## How to Use

Each module is self-contained and can be reused across multiple Dynatrace configurations. Below is an example of how to call the modules:

```hcl
module "default_launchpads" {
  source              = "./modules/dynatrace_default_launchpad"
  default_launchpads = var.default_launchpads
}

module "documents" {
  source   = "./modules/dynatrace_document"
  documents = var.documents
}

module "direct_shares" {
  source        = "./modules/dynatrace_direct_shares"
  direct_shares = var.direct_shares
}

```
## How to Use

1. Update or use the provided `sample.tfvars` file in the root directory to supply values for the modules.
2. All modules are already called in the `main.tf` file in the root.
3. You only need to run the following commands to deploy:

```bash
terraform init
terraform plan -var-file="readme.md/sample.tfvars"
terraform apply -var-file="readme.md/sample.tfvars"
```

---
## Notes

* Always review the structure of the JSON or HTML content used in documents.
* Ensure IDs (launchpad, user group, recipients) are valid and exist in your Dynatrace environment.
* Access types for `direct_shares` should match allowed values in Dynatrace (e.g., `read-only`, `read-write`).

---
