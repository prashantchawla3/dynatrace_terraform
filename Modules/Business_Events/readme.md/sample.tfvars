buckets_enabled = true
bucket_name = "default_bizevents"
buckets_matcher = "matchesValue(event.type, \"com.easytrade.buy-assets\")"
rule_name = "buy_assets_rule"

content_type_matcher = "EQUALS"
content_type_value   = "application/json"
parser               = "Text"
scope                = "environment"

metrics_enabled     = true
metrics_key         = "bizevents.easyTrade.TradingVolume"
metrics_matcher     = "matchesValue(event.type, \"com.easytrade.buy-assets\")"
measure             = "ATTRIBUTE"
measure_attribute   = "trading_volume"

oneagent_enabled     = true
category_source_type = "request.path"
event_data_fields = {
  rsbody = {
    name = "rsbody"
    source = {
      path        = "*"
      source_type = "response.body"
    }
  },
  technology = {
    name = "technology"
    source = {
      source      = "java"
      source_type = "constant.string"
    }
  }
}
provider_source       = "www.easytravel.com"
provider_source_type  = "constant.string"
type_source           = "com.easytravel.search-journey"
type_source_type      = "constant.string"
trigger_type          = "STARTS_WITH"
trigger_case_sensitive = false
trigger_value         = "/easytravel/rest/journeys"
trigger_data_source   = "request.path"

outgoing_enabled               = true
outgoing_category_source       = "Category 1"
outgoing_category_source_type  = "constant.string"
outgoing_field_name            = "Field 1"
outgoing_field_path            = "Path 1"
outgoing_field_source_type     = "request.body"
outgoing_provider_source       = "Provider 1"
outgoing_provider_source_type  = "constant.string"
outgoing_type_source           = "Type 1"
outgoing_type_source_type      = "constant.string"
outgoing_trigger_type          = "EQUALS"
outgoing_trigger_case_sensitive = false
outgoing_trigger_value         = "Terraform"
outgoing_trigger_data_source   = "request.path"

processing_enabled   = true
processing_matcher   = "matchesValue(event.type, \"com.easytrade.buy-assets\")"
processing_script    = "FIELDS_ADD(trading_volume:price*amount)"
sample_event = <<EOT
{
  "id": "OR-838475",
  "paymentType": "paypal",
  "plannedDeliveryDate": "01.01.2021",
  "total": 234
}
EOT

transformation_fields = {
  amount = {
    name     = "amount"
    type     = "DOUBLE"
    array    = false
    optional = false
    readonly = true
  },
  price = {
    name     = "price"
    type     = "DOUBLE"
    array    = false
    optional = false
    readonly = true
  }
}

security_query              = "matchesPhrase(content, \"buy_assets_rule\")"
security_value_source_field = "buy_assets_rule"
security_value_source       = "FIELD"
