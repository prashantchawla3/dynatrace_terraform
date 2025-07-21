
#  Resource: `dynatrace_platform_slo`

##  Required OAuth Scopes
- `slo:slos:read`
- `slo:slos:write`

##  How to Determine Values for `tfvars`
- **name**: Choose a descriptive name for the SLO.
- **description**: Optional description of the SLO.
- **tags**: Optional tags to categorize the SLO.
- **criteria**: Define `target`, `timeframe_from`, and optionally `timeframe_to` and `warning`.
- **custom_sli**: Provide a custom SLI expression.
- **sli_reference**: Use a template ID and define variables if using a predefined SLI template.

##  Full Schema

###  Required Fields
- **name** (String)
- **criteria** (Block List, Min: 1, Max: 1)
  - **criteria_detail** (Block List, Min: 1)
    - **target** (Number)
    - **timeframe_from** (String)

###  Optional Fields
- **description** (String)
- **tags** (Set of String)
- **custom_sli** (Block List, Max: 1)
  - **indicator** (String)
  - **filter_segments** (Optional)
    - **filter_segment**
      - **id** (String)
      - **variables**
        - **filter_segment_variable**
          - **name** (String)
          - **values** (Set of String)
- **sli_reference** (Block List, Max: 1)
  - **template_id** (String)
  - **variables**
    - **sli_reference_variable**
      - **name** (String)
      - **value** (String)

###  Read-Only Fields
- **id** (String)

##  Using a `data` Block
Use `data "dynatrace_platform_slo_template"` or `dynatrace_platform_slo_templates` to retrieve template IDs.

---

#  Resource: `dynatrace_slo_normalization`

##  Required API Token Scopes
- `settings.read`
- `settings.write`

##  How to Determine Values for `tfvars`
- **normalize**: Set to `true` to show error budget left as a percentage.

##  Full Schema

###  Required Fields
- **normalize** (Boolean)

###  Read-Only Fields
- **id** (String)

##  Using a `data` Block
Use the export utility with `-export dynatrace_slo_normalization` to retrieve existing configuration.

---

#  Resource: `dynatrace_slo_v2`
##  Required API Token Scopes
- `slo.read`
- `slo.write`
- `settings.read`
- `settings.write`

##  How to Determine Values for `tfvars`
- Define the SLO's name, metric expression, evaluation window, and thresholds.
- Use `filter` to target specific services.
- Configure `error_budget_burn_rate` settings.

##  Full Schema

###  Required Fields
- **enabled** (Boolean)
- **name** (String)
- **evaluation_type** (String)
- **evaluation_window** (String)
- **filter** (String)
- **metric_expression** (String)
- **target_success** (Number)
- **target_warning** (Number)
- **error_budget_burn_rate** (Block List, Min: 1)
  - **burn_rate_visualization_enabled** (Boolean)

###  Optional Fields
- **custom_description** (String)
- **legacy_id** (String)
- **metric_name** (String)
- **fast_burn_threshold** (Number)

###  Read-Only Fields
- **id** (String)

##  Using a `data` Block
Use `-export dynatrace_slo_v2` to retrieve existing SLO configurations.

---

#  Data Source: `dynatrace_platform_slo_template`

##  Required OAuth Scopes
- `slo:slos:read`
- `slo:objective-templates:read`

##  How to Determine Values for `tfvars`
- Provide the name of the SLO objective template to retrieve its ID.

##  Full Schema

###  Required Fields
- **name** (String)

###  Read-Only Fields
- **id** (String)

---

#  Data Source: `dynatrace_platform_slo_templates`

##  Required OAuth Scopes
- `slo:slos:read`
- `slo:objective-templates:read`

##  How to Determine Values for `tfvars`
- No input required. Use this to retrieve a list of all available templates.

##  Full Schema

###  Read-Only Fields
- **id** (String)
- **templates** (List of Object)
  - **id** (String)
  - **name** (String)

---

#  Data Source: `dynatrace_slo`

##  How to Determine Values for `tfvars`
- Provide the name of the SLO to retrieve its ID and metadata.

##  Full Schema

###  Required Fields
- **name** (String)

###  Read-Only Fields
- **id** (String)
- **description** (String)
- **enabled** (Boolean)
- **evaluation_type** (String)
- **evaluation_window** (String)
- **filter** (String)
- **metric_expression** (String)
- **metric_name** (String)
- **target_success** (Number)
- **target_warning** (Number)
- **legacy_id** (String)
- **burn_rate_visualization_enabled** (Boolean)
- **fast_burn_threshold** (Number)

---
