
#  Dynatrace IAM, Policy, Permission & User Access Modules

This Terraform configuration suite provisions comprehensive Dynatrace Identity and Access Management (IAM) components including users, groups, policies, and bindings. It defines administrative boundaries, connects policies to environments and clusters, and organizes permission hierarchies with reusable modules.



---

##  Module Overview

| Module Scope                    | Resources Provisioned                                                   |
|--------------------------------|--------------------------------------------------------------------------|
| IAM Groups & Permissions       | `dynatrace_iam_group`, `dynatrace_iam_permission`                      |
| IAM Policies & Bindings        | `dynatrace_iam_policy`, `dynatrace_iam_policy_bindings`, `policy_boundary` |
| IAM Users                      | `dynatrace_iam_user`                                                    |
| Management Zone Permissions    | `dynatrace_mgmz_permission`                                             |
| Cluster Policies & Bindings    | `dynatrace_policy`, `dynatrace_policy_bindings`                         |
| User Profiles & Group Linking  | `dynatrace_user`, `dynatrace_user_group`                                |

---

##  Key Inputs & Example Usage

###  IAM Group Configuration

```hcl
iam_group_name = "platform-admins"
iam_group_permission_scope = "env:production"
```

Defines a group (`platform-admins`) scoped to `env:production`.

---

###  IAM Permission Attributes

```hcl
iam_permission_group  = "platform-admins"
iam_permission_account = "1234567890"
```

Creates permission binding for a group and account.

---

###  IAM Policy Block

```hcl
iam_policy_name         = "sre-policy-global"
iam_policy_statement_query = "allow access to management zones and monitoring dashboards"
iam_policy_description  = "Grants platform admin access..."
iam_policy_tags         = ["observability", "admin", "dashboard"]
```

Used to define resource visibility and action permissions.

---

###  IAM Policy Bindings

```hcl
iam_policy_bindings_group   = "platform-admins"
iam_policy_bindings_account = "1234567890"
iam_policy_bindings_policies = ["policy-001", "policy-002"]
```

Connects IAM policies to groups or accounts.

####  Bindings v2

```hcl
iam_policy_bindings_v2_policies = [
  {
    id         = "policy-001"
    parameters = { access = "read-write" }
    metadata   = { environment = "prod" }
  }
]
```

Provides scoped permissions with metadata for context-aware access.

---

###  IAM Policy Boundary

```hcl
iam_policy_boundary_name  = "admin-boundary"
iam_policy_boundary_query = "limit access to critical resources only"
```

Restricts access within sensitive segments.

---

###  IAM User Creation

```hcl
iam_user_email  = "sre@example.com"
iam_user_groups = ["platform-admins", "monitoring-team"]
```

Adds a user and assigns group memberships.

---

###  Management Zone Permissions

```hcl
mgmz_permission_group           = "observability-squad"
mgmz_permission_management_zone = "prod-zone"
mgmz_permission_permissions     = ["view", "edit", "configure"]
```

Grants zone-level access for a team within an environment.

---

###  Cluster Policy Declaration

```hcl
policy_name            = "cluster-policy-core"
policy_cluster         = "cluster-core-prod"
policy_statement_query = "allow cluster visibility for SRE team"
policy_tags            = ["cluster", "core", "access"]
```

Used to define cluster-level access.

###  Cluster Policy Bindings

```hcl
policy_bindings_group    = "platform-admins"
policy_bindings_policies = ["cluster-policy-core"]
```

Assigns policies to groups within cluster scopes.

---

###  User Profile & Group Mapping

```hcl
user_email     = "user@example.com"
user_first_name = "Alex"
user_last_name  = "Morgan"
user_user_name  = "amorgan"
user_groups     = ["monitoring-team", "data-ops"]
```

Creates a user and links to multiple teams.

####  User Group

```hcl
user_group_name           = "sre-team"
user_group_ldap_groups    = ["cn=sre-group,ou=ldap,dc=company,dc=local"]
user_group_sso_groups     = ["AzureAD_SRE"]
user_group_permission     = "view_and_configure"
user_group_environments   = ["env:prod", "env:staging"]
```

Manages mapping between identity providers and Dynatrace permissions.

---

##  Outputs

| Output Name         | Description                                |
|---------------------|--------------------------------------------|
| `iam_group_id`      | ID of the IAM group                        |
| `iam_user_id`       | ID of the IAM user                         |
| `iam_policy_id`     | ID of the created IAM policy               |
| `iam_permission_id` | ID of the IAM permission binding           |
| `user_group_id`     | ID of the user group mapping               |

---


##  Example Composition

```hcl
module "iam_group" {
  source         = "./modules/dynatrace_iam_group"
  iam_group_name = var.iam_group_name
}
```

Repeat similar structure across all module blocks. Use the exported IDs for references or downstream integrations.

---

