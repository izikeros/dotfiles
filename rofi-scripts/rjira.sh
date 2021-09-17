#!/usr/bin/env bash
jq -r '.issues[] | {key: .key, summary: .fields.summary, status: .fields.status.name}' ~/data/brain_fmt.json | grep -E 'key|summary|status' | awk 'NR%3{printf "%s ",$0;next;}1'| sed s/\"key\":// | sed s/\"summary\":// | sed s/\"status\":// | rofi -i -dmenu
