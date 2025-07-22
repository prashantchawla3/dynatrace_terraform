calendar_name = "example-calendar"
valid_from    = "2023-07-31"
valid_to      = "2033-07-31"
week_days     = [1, 2, 3, 4, 5]
week_start    = 1

holidays = [
  { date = "2023-08-15", title = "Mariä Himmelfahrt" },
  { date = "2023-10-26", title = "Nationalfeiertag" }
]

rule_title = "example-rule"

recurrence = {
  datestart     = "2023-07-31"
  days_in_month = [-1]
  days_in_year  = [-2, -1, 1, 2, 3]
  frequency     = "WEEKLY"
  interval      = 33
  months        = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  weekdays      = ["MO", "TU", "WE"]
  weeks         = [-2, -1, 1, 2, 3]
  workdays      = "WORKING"
}

aws_connection = {
  name     = "aws-conn"
  type     = "webIdentity"
  role_arn = "arn:aws:iam::123456789012:role/helloworld"
}

jira = {
  name     = "jira-conn"
  type     = "basic"
  password = "your-password"
  url      = "https://www.example.com"
  user     = "user2"
}

k8s = {
  name      = "terraform1"
  uid       = "c6a3798e-634e-49fd-a3ca-00e5c16a1bf3"
  namespace = "terraform1"
  token     = "your-token"
}

slack = {
  name  = "slack-conn"
  token = "your-token"
}
