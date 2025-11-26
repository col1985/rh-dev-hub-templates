#!/bin/bash

HOST=$1
ID=$2

if [ -z "$HOST" ]; then
  echo "Usage: $0 <host>"
  echo "Example: $0 my-app.apps.openshift.com"
  exit 1
fi

if [ -z "$ID" ]; then
  echo "TASK_ID is required."
  exit 1
fi

TITLE=$(curl -k https://${HOST}/api/Todo/${ID} | jq .title --raw-output)

curl -X PUT "https://$HOST/api/Todo/${ID}" \
     -H "Content-Type: application/json" \
     -d '{
           "id": "'"${ID}"'",
           "title": "'"${TITLE}"'",
           "isComplete": true
         }' \
     --insecure && \
    curl -k https://${HOST}/api/Todo/${ID} | jq .

