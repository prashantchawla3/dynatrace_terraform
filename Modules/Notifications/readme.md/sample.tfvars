alerting_name = "Default Alerting Profile"

ansible_tower_active = true
ansible_tower_name = "Ansible Tower Notification"
ansible_tower_insecure = false
ansible_tower_job_template_url = "https://ansible.example.com/job_template"
ansible_tower_username = "ansible_user"
ansible_tower_password = "ansible_password"
ansible_tower_custom_message = "Custom message for Ansible Tower"

email_active = true
email_name = "Email Notification"
email_subject = "Alert Notification"
email_to = ["recipient@example.com"]
email_cc = ["cc@example.com"]
email_bcc = ["bcc@example.com"]
email_notify_closed_problems = true
email_body = "Email body content"

jira_active = true
jira_name = "Jira Notification"
jira_url = "https://jira.example.com"
jira_username = "jira_user"
jira_api_token = "jira_api_token"
jira_project_key = "PROJECT"
jira_issue_type = "Bug"
jira_summary = "Issue Summary"
jira_description = "Issue Description"

mobile_enabled = true

ops_genie_active = true
ops_genie_name = "OpsGenie Notification"
ops_genie_domain = "opsgenie.example.com"
ops_genie_message = "OpsGenie message content"
ops_genie_api_key = "opsgenie_api_key"

pager_duty_active = true
pager_duty_name = "PagerDuty Notification"
pager_duty_account = "pagerduty_account"
pager_duty_service = "pagerduty_service"
pager_duty_api_key = "pagerduty_api_key"

service_now_active = true
service_now_name = "ServiceNow Notification"
service_now_instance = "service_now_instance"
service_now_username = "service_now_user"
service_now_password = "service_now_password"
service_now_message = "ServiceNow message content"
service_now_incidents = true
service_now_events = true

slack_active = true
slack_name = "Slack Notification"
slack_url = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
slack_channel = "#alerts"
slack_message = "Slack message content"

trello_active = true
trello_name = "Trello Notification"
trello_application_key = "trello_application_key"
trello_board_id = "trello_board_id"
trello_list_id = "trello_list_id"
trello_resolved_list_id = "trello_resolved_list_id"
trello_text = "Trello card text"
trello_description = "Trello card description"
trello_authorization_token = "trello_authorization_token"

victor_ops_active = true
victor_ops_name = "VictorOps Notification"
victor_ops_api_key = "victor_ops_api_key"
victor_ops_routing_key = "victor_ops_routing_key"
victor_ops_message = "VictorOps message content"

webhook_active = true
webhook_name = "Webhook Notification"
webhook_url = "https://webhook.example.com"
webhook_insecure = false
webhook_notify_event_merges = true
webhook_notify_closed_problems = true
webhook_payload = "Webhook payload content"
webhook_header_name_01 = "Header-Name-1"
webhook_header_value_01 = "Header-Value-1"
webhook_header_name_02 = "Header-Name-2"
webhook_header_value_02 = "Header-Value-2"
webhook_use_oauth_2 = true
webhook_access_token_url = "https://oauth.example.com/token"
webhook_client_id = "webhook_client_id"
webhook_client_secret = "webhook_client_secret"

xmatters_active = true
xmatters_name = "xMatters Notification"
xmatters_url = "https://xmatters.example.com"
xmatters_insecure = false
xmatters_payload = "xMatters payload content"
xmatters_header_name_01 = "Header-Name-1"
xmatters_header_value_01 = "Header-Value-1"
xmatters_header_name_02 = "Header-Name-2"
xmatters_header_value_02 = "Header-Value-2"
