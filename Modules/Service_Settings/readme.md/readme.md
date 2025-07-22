
# Dynatrace Davis CoPilot Terraform Module

This Terraform module provisions the **Dynatrace Davis CoPilot** with tenant-aware AI and optional blocklist settings. It enables advanced AI-driven problem detection, root cause analysis, and automated remediation in your Dynatrace environment.

>  **No secrets or credentials are stored in this module.**

---

##  Resources Created

### `dynatrace_davis_copilot`

This resource enables and configures Davis CoPilot in your Dynatrace environment.

**Key capabilities:**
- Enables **Davis CoPilot**, Dynatrace's AI assistant for problem resolution.
- Activates **tenant-aware data mining**, ensuring AI insights are specific to your environment.
- Allows the configuration of **blocklist entries** to exclude sensitive data from AI analysis.

**Terraform Resource:**
```hcl
resource "dynatrace_davis_copilot" "this" {
  enable_copilot                   = var.enable_copilot
  enable_tenant_aware_data_mining = var.enable_tenant_aware_data_mining

  blocklist_entries {
    blocklist_entrie {
      name = var.blocklist_name
      type = var.blocklist_type
    }
  }
}
````

### `output "davis_copilot_id"`

Outputs the ID of the created Davis CoPilot resource for reference or for use in other modules.

```hcl
output "davis_copilot_id" {
  value = dynatrace_davis_copilot.this.id
}
```

---

##  Module Usage

### Example

```hcl
module "dynatrace_davis_copilot" {
  source = "./modules/dynatrace_davis_copilot"

  enable_copilot                   = true
  enable_tenant_aware_data_mining = true
  blocklist_name                  = "example_blocklist"
  blocklist_type                  = "TABLE"
}
```

---

##  Input Variables

| Name                              | Type     | Default Value            | Description                                                                                                                                       |
| --------------------------------- | -------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| `enable_copilot`                  | `bool`   | `true`                   | **Enable Davis CoPilot**. When set to `true`, Dynatrace will enable AI-driven problem detection and resolution using the Davis CoPilot assistant. |
| `enable_tenant_aware_data_mining` | `bool`   | `true`                   | **Enable tenant-aware AI**. When enabled, Davis CoPilot restricts data analysis to your specific environment for more accurate insights.          |
| `blocklist_name`                  | `string` | `"sensitive-data-block"` | **Name of the blocklist entry**. Used to identify the data you want to exclude from AI processing.                                                |
| `blocklist_type`                  | `string` | `"TABLE"`                | **Type of the blocklisted entity**. Options can be `"BUCKET"` or `"TABLE"`, depending on what you want to block from analysis.                    |

---

##  Variable Details & Examples

### `enable_copilot`

* **Type**: `bool`
* **Default**: `true`
* **Purpose**: Activates Davis CoPilot for advanced AI functionality.
* **Example**:

  ```hcl
  enable_copilot = true
  ```

---

### `enable_tenant_aware_data_mining`

* **Type**: `bool`
* **Default**: `true`
* **Purpose**: Enables tenant-scoped AI analysis to ensure the AI learns only from your own environment.
* **Example**:

  ```hcl
  enable_tenant_aware_data_mining = true
  ```

---

### `blocklist_name`

* **Type**: `string`
* **Default**: `"sensitive-data-block"`
* **Purpose**: Specifies a label to identify data sources you want to exclude from analysis.
* **Example**:

  ```hcl
  blocklist_name = "internal_finance_table"
  ```

---

### `blocklist_type`

* **Type**: `string`
* **Default**: `"TABLE"`
* **Purpose**: Declares the type of the blocklist entity. Valid values:

  * `"BUCKET"`
  * `"TABLE"`
* **Example**:

  ```hcl
  blocklist_type = "BUCKET"
  ```

---

##  Output

| Name               | Description                                       |
| ------------------ | ------------------------------------------------- |
| `davis_copilot_id` | The ID of the created Dynatrace CoPilot resource. |

---

## How to Use

1. Update or use the provided `sample.tfvars` file in the root directory to supply values for the modules.
2. All modules are already called in the `main.tf` file in the root.
3. You only need to run the following commands to deploy:

```bash
terraform init
terraform plan -var-file="readme.md/sample.tfvars"
terraform apply -var-file="readme.md/sample.tfvars"
```

---

##  Security Considerations

* No secrets are stored or required in this module.
* Always review what data is being processed by Davis CoPilot and consider using blocklists to prevent sensitive data exposure.

---

##  Project Structure

```
modules/
└── dynatrace_davis_copilot/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── README.md  <-- You are here
```

---

##  Support

If you encounter issues using this module:

* Ensure your Dynatrace provider is correctly configured.
* Double-check your variable values, especially blocklist types.
* Refer to the [Dynatrace Terraform Provider Documentation](https://registry.terraform.io/providers/dynatrace-oss/dynatrace/latest/docs) for any updates.

---

##  Best Practices

* Use meaningful `blocklist_name` values to clearly describe excluded data.
* Only enable features (`enable_copilot`, `enable_tenant_aware_data_mining`) that your organization has licensed and approved.
* Use a `.tfvars` file to manage multiple environment configurations (e.g., `dev.tfvars`, `prod.tfvars`).

---

