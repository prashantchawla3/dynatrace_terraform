slo_name                       = "example_slo"
slo_enabled                    = true
slo_description                = "Terraform Test"
slo_evaluation_type            = "AGGREGATE"
slo_evaluation_window          = "-1w"
slo_filter                     = "type(SERVICE),serviceType(WEB_SERVICE,WEB_REQUEST_SERVICE)"
slo_metric_expression          = "100*(builtin:service.requestCount.server:splitBy())/(builtin:service.requestCount.server:splitBy())"
slo_metric_name                = "terraform_test"
slo_target_success             = 95
slo_target_warning             = 98
slo_legacy_id                  = ""
burn_rate_visualization_enabled = false
fast_burn_threshold            = null

