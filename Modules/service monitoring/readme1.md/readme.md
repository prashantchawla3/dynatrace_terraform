

# Dynatrace Terraform Module

## Introduction
This repository contains a Terraform module for deploying and managing various Dynatrace resources. The module is designed to simplify the configuration and management of these functionalities using Terraform.

## Table of Contents
- Introduction
- Requirements
- Providers
- Resources
- Inputs
- Outputs
- Usage

## Requirements
- Terraform >= 0.12
- Dynatrace account

## Providers
The module requires the following provider:
```hcl
terraform {
  required_providers {
    dynatrace = {
      source = "dynatrace-oss/dynatrace"
      version = "~> 1.0"
    }
  }
}
```

## Resources
The following resources are created by this module:
- `dynatrace_api_detection`
- `dynatrace_calculated_service_metric`
- `dynatrace_key_requests`
- `dynatrace_muted_requests`
- `dynatrace_request_attribute`
- `dynatrace_service_naming`
- `dynatrace_url_based_sampling`

## Inputs
### API Detection Variables
| Name                     | Description                                           | Type    | Default               |
|--------------------------|-------------------------------------------------------|---------|-----------------------|
| `api_color`              | Color used to highlight APIs                          | `string`| `"#5ead35"`           |
| `api_name`               | Name of the API                                       | `string`| `"example-api"`       |
| `third_party_api`        | Indicates if the API is a third-party library         | `bool`  | `false`               |
| `technology`             | Restricts the rule to a specific technology           | `string`| `"Go"`                |
| `condition_base`         | Base condition for API detection                      | `string`| `"PACKAGE"`           |
| `condition_matcher`      | Matcher for the condition                             | `string`| `"BEGINS_WITH"`       |
| `condition_pattern`      | Pattern for the condition                             | `string`| `"com.terraform"`     |

### Calculated Service Metric Variables
| Name                     | Description                                           | Type    | Default               |
|--------------------------|-------------------------------------------------------|---------|-----------------------|
| `metric_name`            | Displayed name of the metric                          | `string`| `"example-metric"`    |
| `metric_enabled`         | Indicates if the metric is enabled                    | `bool`  | `true`                |
| `management_zones`       | Management zones for the metric                       | `list(string)`| `["AAAA"]`       |
| `metric_key`             | Key of the calculated service metric                  | `string`| `"calc:service.example-metric"`|
| `metric_unit`            | Unit of the metric                                    | `string`| `"MILLI_SECOND_PER_MINUTE"`|
| `condition_attribute`    | Attribute for the condition                           | `string`| `"HTTP_REQUEST_METHOD"`|
| `comparison_negate`      | Negate the comparison                                 | `bool`  | `false`               |
| `http_method_operator`   | Operator for HTTP method comparison                   | `string`| `"EQUALS_ANY_OF"`     |
| `http_method_values`     | Values for HTTP method comparison                     | `list(string)`| `["POST", "GET"]`|
| `metric_definition_metric`| Metric to be captured                                | `string`| `"REQUEST_ATTRIBUTE"` |
| `metric_definition_request_attribute`| Request attribute to be captured          | `string`| `"foo"`               |

### Key Requests Variables
| Name                     | Description                                           | Type    | Default               |
|--------------------------|-------------------------------------------------------|---------|-----------------------|
| `service_id`             | ID of Dynatrace Service                               | `string`| `"SERVICE-123ABC45678EFGH"`|
| `key_request_ids`        | IDs of the key requests                               | `map(string)`| `{ "key1" = "value1", "key2" = "value2" }`|
| `key_request_names`      | Names of the key requests                             | `set(string)`| `["key_request_1", "key_request_2"]`|

### Muted Requests Variables
| Name                     | Description                                           | Type    | Default               |
|--------------------------|-------------------------------------------------------|---------|-----------------------|
| `service_id`             | Scope of the settings                                 | `string`| `"SERVICE-123ABC45678EFGH"`|
| `muted_request_names`    | Names of muted requests                               | `set(string)`| `["/healthcheck", "/heartbeat"]`|

### Request Attribute Variables
| Name                     | Description                                           | Type    | Default               |
|--------------------------|-------------------------------------------------------|---------|-----------------------|
| `request_attribute_name` | Name of the request attribute                         | `string`| `"example-attribute"` |
| `request_attribute_enabled`| Indicates if the request attribute is enabled       | `bool`  | `true`                |
| `request_attribute_aggregation`| Aggregation type for the request values         | `string`| `"FIRST"`             |
| `request_attribute_confidential`| Confidential data flag                         | `bool`  | `false`               |
| `request_attribute_data_type`| Data type of the request attribute                 | `string`| `"STRING"`            |
| `request_attribute_normalization`| String values transformation                   | `string`| `"ORIGINAL"`          |
| `request_attribute_skip_personal_data_masking`| Personal data masking flag        | `bool`  | `false`               |
| `data_source_enabled`    | Indicates if the data source is enabled               | `bool`  | `true`                |
| `data_source_source`     | Source of the attribute to capture                    | `string`| `"METHOD_PARAM"`      |
| `data_source_technology` | Technology of the method to capture                   | `string`| `"DOTNET"`            |
| `method_capture`         | What to capture from the method                       | `string`| `"CLASS_NAME"`        |
| `method_argument_types`  | Argument types for the method                         | `list(string)`| `["!0", "System.Func`2<!0,System.Threading.Tasks.Task>"]`|
| `method_class_name`      | Class name where the method resides                   | `string`| `"NServiceBus.Pipeline.Behavior`1"`|
| `method_method_name`     | Name of the method to capture                         | `string`| `"Invoke"`            |
| `method_return_type`     | Return type of the method                             | `string`| `"System.Threading.Tasks.Task"`|
| `method_visibility`      | Visibility of the method                              | `string`| `"PUBLIC"`            |
| `value_processing_split_at`| Split string values at this separator               | `string`| `"t"`                 |
| `value_processing_trim`  | Prune Whitespaces                                     | `bool`  | `true`                |
| `value_processing_value_extractor_regex`| Extract value from captured data per regex| `string`| `"s(.*+)"`          |
| `extract_substring_delimiter`| Delimiter string                                  | `string`| `"h"`                 |
| `extract_substring_position`| Position of the extracted string relative to delimiters| `string`| `"BEFORE"`         |
| `value_condition_negate` | Negate the comparison                                 | `bool`  | `false`               |
| `value_condition_operator`| Operator of the comparison                           | `string`| `"ENDS_WITH"`         |
| `value_condition_value`  | Value to compare to                                   | `string`| `"gh"`                |

### Service Naming Variables
| Name                     | Description                                           | Type    | Default               |
|--------------------------|-------------------------------------------------------|---------|-----------------------|
| `service_naming_name`    | Name of the rule                                      | `string`| `"example-service"`   |
| `service_naming_enabled` | Indicates if the rule is enabled                      | `bool`  | `true`                |
| `service_naming_format`  | Name to be assigned to matching entities              | `string`| `"ABCD"`              |
| `service_naming_key_type`| Type of the key                                       | `string`| `"STATIC"`            |
| `service_naming_key_attribute`| Attribute of the key                             | `string`| `"SERVICE_TYPE"`      |
| `service_naming_service_type_negate`| Negate the comparison                      | `bool`  | `false`               |
| `service_naming_service_type_operator`| Operator of the comparison               | `string`| `"EQUALS"`            |
| `service_naming_service_type_value`| Value to compare to                         | `string`| `"WEB_REQUEST_SERVICE"`|

### URL Based Sampling Variables
| Name                     | Description                                           | Type    | Default               |
|--------------------------|-------------------------------------------------------|---------|-----------------------|
| `url_based_sampling_enabled`| Indicates if the setting is enabled                | `bool`  | `true`                |
| `url_based_sampling_factor`| Scaling factor for the current sampling rate        | `string`| `"ReduceCapturingByFactor16"`|
| `url_based_sampling_http_method_any`| Scaling factor applied to any HTTP method  | `bool`  | `true`                |
| `url_based_sampling_ignore`| Indicates if matching URLs will always be ignored   | `bool`  | `false`               |
| `url_based_sampling_path`| Path of the URL  


## API Token Scopes
This resource requires the API token scopes:
- Read settings (`settings.read`)
- Write settings (`settings.write`)

Make sure your API token includes these scopes to successfully create and manage the Dynatrace resources.

This resource requires the API token scopes:
- Read configuration (`ReadConfig`)
- Capture request data (`CaptureRequestData`)
- Write configuration (`WriteConfig`)
