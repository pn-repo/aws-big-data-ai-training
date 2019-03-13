#!/usr/bin/env bash

cd src/main/python/function
zip -r function.zip  *

aws lambda create-function \
    --function-name lambda-function-in-python-hello \
    --runtime python3.6 \
    --role arn:aws:iam::252594130684:role/Politechnika  \
    --handler hello-lambda.my_handler \
    --timeout 15 \
    --memory-size 512 \
    --zip-file fileb://function.zip

aws lambda create-function \
    --function-name lambda-function-in-python-thumbnail \
    --runtime python3.6 \
    --role arn:aws:iam::252594130684:role/Politechnika  \
    --handler create-thumbnail.handler \
    --timeout 15 \
    --memory-size 512 \
    --zip-file fileb://function.zip

aws lambda create-function \
    --function-name lambda-function-in-python-context \
    --runtime python3.6 \
    --role arn:aws:iam::252594130684:role/Politechnika  \
    --handler context-lambda.get_my_log_stream \
    --timeout 15 \
    --memory-size 512 \
    --zip-file fileb://function.zip

rm -rf function.zip

echo -e "\nFunctions:"
aws lambda list-functions