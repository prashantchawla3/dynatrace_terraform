

## `dynatrace_ibm_mq_filters`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Use include/exclude lists to define which CICS or IMS MQ queues and transaction IDs should be monitored or ignored.

### Schema

#### Optional
- `cics_mq_queue_id_includes` (Set of String)
- `cics_mq_queue_id_excludes` (Set of String)
- `ims_mq_queue_id_includes` (Set of String)
- `ims_mq_queue_id_excludes` (Set of String)
- `ims_cr_trn_id_includes` (Set of String)
- `ims_cr_trn_id_excludes` (Set of String)

#### Read-Only
- `id` (String)

---

## `dynatrace_ims_bridges`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define the IMS bridge name and associated queue managers, optionally with queues.

### Schema

#### Required
- `name` (String)

#### Optional
- `queue_managers` (Block List)

#### Read-Only
- `id` (String)

#### Nested: `queue_managers.queue_manager`
- `name` (String) — Required
- `queue_manager_queue` (Set of String) — Optional

---

## `dynatrace_mainframe_transaction_monitoring`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Configure grouping, monitoring behavior, and node limits for CICS and IMS transactions.

### Schema

#### Required
- `group_cics_regions` (Boolean)
- `group_ims_regions` (Boolean)
- `monitor_all_ctg_protocols` (Boolean)
- `monitor_all_incoming_web_requests` (Boolean)
- `node_limit` (Number)
- `zos_cics_service_detection_uses_transaction_id` (Boolean)
- `zos_ims_service_detection_uses_transaction_id` (Boolean)

#### Read-Only
- `id` (String)

---

## `dynatrace_queue_manager`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define the queue manager name, clusters, and associated alias, remote, and cluster queues.

### Schema

#### Required
- `name` (String)

#### Optional
- `clusters` (Set of String)
- `alias_queues` (Block List)
- `remote_queues` (Block List)
- `cluster_queues` (Block List)

#### Read-Only
- `id` (String)

#### Nested: `alias_queues.alias_queue`
- `alias_queue_name` (String) — Required
- `base_queue_name` (String) — Required
- `cluster_visibility` (Set of String) — Optional

#### Nested: `remote_queues.remote_queue`
- `local_queue_name` (String) — Required
- `remote_queue_name` (String) — Required
- `remote_queue_manager` (String) — Required
- `cluster_visibility` (Set of String) — Optional

#### Nested: `cluster_queues.cluster_queue`
- `local_queue_name` (String) — Required
- `cluster_visibility` (Set of String) — Optional

---

## `dynatrace_queue_sharing_groups`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define the name of the queue sharing group and list of queue managers and shared queues.

### Schema

#### Required
- `name` (String)

#### Optional
- `queue_managers` (Set of String)
- `shared_queues` (Set of String)

#### Read-Only
- `id` (String)

---

## `dynatrace_transaction_start_filters`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define transaction IDs to trace for CICS and IMS, using wildcards if needed.

### Schema

#### Optional
- `cics_terminal_transaction_ids` (Set of String)
- `cics_transaction_ids` (Set of String)
- `ims_terminal_transaction_ids` (Set of String)
- `ims_transaction_ids` (Set of String)

#### Read-Only
- `id` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. Use the `terraform-provider-dynatrace -export` command to retrieve existing configurations for:

- `dynatrace_ibm_mq_filters`
- `dynatrace_ims_bridges`
- `dynatrace_mainframe_transaction_monitoring`
- `dynatrace_queue_manager`
- `dynatrace_queue_sharing_groups`
- `dynatrace_transaction_start_filters`

---

