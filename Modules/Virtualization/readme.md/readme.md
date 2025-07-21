

#  Resource: `dynatrace_vmware`

##  Required API Token Scopes
- `settings.read`
- `settings.write`

##  How to Determine Values for `tfvars`

To configure the `vmware_configs` variable in your `terraform.tfvars` file:

- **enabled**: Set to `true` or `false` depending on whether you want the VMware monitoring integration to be active.
- **ipaddress**: Provide the IP address or hostname of the vCenter or standalone ESXi host.
- **label**: Choose a descriptive name for the connection.
- **password**: Provide the password for the vCenter or ESXi host (sensitive).
- **username**: Provide the username for the vCenter or ESXi host.
- **filter** *(optional)*: Use one of the following formats to filter:
  - `$prefix(parameter)`
  - `$eq(parameter)`
  - `$suffix(parameter)`
  - `$contains(parameter)`

Example structure for `vmware_configs`:
```hcl
vmware_configs = {
  "example1" = {
    enabled   = false
    ipaddress = "vcenter01"
    label     = "example"
    password  = "your-password-here"
    username  = "terraform"
    filter    = "$contains(Terraform)"
  }
}
```

##  Full Schema

###  Required Fields
- **enabled** `(Boolean)`: Whether the setting is enabled.
- **ipaddress** `(String)`: IP address or hostname of the vCenter or ESXi host.
- **label** `(String)`: Name for the connection.
- **password** `(String, Sensitive)`: Password for authentication.
- **username** `(String)`: Username for authentication.

### 🔹 Optional Fields
- **filter** `(String)`: Filter string using supported formats.

###  Read-Only Fields
- **id** `(String)`: The ID of the resource.

##  Using a `data` Block

To retrieve existing VMware configurations, use the `terraform-provider-dynatrace -export dynatrace_vmware` command. This will download all existing VMware configuration settings from Dynatrace.

For more information:
- VMware vSphere Monitoring Documentation
- Settings API Documentation (schemaId: `builtin:virtualization.vmware`)

---

