#!/bin/bash

# Stress test using curl with parameters

if [ $# -ne 1 ]; then
    echo "Usage: $0 <target_url>"
    exit 1
fi

TARGET_URL=$1

response=$(curl -s -o /dev/null -w "%{http_code}" $TARGET_URL)

if [[ $response -ne 200 ]]; then
    echo "Website did not respond successfully. HTTP Status Code: $response"
    exit 1
else
    echo "Website responded!"
    exit 0
fi