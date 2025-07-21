
# Dynatrace OpenPipeline Resources

These resources configure pipelines and endpoints for ingesting business events, logs, security events, SDLC events, and general events into Dynatrace via OpenPipeline.

---

## `dynatrace_openpipeline_business_events`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_business_events`**: Set to `true` to enable the resource.
- **`business_event_pipelines`**: Define one or more pipelines with processing rules.

### Schema

#### Required
- `enabled` (Boolean)
- `display_name` (String)
- `id` (String)

#### Nested: `processing.processor.fields_remove_processor`
- `description` (String)
- `enabled` (Boolean)
- `fields` (List of String)
- `id` (String)
- `matcher` (String)

---

## `dynatrace_openpipeline_events`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_events`**: Set to `true` to enable the resource.
- **`events_endpoints`**: Define endpoints with routing.
- **`events_pipelines`**: Define pipelines.
- **`events_routing`**: Define routing entries.

### Schema

#### Required
- `enabled` (Boolean)
- `default_bucket` (String)
- `display_name` (String)
- `segment` (String)

#### Nested: `routing`
- `type` (String)
- `pipeline_id` (String)

#### Nested: `pipelines`
- `enabled` (Boolean)
- `display_name` (String)
- `id` (String)

#### Nested: `routing.entry`
- `enabled` (Boolean)
- `matcher` (String)
- `note` (String)
- `pipeline_id` (String)

---

## `dynatrace_openpipeline_logs`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_logs`**: Set to `true` to enable the resource.
- **`logs_pipelines`**: Define one or more log pipelines.

### Schema

#### Required
- `enabled` (Boolean)
- `display_name` (String)
- `id` (String)

---

## `dynatrace_openpipeline_security_events`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_security_events`**: Set to `true` to enable the resource.
- **`security_event_pipelines`**: Define one or more security event pipelines.

### Schema

#### Required
- `enabled` (Boolean)
- `display_name` (String)
- `id` (String)

---

## `dynatrace_openpipeline_sdlc_events`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_sdlc_events`**: Set to `true` to enable the resource.
- **`sdlc_endpoints`**: Define endpoints with routing.
- **`sdlc_pipelines`**: Define pipelines.
- **`sdlc_routing`**: Define routing entries.

### Schema

#### Required
- `display_name` (String)
- `enabled` (Boolean)
- `segment` (String)

#### Nested: `routing`
- `type` (String)
- `pipeline_id` (String)

#### Nested: `pipelines`
- `display_name` (String)
- `enabled` (Boolean)
- `id` (String)

#### Nested: `routing.entry`
- `enabled` (Boolean)
- `matcher` (String)
- `note` (String)
- `pipeline_id` (String)

---

## Data Source Usage

These resources do not have dedicated data sources. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export <resource_name>
```

Replace `<resource_name>` with the specific resource you want to export.

---
