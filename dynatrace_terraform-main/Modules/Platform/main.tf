
module "grail_allowall" {
  source = "./Modules/dynatrace_grail_metrics_allowall"

  grail_allowall = var.grail_allowall
}

module "grail_allowlist" {
  source = "./Modules/dynatrace_grail_metrics_allowlist"

  grail_allowlist = var.grail_allowlist
}

module "platform_buckets" {
  source = "./Modules/dynatrace_platform_bucket"

  platform_buckets = var.platform_buckets
}

module "problem_fields" {
  source = "./Modules/dynatrace_problem_fields"

  problem_fields = var.problem_fields
}

module "problem_propagation_rules" {
  source = "./Modules/dynatrace_problem_record_propagation_rules"

  problem_propagation_rules = var.problem_propagation_rules
}

module "security_contexts" {
  source = "./Modules/dynatrace_security_context"

  security_contexts = var.security_contexts
}
