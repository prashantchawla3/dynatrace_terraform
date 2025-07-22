resource "dynatrace_azure_service" "this" {
  for_each = {
    for svc, config in var.azure_services :
    svc => config
    if contains(keys(data.dynatrace_azure_supported_services.supported.services), svc)
  }

  credentials_id          = dynatrace_azure_credentials.this.id
  use_recommended_metrics = each.value.use_recommended_metrics
  name                    = each.key
}
