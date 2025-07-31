output "custom_service_order_dotnet" {
  description = "Custom service detection order for .NET"
  value       = dynatrace_custom_service_order.this.dotnet
}

output "custom_service_order_java" {
  description = "Custom service detection order for Java"
  value       = dynatrace_custom_service_order.this.java
}
