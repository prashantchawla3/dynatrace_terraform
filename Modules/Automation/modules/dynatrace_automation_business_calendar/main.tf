resource "dynatrace_automation_business_calendar" "calendar" {
  description = var.calendar_name
  title       = var.calendar_name
  valid_from  = var.valid_from
  valid_to    = var.valid_to
  week_days   = var.week_days
  week_start  = var.week_start

  holidays {
    dynamic "holiday" {
      for_each = var.holidays
      content {
        date  = holiday.value.date
        title = holiday.value.title
      }
    }
  }
}