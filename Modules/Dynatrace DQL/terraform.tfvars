query = "fetch events | filter event.type == \"davis\" AND davis.status != \"CLOSED\" | fields timestamp, davis.title, davis.underMaintenance, davis.status | sort timestamp | limit 10"
default_sampling_ratio = 1
default_scan_limit_gbytes = 10
default_timeframe_end = ""
default_timeframe_start = ""
fetch_timeout_seconds = 60
locale = "en"
max_result_bytes = 1048576
max_result_records = 1000
request_timeout_milliseconds = 30000
timezone = "UTC"