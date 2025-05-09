
## Overview

This Terraform configuration is designed to manage various Dynatrace tokens and settings. It includes resources for creating and managing ActiveGate tokens, AG tokens, API tokens, and token settings.

## What Will Be Created

1. **ActiveGate Token**:
   - **Resource**: `dynatrace_activegate_token`
   - **Description**: Manages the ActiveGate token with configurations for manual enforcement and expiring token notifications.

2. **AG Token**:
   - **Resource**: `dynatrace_ag_token`
   - **Description**: Creates an AG token with specified type, expiration date, and name.

3. **API Token**:
   - **Resource**: `dynatrace_api_token`
   - **Description**: Manages the API token with specified name, enabled status, and scopes.

4. **Token Settings**:
   - **Resource**: `dynatrace_token_settings`
   - **Description**: Configures token settings including new token format and personal tokens.

5. **Data Sources**:
   - **Data Source**: `dynatrace_api_token`
   - **Description**: Retrieves an API token by name.
   - **Data Source**: `dynatrace_api_tokens`
   - **Description**: Retrieves all API tokens.

6. **Outputs**:
   - **ActiveGate Token**: Outputs the ActiveGate token details.
   - **AG Token**: Outputs the AG token details (sensitive).
   - **API Token**: Outputs the API token details (sensitive).
   - **Token Settings**: Outputs the token settings details.


## Notes

- **API Token Scopes**:
  - `dynatrace_activegate_token` requires `activeGateTokenManagement.create`, `activeGateTokenManagement.read`, and `activeGateTokenManagement.write`.
  - `dynatrace_ag_token` requires `activeGateTokenManagement.create`, `activeGateTokenManagement.read`, and `activeGateTokenManagement.write`.
  - `dynatrace_api_token` requires `apiTokens.read` and `apiTokens.write`.
  - `dynatrace_token_settings` requires `settings.read` and `settings.write`.

- **Sensitive Data**:
  - The usage of `dynatrace_ag_token` and `dynatrace_api_token` will introduce sensitive data within your Terraform state. The token property is flagged as sensitive, but the field will be stored as plain-text. More information can be found here.

## Dynatrace Documentation

- Tokens and authentication
- Settings API (schemaId: builtin:tokens.token-settings)

---

