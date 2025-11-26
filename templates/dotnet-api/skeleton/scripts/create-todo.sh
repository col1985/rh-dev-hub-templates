#!/bin/bash

HOST=$1
TASK=$2

if [ -z "$HOST" ]; then
  echo "Usage: $0 <host>"
  echo "Example: $0 my-app.apps.openshift.com"
  exit 1
fi

if [ -z "$TASK" ]; then
  TASK="Hello World"
fi

curl -X POST "https://$HOST/api/Todo" \
  -H "Content-Type: application/json" \
  -d '{
        "title": "'"${TASK}"'",
        "isComplete":false
      }' \
  --insecure | jq .