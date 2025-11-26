#!/bin/bash

HOST=$1

if [ -z "$HOST" ]; then
  echo "Usage: $0 <host>"
  echo "Example: $0 my-app.apps.openshift.com"
  exit 1
fi

curl "https://$HOST/api/Todo" --insecure | jq .