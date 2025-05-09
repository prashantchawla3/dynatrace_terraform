

# Dynatrace Application Detection Rules Terraform Setup

## Overview

This Terraform configuration will create various Dynatrace resources to manage application detection rules, custom configuration properties, error rules, calculated web metrics, key user actions, auto injections, beacon endpoints, beacon origins, custom errors, custom injections, enablements, injection cookies, key performance metrics, request errors, and resource cleanups.

## Resources Created

When you apply this Terraform configuration, the following resources will be created:

1. **Application Detection Rules**
   - `dynatrace_application_detection_rule_v2`: Defines rules for detecting applications based on specified matchers and patterns.

2. **Custom Configuration Properties**
   - `dynatrace_web_app_custom_config_properties`: Adds custom configuration properties to web applications.

3. **Application Error Rules**
   - `dynatrace_application_error_rules`: Sets rules for capturing and alerting on custom and HTTP errors in web applications.

4. **Calculated Web Metrics**
   - `dynatrace_calculated_web_metric`: Defines calculated metrics for web applications, including dimensions and metric definitions.

5. **Key User Actions**
   - `dynatrace_key_user_action`: Identifies key user actions within web applications.

6. **Web App Auto Injection**
   - `dynatrace_web_app_auto_injection`: Configures automatic injection settings for web applications, including cache control headers and monitoring code.

7. **Web App Beacon Endpoints**
   - `dynatrace_web_app_beacon_endpoint`: Sets up beacon endpoints for web applications.

8. **Web App Beacon Origins**
   - `dynatrace_web_app_beacon_origins`: Defines origins for beacon data collection.

9. **Web App Custom Errors**
   - `dynatrace_web_app_custom_errors`: Configures custom error rules for web applications.

10. **Web App Custom Injection**
    - `dynatrace_web_app_custom_injection`: Sets custom injection rules for web applications.

11. **Web App Enablement**
    - `dynatrace_web_app_enablement`: Enables Real User Monitoring (RUM) and session replay for web applications.

12. **Web App Injection Cookies**
    - `dynatrace_web_app_injection_cookie`: Configures cookie settings for web applications.

13. **Web App Key Performance Metrics**
    - `dynatrace_web_app_key_performance_custom`: Defines custom key performance metrics.
    - `dynatrace_web_app_key_performance_load`: Sets key performance metrics for page load times.
    - `dynatrace_web_app_key_performance_xhr`: Configures key performance metrics for XHR requests.

14. **Web App Request Errors**
    - `dynatrace_web_app_request_errors`: Sets rules for handling request errors in web applications.

15. **Web App Resource Cleanup**
    - `dynatrace_web_app_resource_cleanup`: Configures resource cleanup rules for web applications.

## API Permissions

To create these resources, your API should have the following permissions:

- **Read and Write Access** to application detection rules.
- **Read and Write Access** to custom configuration properties.
- **Read and Write Access** to error rules.
- **Read and Write Access** to calculated web metrics.
- **Read and Write Access** to key user actions.
- **Read and Write Access** to auto injection settings.
- **Read and Write Access** to beacon endpoints and origins.
- **Read and Write Access** to custom errors and injections.
- **Read and Write Access** to enablement settings.
- **Read and Write Access** to injection cookies.
- **Read and Write Access** to key performance metrics.
- **Read and Write Access** to request errors.
- **Read and Write Access** to resource cleanup rules.

---

