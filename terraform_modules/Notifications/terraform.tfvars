ansible_tower_active           = false
ansible_tower_name             = "Ansible Tower Notification"
ansible_tower_insecure         = true
ansible_tower_job_template_url = "https://localhost/#/templates/job_template/999"
ansible_tower_username         = "foo"
ansible_tower_password         = "bar"
ansible_tower_custom_message   = "some-custom-message"

email_active                 = false
email_name                   = "Email Notification"
email_subject                = "EMAIL-SUBJECT"
email_to                     = ["she@home.com", "me@home.com", "you@home.com"]
email_cc                     = ["she@home.org", "me@home.org", "you@home.org"]
email_bcc                    = ["she@home.gov", "me@home.gov", "you@home.gov"]
email_notify_closed_problems = true
email_body                   = "{ProblemDetailsHTML}"

jira_active      = false
jira_name        = "Jira Notification"
jira_url         = "https://localhost:9999/jira/#name#"
jira_username    = "jira-user-name"
jira_api_token   = "jira-api-token"
jira_project_key = "JIRA-PROJECT-KEY"
jira_issue_type  = "jira-issue-type"
jira_summary     = "jira-summary"
jira_description = "jira-description"

mobile_enabled = false

ops_genie_active  = false
ops_genie_name    = "OpsGenie Notification"
ops_genie_domain  = "opsgenie-domain"
ops_genie_message = "ops-genie-message"
ops_genie_api_key = "ops-genie-api-key"

pager_duty_active  = false
pager_duty_name    = "PagerDuty Notification"
pager_duty_account = "pager-duty-account"
pager_duty_service = "pager-duty-service"
pager_duty_api_key = "pager-duty-api-key"

service_now_active    = false
service_now_name      = "ServiceNow Notification"
service_now_instance  = "service-now-instance"
service_now_username  = "service-now-username"
service_now_password  = "service-now-password"
service_now_message   = "service-now-message"
service_now_incidents = true
service_now_events    = true

slack_active  = false
slack_name    = "Slack Notification"
slack_url     = "https://slack.home.com"
slack_channel = "#general"
slack_message = "slack-message"

trello_active              = false
trello_name                = "Trello Notification"
trello_application_key     = "trello-application-key"
trello_board_id            = "trello-board-id"
trello_list_id             = "trello-list-id"
trello_resolved_list_id    = "trello-resolved-list-id"
trello_text                = "trello-text"
trello_description         = "trello-description"
trello_authorization_token = "trello-authorization-token"

victor_ops_active      = false
victor_ops_name        = "VictorOps Notification"
victor_ops_api_key     = "victor-ops-api-key"
victor_ops_routing_key = "victor-ops-routing-key"
victor_ops_message     = "victor-ops-message"

webhook_active                 = false
webhook_name                   = "Webhook Notification"
webhook_url                    = "https://webhook.site/#name#"
webhook_insecure               = true
webhook_notify_event_merges    = true
webhook_notify_closed_problems = true
webhook_payload                = "web-hook-payload"
webhook_header_name_01         = "http-header-name-01"
webhook_header_value_01        = "http-header-value-01"
webhook_header_name_02         = "http-header-name-02"
webhook_header_value_02        = "http-header-value-02"
webhook_use_oauth_2            = true
webhook_access_token_url       = "https://www.google.com"
webhook_client_id              = "terraform"
webhook_client_secret          = "#######"

xmatters_active          = false
xmatters_name            = "xMatters Notification"
xmatters_url             = "https://webhook.site/#name#"
xmatters_insecure        = true
xmatters_payload         = "x-matters-payload"
xmatters_header_name_01  = "http-header-name-01"
xmatters_header_value_01 = "http-header-value-01"
xmatters_header_name_02  = "http-header-name-02"
xmatters_header_value_02 = "http-header-value-02"

alerting_name = "Default Alerting Profile"
