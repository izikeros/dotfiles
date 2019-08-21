#!/usr/bin/env bash
function date_offset(){
    offset=$1
    if [ -z ${offset} ]; then offset=0; fi
    DATE=$(date -d "${offset}days 13:00" +%Y-%m-%d)
    echo $DATE
 }

d_stop=`date_offset 0`
d_start=`date_offset -30`
user=$USER
projectId=6580
url="https://jiradc.int.net.nokia.com/secure/TimesheetReport!default.jspa?startDate=$d_start&endDate=$d_stop&reportKey=jira-timesheet-plugin:report&targetUser=$user&projectid=$projectId&weekends=&showDetails=&sum=day&sumSubTasks=true&reportingDay=0"

echo "Opening Jira report for user: $user in project: $projectId"
echo "Range of dates: $d_start to $d_stop"
xdg-open $url 2>/dev/null
echo $url
