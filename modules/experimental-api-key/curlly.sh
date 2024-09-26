#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

eval "$(jq -r '@sh "APIKEY=\(.apikey) HREF=\(.href) KEYNAME=\(.key_name)"')"

# BEARER=$(curl -X POST   "https://iam.cloud.ibm.com/identity/token"   --header 'Content-Type: application/x-www-form-urlencoded'   --header 'Accept: application/json'   --data-urlencode 'grant_type=urn:ibm:params:oauth:grant-type:apikey'   --data-urlencode 'apikey='"${APIKEY}" 2>/dev/null | jq .access_token | sed 's/^"//' | sed 's/"$//')  # pragma: allowlist secret

# KEY=`curl -X POST --location --header "Authorization: Bearer ${BEARER}"   --header "Accept: application/json"   --header "Content-Type: application/json"   --data '{ "name": "'${KEYNAME}'" }'   "${HREF}" 2>/dev/null`

# TODO: This is a data source provisioning an APIKey. Which is wrong. data source is called alot, so alot of keys generated.
# This generates a new APIKey, there is no destroy function... override for testing
KEY='{"api_key_name":"fictional-api-key","api_key_id":"ApiKey-12345678-1234-1234-1234-123456789012","api_key":"_____ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890___"}' # pragma: allowlist secret

echo "${KEY}"
