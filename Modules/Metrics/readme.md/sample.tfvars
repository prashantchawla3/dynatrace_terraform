custom_units_name        = "example_unit"
custom_units_description = "Created by Terraform"
custom_units_plural_name = "TerraformUnits"
custom_units_symbol      = "T/u"

histogram_metrics_enable_histogram_bucket_ingest = false

metric_metadata_display_name = "example_metric"
metric_metadata_metric_id    = "metric-func:slo.terraform-test"
metric_metadata_unit         = "percent"

metric_query_metric_id       = "metric-func:slo.terraform-test"
metric_query_metric_selector = "((100*(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())/(builtin:service.requestCount.server:filter(in(\"dt.entity.service\",entitySelector(\"type(SERVICE),mzId(0000000000000000000),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)\"))):splitBy())) - (95.0))"

