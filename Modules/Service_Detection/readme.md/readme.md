

## Resource: `dynatrace_custom_service`

### Required API Token Scopes
- `ReadConfig`
- `WriteConfig`

### How to Determine Values for `tfvars`
- **name**: Unique name for the custom service.
- **technology**: Technology type (e.g., `java`, `dotNet`).
- **enabled**: Set to `true` or `false`.
- **queue_entry_point**: Set to `true` if this is a messaging service.
- **rules**: Define instrumentation rules including class, method, and annotations.

### Full Schema

#### Required
- `name` (String)
- `technology` (String)
- `enabled` (Boolean)

#### Optional
- `process_groups` (Set of String)
- `queue_entry_point` (Boolean)
- `queue_entry_point_type` (String)
- `rule` (Block List)
  - `enabled` (Boolean)
  - `class` (Block)
    - `name` (String)
    - `match` (String)
  - `method` (Block List)
    - `name` (String)
    - `arguments` (List of String)
    - `returns` (String)
    - `modifiers` (List of String)
    - `visibility` (String)
  - `annotations` (Set of String)

#### Read-Only
- `id` (String)

### Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_custom_service
```

---

## Resource: `dynatrace_custom_service_order`

### Required API Token Scopes
- `ReadConfig`
- `WriteConfig`

### How to Determine Values for `tfvars`
- Provide ordered lists of custom service IDs per technology (e.g., `dotnet`, `java`).

### Full Schema

#### Optional
- `dotnet`, `java`, `golang`, `nodejs`, `php` (List of String)

#### Read-Only
- `id` (String)

### Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_custom_service_order
```

---

## Resource: `dynatrace_service_detection_rules`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine Values for `tfvars`
- **enabled**: Enable or disable the rule.
- **scope**: Scope of the rule (e.g., `environment`).
- **rule**: Define detection logic using attributes and conditions.

### Full Schema

#### Required
- `enabled` (Boolean)
- `rule` (Block List)
  - `rule_name` (String)
  - `service_name_template` (String)

#### Optional
- `insert_after` (String)
- `scope` (String)
- `rule.additional_required_attributes` (Set of String)
- `rule.condition` (String)
- `rule.description` (String)

#### Read-Only
- `id` (String)

### Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_service_detection_rules
```



## Resource: `dynatrace_service_external_web_request`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine Values for `tfvars`
- **name**: Unique name for the rule.
- **enabled**: Enable or disable the rule.
- **management_zones**: List of management zone IDs.
- **conditions**: Define matching conditions using attributes and comparison types.
- **id_contributors**: Specify how service identifiers are constructed (e.g., application ID, context root, public domain name).

### Full Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `id_contributors` (Block List)
  - `port_for_service_id` (Boolean)
  - `application_id`, `context_root`, `public_domain_name` (Block Lists)

#### Optional
- `description` (String)
- `insert_after` (String)
- `management_zones` (Set of String)
- `conditions` (Block List)
  - `condition` (Block List)
    - `attribute` (String)
    - `compare_operation_type` (String)
    - `text_values`, `int_values`, `tag_values`, etc.

#### Read-Only
- `id` (String)

### Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_service_external_web_request
```

---

## Resource: `dynatrace_service_external_web_service`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine Values for `tfvars`
- **name**: Rule name.
- **enabled**: Enable or disable the rule.
- **management_zones**: List of management zone IDs.
- **conditions**: Define matching conditions.
- **id_contributors**: Define how the service ID is constructed (e.g., URL path).

### Full Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `id_contributors` (Block List)
  - `detect_as_web_request_service` (Boolean)
  - `url_path` (Block List)

#### Optional
- `description` (String)
- `insert_after` (String)
- `management_zones` (Set of String)
- `conditions` (Block List)

#### Read-Only
- `id` (String)

### Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_service_external_web_service
```

---

## Resource: `dynatrace_service_full_web_request`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine Values for `tfvars`
- **name**: Rule name.
- **enabled**: Enable or disable the rule.
- **management_zones**: List of management zone IDs.
- **conditions**: Define matching conditions.
- **id_contributors**: Define how the service ID is constructed (e.g., application ID, context root, server name).

### Full Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `id_contributors` (Block List)
  - `application_id`, `context_root`, `server_name` (Block Lists)

#### Optional
- `description` (String)
- `insert_after` (String)
- `management_zones` (Set of String)
- `conditions` (Block List)

#### Read-Only
- `id` (String)

### Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_service_full_web_request
```


## `dynatrace_service_full_web_service`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`name`**: Choose a descriptive name for the rule.
- **`enabled`**: Set to `true` or `false` based on whether the rule should be active.
- **`management_zones`**: Use the ID of an existing management zone.
- **`conditions`**: Define matching logic using attributes like `HostName`.
- **`id_contributors`**: Specify how service identifiers are calculated (e.g., `detect_as_web_request_service`).

### Schema

#### Required
- `enabled` (Boolean)
- `name` (String)
- `id_contributors` (Block List, Min: 1, Max: 1)

#### Optional
- `description` (String)
- `conditions` (Block List, Max: 1)
- `insert_after` (String)
- `management_zones` (Set of String)

#### Read-Only
- `id` (String)

#### Nested: `id_contributors`
- `detect_as_web_request_service` (Boolean)
- `application_id`, `context_root`, `server_name`, `web_service_name`, `web_service_namespace` (Optional blocks with nested transformation and override options)

#### Data Source Usage
Use a `data` block to retrieve existing service detection rules by schema ID `builtin:service-detection.full-web-service`.

---

## `dynatrace_service_splitting`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Set to `true` or `false`.
- **`scope`**: Define the scope (`environment`, `CLOUD_APPLICATION_NAMESPACE`, etc.).
- **`rule_name`**: Provide a unique name.
- **`condition`**: Use DQL expressions to filter.
- **`service_splitting_attributes`**: List of attribute keys to split services.

### Schema

#### Required
- `enabled` (Boolean)
- `rule` (Block List, Min: 1, Max: 1)

#### Optional
- `insert_after` (String)
- `scope` (String)

#### Read-Only
- `id` (String)

#### Nested: `rule`
- `rule_name` (String)
- `condition` (String)
- `description` (String)
- `service_splitting_attributes` (Block List, Max: 1)

#### Nested: `service_splitting_attributes.service_splitting_attribute`
- `key` (String)

#### Data Source Usage
Use a `data` block to retrieve existing service splitting rules by schema ID `builtin:service-splitting-rules`.

---

## `dynatrace_unified_services_metrics`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_endpoint_metrics`**: Set to `true` to enable endpoint metrics (note billing implications).
- **`service_id`**: Use `"environment"` for global scope or specify a service ID.

### Schema

#### Required
- `enable_endpoint_metrics` (Boolean)

#### Optional
- `service_id` (String)

#### Read-Only
- `id` (String)

#### Data Source Usage
Use a `data` block to retrieve existing configurations by schema ID `builtin:unified-services-endpoint-metrics`.

---

## `dynatrace_unified_services_opentel`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enabled`**: Set to `true` to enable OpenTelemetry-based unified services.

### Schema

#### Required
- `enabled` (Boolean)

#### Read-Only
- `id` (String)

#### Data Source Usage
Use a `data` block to retrieve existing configurations by schema ID `builtin:unified-services-enablement`.

---


