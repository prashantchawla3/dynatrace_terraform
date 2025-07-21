
##  Resource: `dynatrace_api_detection`

###  Required API Token Scopes
- `settings.read`
- `settings.write`

###  How to Determine Values for `tfvars`
- **api_color**: Choose a hex color code for API highlighting.
- **api_name**: Provide a unique name for the API.
- **third_party_api**: Set to `true` if the API is third-party.
- **technology**: Specify the technology (e.g., Java, Go).
- **conditions**: Define matching rules using `base`, `matcher`, and `pattern`.

###  Full Schema

#### Required
- `api_color` (String)
- `api_name` (String)
- `third_party_api` (Boolean)

#### Optional
- `technology` (String)
- `insert_after` (String)
- `conditions` (Block List)
  - `condition` (Block Set)
    - `base` (String)
    - `matcher` (String)
    - `pattern` (String)

#### Read-Only
- `id` (String)

###  Using a `data` Block
Use the export utility:
```bash
terraform-provider-dynatrace -export dynatrace_api_detection
```

---

##  Resource: `dynatrace_calculated_service_metric`

###  Required API Token Scopes
- `ReadConfig`
- `WriteConfig`

###  How to Determine Values for `tfvars`
- **metric_key**: Unique identifier for the metric.
- **name**: Display name.
- **unit**: Choose from predefined units.
- **conditions**: Define attribute-based filters.
- **metric_definition**: Specify the metric and optional request attribute.

###  Full Schema

#### Required
- `metric_key` (String)
- `name` (String)
- `unit` (String)

#### Optional
- `enabled` (Boolean)
- `description` (String)
- `management_zones` (Set of String)
- `entity_id` (String)
- `ignore_muted_requests` (Boolean)
- `unit_display_name` (String)
- `conditions` (Block List)
  - `condition` (Block List)
    - `attribute` (String)
    - `comparison` (Block List)
- `dimension_definition` (Block List)
- `metric_definition` (Block List)
  - `metric` (String)
  - `request_attribute` (String)

#### Read-Only
- `id` (String)

###  Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_calculated_service_metric
```

---

##  Resource: `dynatrace_key_requests`

###  Required API Token Scopes
- `settings.read`
- `settings.write`

###  How to Determine Values for `tfvars`
- **service**: Dynatrace service ID.
- **key_request_ids**: Map of request IDs to names.
- **names**: Set of request names.

###  Full Schema

#### Required
- `service` (String)

#### Optional
- `key_request_ids` (Map of String)
- `names` (Set of String)

#### Read-Only
- `id` (String)

###  Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_key_requests
```


##  Resource: `dynatrace_muted_requests`

###  Required API Token Scopes
- `settings.read`
- `settings.write`

###  How to Determine Values for `tfvars`
- **service_id**: The ID of the Dynatrace service to mute requests for.
- **muted_request_names**: A list of request names (paths) to mute.

###  Full Schema

#### Required
- `service_id` (String)

#### Optional
- `muted_request_names` (Set of String)

#### Read-Only
- `id` (String)

###  Using a `data` Block
Use the export utility:
```bash
terraform-provider-dynatrace -export dynatrace_muted_requests
```

---

##  Resource: `dynatrace_request_attribute`

###  Required API Token Scopes
- `ReadConfig`
- `CaptureRequestData`

###  How to Determine Values for `tfvars`
- **name**: Name of the request attribute.
- **aggregation**: Aggregation method (e.g., `FIRST`, `LAST`, `COUNT`).
- **data_type**: Data type (e.g., `STRING`, `INTEGER`).
- **normalization**: How to normalize string values.
- **data_sources**: Define how and where to capture the data from.
- **value_processing**: Optional processing like trimming, regex extraction, substring.

###  Full Schema

#### Required
- `name` (String)
- `aggregation` (String)
- `data_type` (String)
- `normalization` (String)

#### Optional
- `enabled` (Boolean)
- `confidential` (Boolean)
- `skip_personal_data_masking` (Boolean)
- `data_sources` (Block List)
  - `enabled` (Boolean)
  - `source` (String)
  - `technology` (String)
  - `methods` (Block List)
    - `capture` (String)
    - `method` (Block)
      - `method_name`, `return_type`, `visibility`, etc.
  - `value_processing` (Block)
    - `split_at`, `trim`, `value_extractor_regex`, etc.

#### Read-Only
- `id` (String)

###  Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_request_attribute
```

---

##  Resource: `dynatrace_request_naming`

###  Required API Token Scopes
- `ReadConfig`
- `WriteConfig`

###  How to Determine Values for `tfvars`
- **naming_pattern**: The name pattern to assign to matching requests.
- **conditions**: Define matching rules using attributes and comparisons.
- **placeholders**: Optional placeholders to extract values for naming.

###  Full Schema

#### Required
- `naming_pattern` (String)
- `conditions` (Block List)
  - `condition` (Block List)
    - `attribute` (String)
    - `comparison` (Block List)

#### Optional
- `enabled` (Boolean)
- `management_zones` (Set of String)
- `placeholders` (Block List)

#### Read-Only
- `id` (String)

###  Using a `data` Block
```bash
terraform-provider-dynatrace -export dynatrace_request_naming
```



## Resource: `dynatrace_request_namings`

### Required API Token Scopes
- `ReadConfig`
- `WriteConfig`

### How to Determine Values for `tfvars`
- **ids**: Provide a list of request naming rule IDs in the desired evaluation order.

### Full Schema

#### Optional
- `ids` (List of String): The IDs of the request naming rules in order.

#### Read-Only
- `id` (String)

### Using a `data` Block
Use the export utility:
```bash
terraform-provider-dynatrace -export dynatrace_request_namings
```

---

## Resource: `dynatrace_service_naming`

### Required API Token Scopes
- `ReadConfig`
- `WriteConfig`

### How to Determine Values for `tfvars`
- **name**: Name of the service naming rule.
- **enabled**: Set to `true` to activate the rule.
- **format**: Define the naming format using supported placeholders.
- **conditions**: Define matching conditions using attributes and comparisons.

### Full Schema

#### Required
- `name` (String)
- `enabled` (Boolean)
- `format` (String)

#### Optional
- `conditions` (Block List)
  - `condition` (Block List)
    - `key` (Block): Defines the attribute to match.
    - One of the following blocks depending on the attribute type:
      - `service_type`, `tech`, `service_topology`, `tag`, etc.

#### Read-Only
- `id` (String)

### Using a `data` Block
Use the export utility:
```bash
terraform-provider-dynatrace -export dynatrace_service_naming
```

---

## Resource: `dynatrace_service_naming_order`

### Required API Token Scopes
- `ReadConfig`
- `WriteConfig`

### How to Determine Values for `tfvars`
- **naming_rule_ids**: Provide a list of service naming rule IDs in the desired evaluation order.

### Full Schema

#### Optional
- `naming_rule_ids` (List of String)

#### Read-Only
- `id` (String)

### Using a `data` Block
Use the export utility:
```bash
terraform-provider-dynatrace -export dynatrace_service_naming_order
```

---

## Resource: `dynatrace_url_based_sampling`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine Values for `tfvars`
- **enabled**: Set to `true` to activate the rule.
- **http_method_any**: Apply to all HTTP methods.
- **ignore**: Set to `true` to always ignore matching URLs.
- **factor**: Choose a sampling factor.
- **path**: Define the URL path to match.
- **path_comparison_type**: Specify how the path should be compared.
- **query_parameters**: Define required query parameters.

### Full Schema

#### Required
- `enabled` (Boolean)
- `http_method_any` (Boolean)
- `ignore` (Boolean)

#### Optional
- `factor` (String)
- `http_method` (Set of String)
- `insert_after` (String)
- `path` (String)
- `path_comparison_type` (String)
- `query_parameters` (Block List)
  - `parameter` (Block Set)
    - `name` (String)
    - `value` (String, optional)
    - `value_is_undefined` (Boolean, optional)
- `scope` (String)

#### Read-Only
- `id` (String)

### Using a `data` Block
Use the export utility:
```bash
terraform-provider-dynatrace -export dynatrace_url_based_sampling
```

---

