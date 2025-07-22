
#  Dynatrace HTTP Synthetic Monitoring Terraform Modules

This Terraform module suite configures Dynatrace HTTP synthetic monitors, enabling full-stack observability for key endpoints. It supports cookie injection, performance threshold detection, outage handling, and scripted validation for advanced monitoring workflows.

---

##  What This Module Does

| Module                             | Purpose                                                                 |
|-----------------------------------|-------------------------------------------------------------------------|
| `http_monitor_cookies`            | Inject and scope cookies into HTTP synthetic monitor executions         |
| `enable_outage_monitoring`        | Toggles global outage logic across all monitors                         |
| `global_consecutive_outage_count_threshold` | Number of global failures before outage triggers              |
| `global_outages`, `local_outages`| Enable detection at global and location levels                          |
| `local_consecutive_outage_count_threshold` | Failures at location required for alert                    |
| `local_location_outage_count_threshold`     | Number of locations failing to declare outage             |
| `outage_scope`                    | Defines which monitor group outage logic applies to                     |
| `performance_monitors`           | Applies performance threshold rules based on loading time events        |
| `scripts`                        | Scripts used by synthetic monitors to validate and configure requests   |
| `monitors`                       | Defines monitors including schedule, locations, outage policies, script |

---

##  Cookie Monitoring Configuration

###  Variable: `http_monitor_cookies`

Injects custom cookies into synthetic requests to simulate authenticated or user-context traffic.

| Field     | Type        | Description                       |
|-----------|-------------|-----------------------------------|
| `enabled` | `bool`      | If true, enables cookie injection |
| `scope`   | `string`    | Monitor reference (e.g. `monitor:id`) |
| `cookies` | `list`      | List of cookies with `name`, `domain`, and `value` |




---

##  Outage Handling Configuration

###  Key Variables

| Variable | Description |
|----------|-------------|
| `enable_outage_monitoring` | Toggle to enable outage detection across monitors |
| `global_outages`           | Enables global failure tracking |
| `global_consecutive_outage_count_threshold` | Threshold to declare outage globally |
| `local_outages`            | Enables per-location monitoring |
| `local_consecutive_outage_count_threshold` | Location-level failure count |
| `local_location_outage_count_threshold` | Number of failed locations required |
| `outage_scope`             | Scope (e.g. `"monitor-group:frontend"`) where rules apply |


##  Performance Threshold Monitors

###  Variable: `performance_monitors`

Detect performance events such as time-to-first-byte (TTFB) and loading time violations.

| Field      | Description |
|------------|-------------|
| `enabled`  | Enables monitoring |
| `scope`    | Monitor scope (e.g. `monitor:checkout`) |
| `thresholds` | List of `{ event, threshold }` definitions |


##  Synthetic Scripts

###  Variable: `scripts`

Defines request execution behavior inside synthetic monitors including headers, validation rules, and TLS settings.

| Field                | Description |
|----------------------|-------------|
| `http_id`            | Unique script ID |
| `requests`           | List of requests with `method`, `url`, `headers`, `validation`, etc. |


##  Synthetic Monitor Definitions

###  Variable: `monitors`

Declares active synthetic monitors and optionally wires scripts and anomaly logic.

| Field                    | Description |
|--------------------------|-------------|
| `name`                   | Monitor name |
| `frequency`              | Execution interval (minutes) |
| `locations`              | Geo locations for execution |
| `no_script`              | If true, disables script execution |
| `script`                 | Optional script definition block |
| `anomaly_detection`      | Optional thresholds and outage rules |


##  Outputs

| Output Name            | Description |
|------------------------|-------------|
| `cookie_monitor_ids`   | List of IDs for cookie-enabled monitors |
| `outage_monitor_id`    | ID of the monitor where outage rules apply |
| `performance_monitor_ids` | IDs of performance threshold monitors |
| `script_monitor_ids`   | IDs of monitors with script execution |
| `http_monitor_ids`     | All defined synthetic monitor IDs |

---



##  Recommended Practices

- Always tag monitors with `scope` and `anomaly_detection` so that alerting and dashboarding remain traceable.
- Avoid hardcoded cookies/tokens in scripts; use secure runtime injection methods.
- Use `outage_scope` to align monitoring rules with organizational structure.

---

