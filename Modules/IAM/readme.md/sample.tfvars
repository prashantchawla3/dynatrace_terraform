iam_group_name                = "example-iam-group"
iam_group_permission_scope    = "example-scope"
iam_permission_group          = "example-permission-group"
iam_permission_account        = "123456789012"
iam_policy_name               = "example-policy"
iam_policy_statement_query    = "example-statement-query"
iam_policy_account            = "123456789012"
iam_policy_description        = "Example IAM policy description"

iam_policy_tags = [
  "Environment=production",
  "Team=devops"
]

iam_policy_bindings_group     = "example-bindings-group"
iam_policy_bindings_account   = "123456789012"
iam_policy_bindings_policies  = ["policy1", "policy2"]
iam_policy_bindings_v2_group  = "example-bindings-v2-group"
iam_policy_bindings_v2_account = "123456789012"
iam_policy_bindings_v2_policies = [
  {
    id         = "policy1"
    parameters = {
      param1 = "value1"
      param2 = "value2"
    }
    metadata   = {
      meta1 = "value1"
      meta2 = "value2"
    }
  },
  {
    id         = "policy2"
    parameters = {
      param1 = "value1"
      param2 = "value2"
    }
    metadata   = {
      meta1 = "value1"
      meta2 = "value2"
    }
  }
]
iam_policy_boundary_name      = "example-boundary"
iam_policy_boundary_query     = "example-boundary-query"
iam_user_email                = "user@example.com"
iam_user_groups               = ["group1", "group2"]
mgmz_permission_group         = "example-mgmz-group"
mgmz_permission_environment   = "example-environment"
mgmz_permission_management_zone = "example-management-zone"
mgmz_permission_permissions   = ["permission1", "permission2"]
policy_name                   = "example-cluster-policy"
policy_statement_query        = "example-cluster-statement-query"
policy_cluster                = "example-cluster"
policy_description            = "Example cluster policy description"

policy_tags = [
  "Environment=production",
  "Team=devops"
]

policy_bindings_group         = "example-cluster-bindings-group"
policy_bindings_cluster       = "example-cluster"
policy_bindings_policies      = ["policy1", "policy2"]
user_email                    = "user@example.com"
user_first_name               = "John"
user_last_name                = "Doe"
user_user_name                = "johndoe"
user_groups                   = ["group1", "group2"]
user_group_name               = "example-user-group"
user_group_ldap_groups        = ["ldap-group1", "ldap-group2"]
user_group_sso_groups         = ["sso-group1", "sso-group2"]
user_group_permission         = "example-permission"
user_group_environments       = ["env1", "env2"]
