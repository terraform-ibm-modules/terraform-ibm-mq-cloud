#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

APIKEY=${1}
KEYNAME=${2}
HREF=${3}

BEARER=$(curl -X POST   "https://iam.cloud.ibm.com/identity/token"   --header 'Content-Type: application/x-www-form-urlencoded'   --header 'Accept: application/json'   --data-urlencode 'grant_type=urn:ibm:params:oauth:grant-type:apikey'   --data-urlencode 'apikey='"${APIKEY}" 2>/dev/null | jq .access_token | sed 's/^"//' | sed 's/"$//')  # pragma: allowlist secret

# shellcheck disable=SC2086
KEY=$(curl -X POST --location --header "Authorization: Bearer ${BEARER}"   --header "Accept: application/json"   --header "Content-Type: application/json"   --data '{ "name": "'${KEYNAME}'" }'   "${HREF}" 2>/dev/null)

echo "${KEY}"
