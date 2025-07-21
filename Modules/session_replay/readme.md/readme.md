

## `dynatrace_session_replay_resource_capture`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_resource_capturing`**: Set to `true` to enable resource capture for Session Replay.
- **`application_id`**: Use `"environment"` for global scope or specify a specific application ID.
- **`resource_capture_url_exclusion_pattern_list`**: Provide a list of URL patterns to exclude from resource capture.

### Schema

#### Required
- `enable_resource_capturing` (Boolean)

#### Optional
- `application_id` (String)
- `resource_capture_url_exclusion_pattern_list` (Set of String)

#### Read-Only
- `id` (String)

---

## `dynatrace_session_replay_web_privacy`

### Required API Token Scopes
- `settings.read`
- `settings.write`

### How to Determine tfvars Values
- **`enable_opt_in_mode`**: Set to `true` to require explicit activation of Session Replay.
- **`application_id`**: Use `"environment"` for global scope or specify a specific application ID.
- **`url_exclusion_pattern_list`**: List of URL patterns to exclude from Session Replay.
- **`masking_presets`**: Define masking behavior for recording and playback.

### Schema

#### Required
- `enable_opt_in_mode` (Boolean)
- `masking_presets` (Block List, Min: 1, Max: 1)

#### Optional
- `application_id` (String)
- `url_exclusion_pattern_list` (Set of String)

#### Read-Only
- `id` (String)

---

### Nested Schema: `masking_presets`

#### Required
- `playback_masking_preset` (String) — Values: `MASK_ALL`, `MASK_USER_INPUT`, `ALLOW_LIST`, `BLOCK_LIST`
- `recording_masking_preset` (String) — Values: `MASK_ALL`, `MASK_USER_INPUT`, `ALLOW_LIST`, `BLOCK_LIST`

#### Optional
- `playback_masking_allow_list_rules` (Block List, Max: 1)
- `playback_masking_block_list_rules` (Block List, Max: 1)
- `recording_masking_allow_list_rules` (Block List, Max: 1)
- `recording_masking_block_list_rules` (Block List, Max: 1)

---

### Nested Schema: `allow_list_rule` and `block_list_rule`

#### Required
- `target` (String) — Values: `ELEMENT`, `ATTRIBUTE`

#### Optional
- `css_expression` (String)
- `attribute_expression` (String)
- `hide_user_interaction` (Boolean) — Only for `block_list_rule`

---

## Data Source Usage

These resources do not have dedicated data sources. Use the following command to retrieve existing configurations:

```bash
terraform-provider-dynatrace -export dynatrace_session_replay_resource_capture
terraform-provider-dynatrace -export dynatrace_session_replay_web_privacy
```

---

