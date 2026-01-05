#!/bin/bash

#last to last month's last day
# A=$(date -d "$(date -d "- 1 month" +%Y-%m-01) - 1 day" '+%Y-%m-%d = %A')
# echo "$A"

specific_date="2025-12-25"
formatted_date=$(date -d "$specific_date" '+%A, %B %d, %s %a %b %c %j %U %w %Z')
echo "Formatted specific date: $formatted_date"

# I've updated your script with several useful date formatting examples. Here's what each format specifier means:

# %H:%M:%S - 24-hour time format (e.g., 14:30:45)
# %Y-%m-%d - Full date in ISO format (e.g., 2025-10-28)
# %A - Full day name (e.g., Tuesday)
# %B - Full month name (e.g., October)
# %s - Unix timestamp (seconds since epoch)
# Custom format %d/%m/%Y at %I:%M %p - (e.g., 28/10/2025 at 02:30 PM)
# Some additional useful date format specifiers you can use:

# %a - Abbreviated weekday name (Mon, Tue, etc.)
# %b - Abbreviated month name (Jan, Feb, etc.)
# %c - Locale's date and time representation
# %j - Day of year (001-366)
# %U - Week number of year (00-53)
# %w - Day of week (0-6, Sunday is 0)
# %Z - Timezone name