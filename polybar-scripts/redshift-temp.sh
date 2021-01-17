#!/usr/bin/env sh
echo Redshift: $(sed 's/K//g' <<< "$(grep -o '[0-9].*K' <<< "$(redshift -p 2 -c ~/.redshiftgrc 2>/dev/null)")")K