#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

eval "$(jq -r '@sh "APIKEY=\(.apikey) HREF=\(.href)"')"

BEARER=$(curl -X POST   "https://iam.cloud.ibm.com/identity/token"   --header 'Content-Type: application/x-www-form-urlencoded'   --header 'Accept: application/json'   --data-urlencode 'grant_type=urn:ibm:params:oauth:grant-type:apikey'   --data-urlencode 'apikey='"${APIKEY}" 2>/dev/null | jq .access_token | sed 's/^"//' | sed 's/"$//') # pragma: allowlist secret

# echo $BEARER

CERT_STREAM=$(curl -X GET --location --header "Authorization: Bearer ${BEARER}"   --header "Accept: application/octet-stream"   "${HREF}" 2>/dev/null)

# shellcheck disable=SC2086
echo '{"certificate":"'${CERT_STREAM}'"}'