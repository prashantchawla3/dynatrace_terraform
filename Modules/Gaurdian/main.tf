module "site_reliability_guardian" {
  source = "./modules/site_reliability_guardian"

  guardian_name        = var.guardian_name
  guardian_description = var.guardian_description
  guardian_tags        = var.guardian_tags
  objectives           = var.objectives
}

module "automation_workflow" {
  source = "./modules/automation_workflow"

  workflow_title       = var.workflow_title
  workflow_description = var.workflow_description
  workflow_actor       = var.workflow_actor
  workflow_owner       = var.workflow_owner
  workflow_tasks       = var.workflow_tasks
  workflow_trigger     = var.workflow_trigger
}
