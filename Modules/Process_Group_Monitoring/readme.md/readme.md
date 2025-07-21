

# Dynatrace Process Group and Workload Detection Resources

This README documents the Terraform resources used to configure process group detection, monitoring, naming, and workload detection in Dynatrace.

---

## `dynatrace_cloudapp_workloaddetection`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Enable or disable workload detection for Cloud Foundry, Docker, and Kubernetes.
- Define Kubernetes filters with inclusion toggles and match operators.

### Schema

#### Required
- `cloud_foundry.enabled` (Boolean)
- `docker.enabled` (Boolean)
- `kubernetes.enabled` (Boolean)

#### Nested: `kubernetes.filters.filter`
- `enabled` (Boolean)
- `inclusion_toggles`:
  - `inc_basepod`, `inc_container`, `inc_namespace`, `inc_product`, `inc_stage` (Boolean)
- `match_filter.match_operator` (String)

---

## `dynatrace_declarative_grouping`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define grouping rules based on process definitions and conditions.

### Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `scope` (String)

#### Nested: `detection.process_definition`
- `id` (String)
- `process_group_name` (String)
- `report` (String)
- `rules.rule`:
  - `condition` (String)
  - `property` (String)

---

## `dynatrace_pg_alerting`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Configure alerting thresholds for process groups.

### Schema

#### Required
- `enabled` (Boolean)
- `alerting_mode` (String)
- `minimum_instance_threshold` (Number)
- `process_group` (String)

---

## `dynatrace_process_group_detection`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define rules for group and instance extraction and process detection.

### Schema

#### Required
- `enabled` (Boolean)

#### Nested:
- `group_extraction.property` (String)
- `group_extraction.standalone_rule` (Boolean)
- `group_extraction.delimiter.remove_ids` (Boolean)
- `instance_extraction.property` (String)
- `instance_extraction.delimiter.remove_ids` (Boolean)
- `process_detection.contained_string` (String)
- `process_detection.property` (String)
- `process_detection.restrict_to_process_type` (String)

---

## `dynatrace_process_group_detection_flags`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Enable or disable specific detection flags for process group detection.

### Schema

#### Required
- `scope` (String)

#### Optional Flags (Boolean)
- `add_node_js_script_name`
- `auto_detect_cassandra_clusters`
- `auto_detect_spring_boot`
- `auto_detect_tibco_container_edition_engines`
- `auto_detect_tibco_engines`
- `auto_detect_web_methods_integration_server`
- `auto_detect_web_sphere_liberty_application`
- `group_ibmmqby_instance_name`
- `identify_jboss_server_by_system_property`
- `ignore_unique_identifiers`
- `short_lived_processes_monitoring`
- `split_oracle_database_pg`
- `split_oracle_listener_pg`
- `use_catalina_base`
- `use_docker_container_name`

---

## `dynatrace_process_group_monitoring`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Set the monitoring state for a specific process group.

### Schema

#### Required
- `monitoring_state` (String)
- `process_group_id` (String)

---

## `dynatrace_process_group_simple_detection`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define simple detection rules for process groups.

### Schema

#### Required
- `enabled` (Boolean)
- `group_identifier` (String)
- `instance_identifier` (String)
- `process_type` (String)
- `rule_type` (String)

---

## `dynatrace_processgroup_naming`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Define naming rules and conditions for process groups.

### Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `format` (String)

#### Nested: `conditions.condition`
- `key.type` (String)
- `key.attribute` (String)
- `tech.negate` (Boolean)
- `tech.operator` (String)
- `tech.value.type` (String)

#### Nested: `string_conditions.condition`
- `process_metadata.attribute` (String)
- `process_metadata.dynamic_key` (String)
- `string.case_sensitive` (Boolean)
- `string.negate` (Boolean)
- `string.operator` (String)
- `string.value` (String)

---

## `dynatrace_processgroup_naming_order`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- Provide a list of naming rule IDs in the desired order.

### Schema

#### Required
- `naming_rule_ids` (List of String)

---

## Data Source Usage

These resources do not have dedicated data sources. Use the following command to retrieve existing configurations:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---

