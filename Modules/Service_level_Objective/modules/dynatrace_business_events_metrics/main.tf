resource "dynatrace_business_events_metrics" "ford_buss_metrics_event" {
  enabled           = true
  key               = "bizevents.easyTrade.TradingVolume"
  matcher           = "matchesValue(event.type, \"com.easytrade.buy-assets\")"
  measure           = "ATTRIBUTE"
  measure_attribute = "trading_volume"
}