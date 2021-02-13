#!/usr/bin/env bash
task_txt_full=$(tail -n1 ~/gtimelog/timelog.txt | awk -F': ' '{print $2}')
task_full_len=${#task_txt_full}

# not working
# limit text to full words, full string below 30 characters
#task_txt=$(echo "$task_txt_full" | awk -F"\t" '{
#    printf "%s\t", $1; system(sprintf("fold -sw 10 <<< \"%s\" | sed q", $2))
#}')

task_txt=$(echo "$task_txt_full" | cut -c -30)
task_trim_len=${#task_txt}
# if [[ $task_full_len gt $task_trim_len ]]; then
#    task_txt="$task_txt..."
# fi

task_date=$(tail -n1 ~/gtimelog/timelog.txt | awk -F': ' '{print $1}')

now=$(date '+%Y-%m-%d %H:%M')
task_time=$(datediff -f "%Hh%M" "$task_date" "$now")
echo "$task_txt ($task_time)"
