resource "dynatrace_automation_scheduling_rule" "rule" {
  business_calendar = dynatrace_automation_business_calendar.calendar.id
  title             = var.rule_title

  recurrence {
    datestart     = var.recurrence.datestart
    days_in_month = var.recurrence.days_in_month
    days_in_year  = var.recurrence.days_in_year
    frequency     = var.recurrence.frequency
    interval      = var.recurrence.interval
    months        = var.recurrence.months
    weekdays      = var.recurrence.weekdays
    weeks         = var.recurrence.weeks
    workdays      = var.recurrence.workdays
  }
}