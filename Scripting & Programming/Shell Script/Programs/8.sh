#!/bin/bash

# Get current date in different formats
current_time=$(date +%H:%M:%S)
current_date=$(date +%Y/%m/%d)
day_of_week=$(date +%A)
month_name=$(date +%B)
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
unix_timestamp=$(date +%s)
custom_format=$(date '+%d/%m/%Y at %I:%M %p')

# Display all the different formats
echo "Current time: $current_time"
echo "Current date: $current_date"
echo "Day of week: $day_of_week"
echo "Month: $month_name"
echo "Full timestamp: $timestamp"
echo "Unix timestamp: $unix_timestamp"
echo "Custom format: $custom_format"

# Date arithmetic examples
echo -e "\nDate Arithmetic:"

# Add 7 days to current date
future_date=$(date -d "+7 days" '+%Y-%m-%d')
echo "Date after 7 days: $future_date"

# Subtract 1 month from current date
past_date=$(date -d "1 month ago" '+%Y-%m-%d')
echo "Date 1 month ago: $past_date"

# First day of current month
first_day=$(date -d "$(date +%Y-%m-01)")
echo "First day of this month: $first_day"

# Last day of current month
last_day=$(date -d "$(date -d "+1 month" +%Y-%m-01) - 1 day" '+%Y-%m-%d')
echo "Last day of this month: $last_day"

#Last to last month's last day
A=$(date -d "$(date -d "- 1 month" +%Y-%m-01) - 1 day" '+%Y-%m-%d')
echo "$A"

# Calculate days between two dates
start_date="2025-01-01"
end_date="2025-12-31"
days_between=$(( ($(date -d "$end_date" +%s) - $(date -d "$start_date" +%s)) / (60*60*24) ))
echo "Days between $start_date and $end_date: $days_between days"

# Get next Friday's date
next_friday=$(date -d "next friday" '+%Y-%m-%d')
echo "Next Friday will be: $next_friday"

# Check if current year is a leap year
year=$(date +%Y)
if (( year % 400 == 0 )) || (( year % 4 == 0 && year % 100 != 0 )); then
    echo "$year is a leap year"
else
    echo "$year is not a leap year"
fi

# Format a specific date
specific_date="2025-12-25"
formatted_date=$(date -d "$specific_date" '+%A, %B %d, %Y')
echo "Formatted specific date: $formatted_date"


# if [ "$time" -lt 12 ]; then
#     message="Good Morning User"
# elif [ "$time" -lt 18 ]; then
#     message="Good Afternoon User"
# else
#     message="Good Evening User"
# fi
# echo "$message $time hours"