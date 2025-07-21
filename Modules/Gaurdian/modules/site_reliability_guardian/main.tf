
resource "dynatrace_site_reliability_guardian" "this" {
  name        = var.guardian_name
  description = var.guardian_description
  tags        = var.guardian_tags

  objectives {
    dynamic "objective" {
      for_each = var.objectives
      content {
        name                = objective.value.name
        description         = lookup(objective.value, "description", null)
        objective_type      = objective.value.objective_type
        dql_query           = lookup(objective.value, "dql_query", null)
        reference_slo       = lookup(objective.value, "reference_slo", null)
        comparison_operator = objective.value.comparison_operator
        target              = objective.value.target
        warning             = objective.value.warning
      }
    }
  }
}
