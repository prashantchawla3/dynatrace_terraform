resource_count = 2
resource_names = ["resource1", "resource2"]
url = "https://www.example.com"
token = "example_token"
type = "api-token"
description = "Example description"
category = "Example category"
environment_scope = false
priority = "HIGH"
query = "fetch dt.entity.host, from:-15m filter hasPublicTraffic == true OR ebpfHasPublicTraffic == true fields host=entity.name, monitoringMode, host.id=id, compliant=(monitoringMode == \"FULL_STACK\")"
title = "Example title"
action_name = "setMonitoringMode"
mode = "FULL_STACK"
muted = false
boolean_value = true
show_monitoring_candidates = true
show_standalone_hosts = true
interface_saturation_threshold = 0.95
