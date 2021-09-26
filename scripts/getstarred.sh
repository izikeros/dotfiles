#!/usr/bin/env bash
#
# get info on repositories starred by given user, output to stdout
#
# original file: getstarred.sh from: https://gist.github.com/juergenhoetzel/e8dc1d66de92717d49c60a2dafced725
# 2021-09-26: Krystian Safjan: Add: -H 'Accept: application/vnd.github.v3.star+json' to the request to obtain `starred_at` information
# see: https://gist.github.com/jasonrudolph/5abee158b42b99a3990a

user=izikeros
while curl -s "https://api.github.com/users/$user/starred?per_page=100&page=${page:-1}" -H 'Accept: application/vnd.github.v3.star+json'\
		    |jq -r -e '.[] | [.repo.name, .repo.description, .repo.full_name, .starred_at] | @csv'  && [[ ${PIPESTATUS[1]} != 4 ]]; do
    let page++
done

# try: cat my_starred.csv | sed 's/^\"//g' | sed 's/\",\"/\^/g' | sed 's/\"$//g' | awk -F"^" '{print $1 $3}' | rofi -dmenu -p "Choose file to edit:" -a 0 -no-custom