# Dynatrace Observability Terraform Module

This Terraform module helps manage Dynatrace observability configurations, including attribute filtering, OpenTelemetry metrics enrichment, span behavior rules, and attribute persistence preferences.

---

## Resources Defined in This Module

### 1. `dynatrace_attribute_allow_list`

Allows specific attributes to be **processed and retained** in observability data.

*  **Inputs:**

  * `enabled`: Boolean to toggle the allow list rule.
  * `key`: The attribute key to allow (e.g., `trace_id`, `user.id`).

* **Terraform Resource Block:**

```hcl
resource "dynatrace_attribute_allow_list" "this" {
  for_each = var.attribute_allow_list
  enabled  = each.value.enabled
  key      = each.value.key
}
```

### 2. `dynatrace_attribute_block_list`

Blocks specific attributes from being processed or displayed.

*  **Inputs:**

  * `enabled`: Boolean to toggle blocking.
  * `key`: Attribute to be blocked (e.g., `internal_session_token`).

*  **Terraform Resource Block:**

```hcl
resource "dynatrace_attribute_block_list" "this" {
  for_each = var.attribute_block_list
  enabled  = each.value.enabled
  key      = each.value.key
}
```

### 3. `dynatrace_attribute_masking`

Applies masking (e.g., SHA256, MASK\_ENTIRE\_VALUE) to sensitive attributes.

*  **Inputs:**

  * `enabled`: Whether to mask this attribute.
  * `key`: Attribute key (e.g., `email`, `ssn`).
  * `masking`: Type of masking to apply (e.g., `MASK_ENTIRE_VALUE`).

* **Terraform Resource Block:**

```hcl
resource "dynatrace_attribute_masking" "this" {
  for_each = var.attribute_masking
  enabled  = each.value.enabled
  key      = each.value.key
  masking  = each.value.masking
}
```

### 4. `dynatrace_opentelemetry_metrics`

Configures how OpenTelemetry metrics are enriched, including attribute handling.

*  **Inputs:**

  * `scope`: The environment or app scope (e.g., `env:default`).
  * `additional_attributes_to_dimension_enabled`: Promote attributes to dimensions.
  * `meter_name_to_dimension_enabled`: Promote meter name to dimension.
  * `additional_attributes`: List of additional attributes to enrich metrics.
  * `to_drop_attributes`: List of attributes to exclude from ingestion.

*  **Terraform Resource Block:**

```hcl
resource "dynatrace_opentelemetry_metrics" "this" {
  for_each = var.opentelemetry_metrics
  additional_attributes_to_dimension_enabled = each.value.additional_attributes_to_dimension_enabled
  meter_name_to_dimension_enabled           = each.value.meter_name_to_dimension_enabled
  scope                                     = each.value.scope

  additional_attributes {
    dynamic "additional_attribute" {
      for_each = each.value.additional_attributes
      content {
        enabled       = additional_attribute.value.enabled
        attribute_key = additional_attribute.value.attribute_key
      }
    }
  }

  to_drop_attributes {
    dynamic "to_drop_attribute" {
      for_each = each.value.to_drop_attributes
      content {
        enabled       = to_drop_attribute.value.enabled
        attribute_key = to_drop_attribute.value.attribute_key
      }
    }
  }
}
```

### 5. `dynatrace_span_capture_rule`

Controls which spans are captured based on matching rules.

*  **Inputs:**

  * `name`: A unique key identifying the rule.
  * `action`: What to do with matched spans (`ALLOW`, `IGNORE`).
  * `matches`: Conditions for matching spans (e.g., span name equals `foo`).

*  **Terraform Resource Block:**

```hcl
resource "dynatrace_span_capture_rule" "this" {
  for_each = var.span_capture_rules
  name     = each.key
  action   = each.value.action

  matches {
    dynamic "match" {
      for_each = each.value.matches
      content {
        comparison = match.value.comparison
        source     = match.value.source
        value      = match.value.value
      }
    }
  }
}
```

---

## Input Variables

### `attribute_allow_list`

Allow processing of specific attribute keys.

```hcl
attribute_allow_list = {
  trace_id = {
    enabled = true
    key     = "trace_id"
  }
}
```

### `attribute_block_list`

Block processing of sensitive/internal attribute keys.

```hcl
attribute_block_list = {
  internal_token = {
    enabled = true
    key     = "internal_session_token"
  }
}
```

### `attribute_masking`

Apply masking strategies to sensitive attributes.

```hcl
attribute_masking = {
  user_email = {
    enabled = true
    key     = "email"
    masking = "SHA256"
  }
}
```

### `opentelemetry_metrics`

Control OpenTelemetry metric ingestion and enrichment.

```hcl
opentelemetry_metrics = {
  metrics_default = {
    additional_attributes_to_dimension_enabled = true
    meter_name_to_dimension_enabled           = false
    scope                                     = "env:default"
    additional_attributes = [
      { enabled = true, attribute_key = "host" },
      { enabled = false, attribute_key = "zone" }
    ]
    to_drop_attributes = [
      { enabled = true, attribute_key = "debug_mode" }
    ]
  }
}
```

### `span_capture_rules`

Define which spans should be captured.

```hcl
span_capture_rules = {
  capture_login = {
    action = "ALLOW"
    matches = [
      {
        comparison = "EQUALS"
        source     = "url.path"
        value      = "/auth/login"
      }
    ]
  }
}
```

### `span_context_propagation`

Configure context propagation headers.

```hcl
span_context_propagation = {
  propagate_trace = {
    action = "INJECT"
    matches = [
      {
        comparison = "CONTAINS"
        source     = "http.headers"
        value      = "x-trace-id"
      }
    ]
  }
}
```

### `span_entry_points`

Define span entry point matching rules.

```hcl
span_entry_points = {
  public_api = {
    action = "ALLOW"
    matches = [
      {
        case_sensitive = true
        comparison     = "STARTS_WITH"
        source         = "url.path"
        value          = "/api/"
      }
    ]
  }
}
```

### `attributes_preferences`

Configure attribute persistence behavior.

```hcl
attributes_preferences = {
  telemetry_defaults = {
    persistence_mode = "TRANSIENT"
  }
}
```

---

## Usage Example

```hcl
module "dynatrace_observability" {
  source = "./modules/dynatrace"

  attribute_allow_list     = var.attribute_allow_list
  attribute_block_list     = var.attribute_block_list
  attribute_masking        = var.attribute_masking
  opentelemetry_metrics    = var.opentelemetry_metrics
  span_capture_rules       = var.span_capture_rules
  span_context_propagation = var.span_context_propagation
  span_entry_points        = var.span_entry_points
  attributes_preferences   = var.attributes_preferences
}
```

To apply:

```bash
terraform init
terraform plan -var-file=readme.md/samples.tfvars
terraform apply -var-file=readme.md/samples.tfvars
```

---

