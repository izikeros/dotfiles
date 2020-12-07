#!/usr/bin/env bash
# requires pipdeptree python package installed

BACK_1=pip_before_update_top_level.txt
BACK_2=pip_before_after_update_top_level.txt
OUT=/tmp/pip_outdated.txt
TOP=/tmp/pip_top_level.txt
UP_TOP=/tmp/pip_upgrade_top.txt
UP_NO_TOP=/tmp/pip_upgrade_no_top.txt

# phase 1 - upgrade top-level packages
echo "saving list of packages before top-level upgrade $BACK_1"
pip freeze > "$BACK_1"

echo "creating list of outdated packages"
pip list --outdated --format=freeze | awk -F'==' '{print $1}' | sort > "$OUT"
echo "creating list of top-level packages"
pipdeptree -fl | grep -P '^\w' | awk -F'==' '{print $1}' | sort > "$TOP"
echo "finding top-level packages to update, saving list to: $UP_TOP"
comm -12 "$OUT" "$TOP" | sort | tee "$UP_TOP"
pip install --upgrade < "$UP_TOP"

# phase 2 - upgrade no top-level packages
#echo "=== PHASE 2 upgrade no top-level packages"
#echo "saving list of packages after top-level upgrade $BACK_2"
#pip freeze > "$BACK_2"
#echo "creating list of outdated packages"
#pip list --outdated --format=freeze | awk -F'==' '{print $1}' | sort > "$OUT"
#echo "finding no top-level packages to update, saving list to: $UP_NO_TOP"
#comm -23 "$OUT" "$TOP" | sort | tee "$UP_NO_TOP"
#pip install --upgrade < "$UP_NO_TOP"

