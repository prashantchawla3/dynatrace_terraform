resource "dynatrace_aws_service" "this" {
  for_each = {
    for svc, config in var.aws_services :
    svc => config
    if contains(keys(data.dynatrace_aws_supported_services.supported.services), svc)
  }

  credentials_id          = dynatrace_aws_credentials.this.id
  use_recommended_metrics = each.value.use_recommended_metrics
  name                    = each.key
}
