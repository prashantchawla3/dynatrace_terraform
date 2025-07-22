
#  Dynatrace Monitored Technologies Module

This Terraform module provisions per-host technology monitoring configurations in Dynatrace. It allows teams to declaratively define which technologies are enabled for each host and provides optional toggling for .NET Core monitoring.

---

##  What This Module Does

This module defines the following:
- A `technologies_monitoring` block that maps host-level technology monitoring configuration
- Per-host enablement of monitoring and optional .NET Core instrumentation
- Output of configured technology keys for dynamic reuse

> This module does not make changes to external systems unless it is explicitly wired via provider modules such as `dynatrace_monitored_technologies`. Be sure your backend supports these resources if extending.

---

##  Module: `technologies_monitoring`

###  Resource Purpose

This module configures monitored technology settings for one or more hosts in Dynatrace. You can:
- Enable or disable general technology monitoring
- Optionally enable .NET Core monitoring (if applicable for that host type)

---

##  Variables

### `technologies`

| Field                | Type       | Required | Description |
|----------------------|------------|----------|-------------|
| `enabled`            | `bool`     | ✅       | Enables or disables general technology monitoring on the host |
| `host_id`            | `string`   | ✅       | Unique host identifier used to apply monitoring settings |
| `enabled_dot_net_core` | `bool`   | Optional | Enables .NET Core monitoring extension if available |

 **Structure**:
```hcl
technologies = {
  <label> = {
    enabled              = <bool>
    host_id              = <string>
    enabled_dot_net_core = <bool, optional>
  }
}
```

 **Example**:
```hcl
technologies = {
  java_host = {
    enabled              = true
    host_id              = "host-java-01"
    enabled_dot_net_core = false
  }

  dotnet_host = {
    enabled              = true
    host_id              = "host-dotnet-01"
    enabled_dot_net_core = true
  }

  php_host = {
    enabled = false
    host_id = "host-php-01"
  }
}
```

>  This configuration would enable technology monitoring for `host-java-01` and `host-dotnet-01`, with additional .NET Core monitoring for the latter. The `host-php-01` would be skipped due to `enabled = false`.

---

##  Outputs

### `configured_technologies`

Returns a list of keys from the configured `technologies` map. Useful for debugging, validations, or chaining logic in other modules.

 Example Output:
```hcl
["java_host", "dotnet_host", "php_host"]
```

---


##  Usage Example in `main.tf`

```hcl
module "technologies_monitoring" {
  source       = "./modules/dynatrace_monitored_technologies"
  technologies = var.technologies
}
```


---

##  Testing Your Configuration

After applying:
- Use `terraform output configured_technologies` to confirm loaded values
- Check Dynatrace UI or API (if wired) for monitoring status per host
- Validate `.NET Core` toggle aligns with environment architecture

---
