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

curl "https://$HOST/api/Todo/$ID" --insecure | jq .