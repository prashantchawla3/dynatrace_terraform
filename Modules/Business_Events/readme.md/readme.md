

# Terraform Dynatrace Business Events Modules

---

## dynatrace_business_events_buckets

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`bucket_name`**: Use the name of an existing business events bucket. You can find this in the Dynatrace UI under *Business Analytics > Buckets*.
- **`matcher`**: Define a condition using Dynatrace’s matcher syntax (e.g., `matchesValue(event.type, "com.example.event")`).
- **`rule_name`**: Choose a unique name for the rule.

### Schema

#### Required
- `bucket_name` (String)
- `enabled` (Boolean)
- `matcher` (String)
- `rule_name` (String)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_business_events_capturing_variants

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`content_type_matcher`**: Choose from `CONTAINS`, `ENDS_WITH`, `EQUALS`, `STARTS_WITH`.
- **`content_type_value`**: Use the content-type header value (e.g., `application/json`).
- **`parser`**: Choose from `JSON`, `Raw`, `Text`, `URLencoded`, `XML`.
- **`scope`**: Use `"environment"` for global or `"HOST"`/`"HOST_GROUP"` for specific scopes.

### Schema

#### Required
- `content_type_matcher` (String)
- `content_type_value` (String)
- `parser` (String)

#### Optional
- `insert_after` (String)
- `scope` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_business_events_metrics

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`key`**: Define a unique metric key (e.g., `bizevents.myApp.metricName`).
- **`matcher`**: Use a valid event matcher expression.
- **`measure`**: Choose `ATTRIBUTE` or `OCCURRENCE`.
- **`measure_attribute`**: Specify the attribute name if `measure` is `ATTRIBUTE`.

### Schema

#### Required
- `enabled` (Boolean)
- `key` (String)
- `matcher` (String)
- `measure` (String)

#### Optional
- `dimensions` (Set of String)
- `measure_attribute` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_business_events_oneagent

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`rule_name`**: Unique name for the rule.
- **`scope`**: Use `"environment"` or specify `"HOST"`/`"HOST_GROUP"`.
- **`event`**: Define metadata including `category`, `provider`, `type`, and optional `data`.
- **`triggers`**: Define trigger conditions using supported types like `STARTS_WITH`, `EQUALS`, etc.

### Schema

#### Required
- `enabled` (Boolean)
- `event` (Block)
- `rule_name` (String)
- `triggers` (Block)

#### Optional
- `insert_after` (String)
- `scope` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_business_events_oneagent_outgoing

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- Similar to `dynatrace_business_events_oneagent`, but for outgoing HTTP requests.
- Define `event` metadata and `triggers` for outgoing traffic.

### Schema

#### Required
- `enabled` (Boolean)
- `event` (Block)
- `rule_name` (String)
- `triggers` (Block)

#### Optional
- `insert_after` (String)
- `scope` (String)

#### Read-Only
- `id` (String)

---

## dynatrace_business_events_processing

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`matcher`**: Use a valid event matcher.
- **`script`**: Define transformation logic (e.g., `FIELDS_ADD(trading_volume:price*amount)`).
- **`rule_testing.sample_event`**: Provide a sample event in JSON format.
- **`transformation_fields`**: Define fields used in the transformation.

### Schema

#### Required
- `enabled` (Boolean)
- `matcher` (String)
- `rule_name` (String)
- `rule_testing` (Block)
- `script` (String)

#### Optional
- `insert_after` (String)
- `transformation_fields` (Block)

#### Read-Only
- `id` (String)

---

## dynatrace_business_events_security_context

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine `tfvars` Values
- **`query`**: Define a matcher expression (e.g., `matchesPhrase(content, "value")`).
- **`rule_name`**: Unique name for the rule.
- **`value_source`**: Choose `FIELD` or `LITERAL`.
- **`value_source_field`**: Specify the field name if using `FIELD`.

### Schema

#### Required
- `security_context_rule` (Block)

#### Optional
- `insert_after` (String)

#### Read-Only
- `id` (String)

---

## Using Data Blocks to Retrieve Existing Information

To retrieve existing configuration from Dynatrace, use Terraform `data` blocks. For example:

```hcl
data "dynatrace_business_events_metrics" "existing" {
  key = "bizevents.myApp.metricName"
}
```

This allows you to reference existing resources and use their attributes in other modules or resources.

---
