#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

eval "$(jq -r '@sh "APIKEY=\(.apikey) HREF=\(.href)"')"

BEARER=$(curl -X POST   "https://iam.cloud.ibm.com/identity/token"   --header 'Content-Type: application/x-www-form-urlencoded'   --header 'Accept: application/json'   --data-urlencode 'grant_type=urn:ibm:params:oauth:grant-type:apikey'   --data-urlencode 'apikey='"${APIKEY}" 2>/dev/null | jq .access_token | sed 's/^"//' | sed 's/"$//') # pragma: allowlist secret
CONNECTION=$(curl -X GET --location --header "Authorization: Bearer ${BEARER}"   --header "Accept: application/json"   "${HREF}" 2>/dev/null)

# shellcheck disable=SC2086
# jq flattens json structure
# jq then marshalls the numbers
# flatten is the same for both connection or error, caller to determine how to process output
echo "${CONNECTION}" | jq '[paths(scalars) as $path | { ($path | map(tostring) | join("_")): getpath($path) } ] | add' |  jq 'walk(if type == "number" then tostring else . end)'
