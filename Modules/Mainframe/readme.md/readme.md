
#  Dynatrace Mainframe MQ & IMS Observability Modules

This Terraform module suite provisions Dynatrace integration and monitoring configuration for IBM MQ queues, IMS bridges, transaction filters, and regional topology toggles. The setup enables organizations to correlate transactional metadata from mainframe systems and MQ queue clusters into Dynatrace for enhanced visibility, service flow modeling, and anomaly detection.


---

##  Module Overview

### MQ Queue Filtering (`dynatrace_ibm_mq_filters`)
Configures MQ queue inclusion/exclusion logic for CICS and IMS components.

#### Variables

| Variable | Type | Description |
|---------|------|-------------|
| `cics_mq_queue_id_includes` | list(string) | CICS queues to include for processing |
| `cics_mq_queue_id_excludes` | list(string) | CICS queues excluded from monitoring |
| `ims_mq_queue_id_excludes`  | list(string) | IMS queues excluded from monitoring |
| `ims_cr_trn_id_includes`    | list(string) | IMS transaction start identifiers |



---

### IMS Bridge Configuration (`dynatrace_ims_bridges`)
Defines IMS bridge name used to identify integration point.

| Variable | Type | Description |
|----------|------|-------------|
| `ims_bridge_name` | string | Logical IMS bridge name |



---

### Queue Managers & Visibility (`dynatrace_queue_manager`)
Provisions queue managers with aliases, cluster visibility, and sharing groups.

#### Variables

| Name | Type | Description |
|------|------|-------------|
| `ims_queue_managers` | map(object) | IMS-specific queue managers and optional queues |
| `queue_manager_name` | string | Primary queue manager name |
| `queue_manager_clusters` | list(string) | Cluster memberships |
| `alias_queues` | map(object) | Alias to base queue mappings |
| `remote_queues` | map(object) | Remote queue forwarding info |
| `cluster_queues` | map(object) | Cluster-local queue definition |
| `queue_sharing_group_name` | string | QSG identifier |
| `queue_sharing_group_managers` | list(string) | Queue managers in the group |
| `queue_sharing_group_shared_queues` | list(string) | Shared queues provisioned within the group |



---

### Mainframe Monitoring & Topology Toggles (`dynatrace_mainframe_transaction_monitoring`)
Enables monitoring logic for mainframe regions and transaction topology.

#### Variables

| Name | Type | Description |
|------|------|-------------|
| `group_cics_regions` | bool | Enables CICS region grouping |
| `group_ims_regions`  | bool | Enables IMS region grouping |
| `monitor_all_ctg_protocols` | bool | Enable capture of all CTG protocol traffic |
| `monitor_all_incoming_web_requests` | bool | Enables monitoring of all incoming requests |
| `node_limit` | number | Maximum node count in a transaction flow |
| `zos_cics_service_detection_uses_transaction_id` | bool | Enable detection via transaction ID for CICS |
| `zos_ims_service_detection_uses_transaction_id` | bool | Enable detection via transaction ID for IMS |



---

### Transaction ID Filters (`dynatrace_transaction_start_filters`)
Defines entry-point transaction IDs used for Dynatrace service start attribution.

| Variable | Type | Description |
|----------|------|-------------|
| `cics_terminal_transaction_ids` | list(string) | CICS terminal transaction identifiers |
| `cics_transaction_ids` | list(string) | CICS transaction names |
| `ims_transaction_ids` | list(string) | IMS transaction identifiers |
| `ims_terminal_transaction_ids` | list(string) | IMS terminal transaction names |



---

##  Outputs

These values can be used for confirmation, downstream wiring, or exported into documentation.

| Output Name | Description |
|-------------|-------------|
| `queue_manager_name` | Name of queue manager created |
| `ims_bridge_name` | IMS bridge name provisioned |
| `queue_sharing_group_name` | QSG name for shared queues |

---

##  Integration Guidance

Each resource represents a slice of Dynatrace’s mainframe observability layer. The configuration is declarative and modular:

```hcl
module "queue_manager_clusters" {
  source = "./modules/dynatrace_queue_manager"
  queue_manager_clusters = var.queue_manager_clusters
}
```

Mix and match based on logical ownership. Group transaction IDs by entry system, isolate queues per team, and allow cluster visibility settings to route topology modeling.

---

