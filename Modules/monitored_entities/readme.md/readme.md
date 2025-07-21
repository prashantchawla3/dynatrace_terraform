

## `dynatrace_custom_device`

### Required API Token Scopes
- `settings.read`
- `settings.write`

---

### How to Determine tfvars Values

- **`custom_device_id`**: A unique identifier for the custom device.
- **`display_name`**: Human-readable name for the device.
- **`config_url`**: URL to the configuration page for the device.
- **`favicon_url`**: URL to the favicon image for the device.
- **`group`**: Logical group name to which the device belongs.
- **`props`**: Comma-separated key-value pairs for custom properties (e.g., `"key1=value1,key2=value2"`).
- **`type`**: Type identifier for the custom device.
- **`ui_based`**: Boolean indicating whether the device is UI-based.
- **`dns_names`**: List of DNS names associated with the device.
- **`ip_addresses`**: List of IP addresses associated with the device.
- **`listen_ports`**: List of ports the device listens on.

---

### Schema

#### Required
- `custom_device_id` (String): Unique ID for the custom device.
- `display_name` (String): Display name of the device.
- `config_url` (String): URL to the configuration page.
- `favicon_url` (String): URL to the favicon image.
- `group` (String): Group name for the device.
- `props` (String): Custom properties in key=value format.
- `type` (String): Type of the custom device.
- `ui_based` (Boolean): Whether the device is UI-based.

#### Optional
- `dns_names` (Block List): List of DNS names.
- `ip_addresses` (Block List): List of IP addresses.
- `listen_ports` (Block List): List of listening ports.

#### Read-Only
- `id` (String): The ID of the resource (automatically assigned).

---

### Nested Schema

#### `dns_names`
- `value` (String): A DNS name associated with the device.

#### `ip_addresses`
- `value` (String): An IP address associated with the device.

#### `listen_ports`
- `value` (Number): A port number the device listens on.

---

### Data Source Usage

This resource does not have a dedicated data source. To retrieve existing configurations, use:

```bash
terraform-provider-dynatrace -export dynatrace_custom_device
```

---

