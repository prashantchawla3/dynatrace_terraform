
# 📘 Dynatrace Business Events Automation Module

This module provisions a fully scoped business event rule in Dynatrace Automation. It handles:
-  Event ingestion from buckets
-  Metric extraction, transformation, and enrichment
-  OneAgent-based in-process visibility
-  Event forwarding and rule-based trigger logic
-  Security filtering and suppression conditions


---

##  What’s Created

| Resource                                 | Purpose                                                  |
|------------------------------------------|----------------------------------------------------------|
| `dynatrace_automation_business_events`   | Defines a business event ingestion and transformation rule |

---

##  Ingestion Configuration

###  Bucket Settings

| Variable                | Description                                      | Example                  |
|-------------------------|--------------------------------------------------|--------------------------|
| `buckets_enabled`       | Enables ingestion from a business event bucket   | `true`                   |
| `bucket_name`           | Bucket identifier                                | `"business-events-bucket"` |
| `buckets_matcher`       | Matcher expression for filtering events          | `"contains(eventType)"` |

---

##  Parsing & Rule Metadata

| Variable             | Description                                | Example                    |
|----------------------|--------------------------------------------|----------------------------|
| `rule_name`          | Internal name of the business event rule   | `"BusinessEventsRule"`     |
| `content_type_matcher` | How to match content type (e.g. `EQUALS`) | `"EQUALS"`                |
| `content_type_value` | Expected content type (e.g. JSON)           | `"application/json"`       |
| `parser`             | Format parser (`JSON`, `CSV`, etc.)        | `"JSON"`                   |
| `scope`              | Ingestion scope (`ENVIRONMENT`, `HOST`)    | `"ENVIRONMENT"`            |

---

##  Metrics Extraction

| Variable             | Description                                 | Example                        |
|----------------------|---------------------------------------------|--------------------------------|
| `metrics_enabled`    | Toggles metric extraction                   | `true`                         |
| `metrics_key`        | Identifier key for the metric               | `"metric.event.key"`          |
| `metrics_matcher`    | Condition for extracting metric              | `"eventType == \"transaction\""` |
| `measure`            | Type of metric (`ATTRIBUTE`, `COUNT`, etc.) | `"ATTRIBUTE"`                 |
| `measure_attribute`  | Source attribute to measure                 | `"duration"`                  |

---

##  OneAgent Enrichment

| Variable               | Description                                      | Example      |
|------------------------|--------------------------------------------------|--------------|
| `oneagent_enabled`     | Enables OneAgent to capture the event locally   | `true`       |
| `category_source_type` | Category type source (`STATIC`, `DYNAMIC`)      | `"STATIC"`   |
| `event_data_fields`    | Map of event fields and their sources           | See below    |
| `provider_source`      | Provider label (e.g., `Dynatrace`)              | `"Dynatrace"`|
| `provider_source_type` | Type of provider source                         | `"STATIC"`   |
| `type_source`, `type_source_type` | Event type source                     | `"Transaction"`, `"STATIC"` |

 Example:
```hcl
event_data_fields = {
  eventType = {
    name = "eventType"
    source = {
      path        = "$.event.type"
      source      = "BODY"
      source_type = "JSON"
    }
  }
}
```

---

##  Trigger Matching

| Variable                  | Description                                  | Example               |
|---------------------------|----------------------------------------------|-----------------------|
| `trigger_type`            | Type of trigger logic (`STARTS_WITH`, `EQUALS`) | `"STARTS_WITH"`     |
| `trigger_case_sensitive`  | Enable case sensitivity                      | `false`               |
| `trigger_value`           | Value to match for trigger                   | `"event-trigger"`     |
| `trigger_data_source`     | Source to apply trigger matching (`BODY`)    | `"BODY"`              |

---

##  Outgoing Event Settings

If enabled, events are published externally from OneAgent.

| Variable                      | Description                                        | Example             |
|-------------------------------|----------------------------------------------------|---------------------|
| `outgoing_enabled`            | Toggle external push                              | `true`              |
| `outgoing_category_source`    | Category label                                     | `"Payment"`         |
| `outgoing_category_source_type` | Source type                                      | `"STATIC"`          |
| `outgoing_field_name`, `outgoing_field_path` | Field metadata                | `"outgoingField"`, `"$.outgoing.field"` |
| `outgoing_provider_source`, `outgoing_provider_source_type` | Third-party label | `"ThirdParty"`, `"STATIC"` |
| `outgoing_type_source`, `outgoing_type_source_type` | External event type        | `"Invoice"`, `"STATIC"` |
| `outgoing_trigger_type`, `outgoing_trigger_value`, `outgoing_trigger_data_source` | Match condition | `"EQUALS"`, `"invoice-sent"`, `"BODY"` |

---

##  Processing Script Block

Used for inline event filtering.

| Variable              | Description                      | Example                                  |
|-----------------------|----------------------------------|------------------------------------------|
| `processing_enabled`  | Enables script evaluation        | `true`                                   |
| `processing_matcher`  | Matcher expression               | `"status == \"complete\""`               |
| `processing_script`   | Code logic used to evaluate event | `"return payload.status == 'complete';"` |
| `sample_event`        | Event sample used in test UI     | `"{ \"status\": \"complete\" }"`         |

---

##  Transformation Fields

Defines custom data types parsed from event payload.

 Example:
```hcl
transformation_fields = {
  amount = {
    name     = "amount"
    type     = "double"
    array    = false
    optional = true
    readonly = false
  }
}
```

---

##  Security Context Matching

| Variable | Description | Example |
|----------|-------------|---------|
| `security_query` | Query condition to filter secure events | `"user.role == 'admin'"` |
| `security_value_source_field` | Field used for comparison | `"role"` |
| `security_value_source` | Source of the field (`BODY`, `HEADER`, etc.) | `"BODY"` |

---

##  Outputs

| Output Name | Description |
|-------------|-------------|
| `rule_name` | Name of the created event rule |

---

