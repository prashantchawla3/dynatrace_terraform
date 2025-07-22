resource "dynatrace_custom_service_order" "this" {
  dotnet = var.custom_service_order.dotnet
  java   = var.custom_service_order.java
}

